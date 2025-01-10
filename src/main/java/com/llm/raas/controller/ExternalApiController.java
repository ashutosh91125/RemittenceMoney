package com.llm.raas.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.llm.transfer.model.Transfer;
import com.llm.transfer.repository.TransferRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.llm.raas.service.ExternalService;
import org.springframework.web.client.HttpClientErrorException;

@RestController
@RequestMapping("/api/v1/raas")
public class ExternalApiController {
	private static final Logger logger = LoggerFactory.getLogger(ExternalApiController.class);

	@Autowired
	private ExternalService externalApiService;

	@Autowired
	private TransferRepository transferRepository;

	@PostMapping("/quote")
	public ResponseEntity<?> getQuote(@RequestBody Map<String, Object> requestBody) {
		// Call external service
		Map<String, Object> response = externalApiService.callExternalApi(requestBody);

		if (response.containsKey("data")) {
			Map<String, Object> data = (Map<String, Object>) response.get("data");

			// Extract required fields
			String quoteId = (String) data.get("quote_id");
			Double totalPayinAmount = getAsDouble(data.get("total_payin_amount"));
			Double receivingAmount = getAsDouble(data.get("receiving_amount"));

			// Extract country and currency codes from requestBody for dynamic processing
			String sendingCountryCode = (String) requestBody.get("sending_country_code");
			String sendingCurrencyCode = (String) requestBody.get("sending_currency_code");
			String receivingCountryCode = (String) requestBody.get("receiving_country_code");
			String receivingCurrencyCode = (String) requestBody.get("receiving_currency_code");

			// Extract rates dynamically based on sending/receiving currency
			List<Map<String, Object>> fxRates = (List<Map<String, Object>>) data.get("fx_rates");
			Double exchangeRate = null;
			if (fxRates != null) {
				for (Map<String, Object> rate : fxRates) {
					if (sendingCurrencyCode.equals(rate.get("base_currency_code"))
							&& receivingCurrencyCode.equals(rate.get("counter_currency_code"))) {
						exchangeRate = getAsDouble(rate.get("rate"));
						break;
					}
				}
			}

			// Extract commission and tax amounts dynamically
			List<Map<String, Object>> feeDetails = (List<Map<String, Object>>) data.get("fee_details");
			Double commissionAmount = null;
			Double taxAmount = null;
			if (feeDetails != null) {
				for (Map<String, Object> fee : feeDetails) {
					if ("COMMISSION".equals(fee.get("type"))) {
						commissionAmount = getAsDouble(fee.get("amount"));
					} else if ("TAX".equals(fee.get("type"))) {
						taxAmount = getAsDouble(fee.get("amount"));
					}
				}
			}

			// Build response dynamically
			Map<String, Object> result = new HashMap<>();
			result.put("quote_id", quoteId);
			result.put("status", 200);
			result.put("total_payin_amount", totalPayinAmount);
			result.put("receiving_amount", receivingAmount);
			result.put("exchange_rate", exchangeRate);
			result.put("commission_amount", commissionAmount);
			result.put("tax_amount", taxAmount);
			result.put("sending_country_code", sendingCountryCode);
			result.put("receiving_country_code", receivingCountryCode);
			result.put("sending_currency_code", sendingCurrencyCode);
			result.put("receiving_currency_code", receivingCurrencyCode);

			return ResponseEntity.ok(result);
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Failed to get quote"));
		}
	}

	// Helper method to handle conversion of numeric values to Double
	private Double getAsDouble(Object value) {
		if (value instanceof Integer) {
			return ((Integer) value).doubleValue();
		} else if (value instanceof Double) {
			return (Double) value;
		} else if (value instanceof Long) {
			return ((Long) value).doubleValue();
		}
		return null; // or throw an exception if required
	}

	@PostMapping("/create-transaction")
	public ResponseEntity<?> createTransaction(@RequestBody Map<String, Object> requestBody) {
		try {
			logger.info(requestBody.toString());
			Map<String, Object> response = externalApiService.createTransaction(requestBody);

			if (response.containsKey("data")) {
				Map<String, Object> data = (Map<String, Object>) response.get("data");
				String transactionRefNumber = (String) data.get("transaction_ref_number");
				String state = (String) data.get("state");
				String subState = (String) data.get("sub_state");

				return ResponseEntity.ok(Map.of(
						"transaction_ref_number", transactionRefNumber,
						"state", state,
						"sub_state", subState,
						"status", 200
				));
			} else {
				// Handle error response properly
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
			}
		} catch (HttpClientErrorException e) {
			// Log the error and return the original error response
			logger.error("Error occurred: {}", e.getMessage(), e);
			return ResponseEntity.status(e.getStatusCode()).body(e.getResponseBodyAsString());
		} catch (Exception e) {
			// Handle unexpected exceptions
			logger.error("Unexpected error: {}", e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(Map.of("message", "An unexpected error occurred."));
		}
	}

	@PostMapping("/confirm-transaction")
	public Map<String, Object> confirmTransaction(@RequestBody Map<String, Object> requestBody) {
		return externalApiService.confirmTransaction(requestBody);
	}

	@GetMapping("/enquire-transaction")
	public ResponseEntity<?> enquireTransaction(@RequestParam("transaction_ref_number") String transactionRefNumber) {

		Map<String, Object> response = externalApiService.enquireTransaction(transactionRefNumber);

		if (response.containsKey("data")) {
			Map<String, Object> data = (Map<String, Object>) response.get("data");
//			String transRefNumber = (String) data.get("transaction_ref_number");
			String state = (String) data.get("state");
			String subState = (String) data.get("sub_state");

			state = state.replace("_", " ");
			subState = subState.replace("_", " ");

			Optional<Transfer> transfer = transferRepository.findTransactionByTransactionReferenceNumber(transactionRefNumber);
			if (transfer.isPresent()){
				transfer.get().setTransactionState(state);
				transfer.get().setTransactionSubState(subState);

				transferRepository.save(transfer.get());
			}

			return ResponseEntity.ok(Map.of(
					"transaction_ref_number", transactionRefNumber,
					"state", state,
					"sub_state", subState,
					"status", 200
			));
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Enquiry Failed!"));
		}
	}

	@GetMapping("/transaction-receipt")
	public Map<String, Object> getTransactionReceipt(
			@RequestParam("transaction_ref_number") String transactionRefNumber) {
		return externalApiService.getTransactionReceipt(transactionRefNumber);
	}

	@PostMapping("/cancel-transaction")
	public Map<String, Object> cancelTransaction(@RequestBody Map<String, Object> requestBody) {
		return externalApiService.cancelTransaction(requestBody);
	}

	@GetMapping("/fetch-rates")
	public Map<String, Object> fetchRates() {
		return externalApiService.getRates();
	}

	@GetMapping("/fetch-banks")
	public Map<String, Object> fetchBanks(@RequestParam String receivingCountryCode,
			@RequestParam String receivingMode) {
		return externalApiService.getBanks(receivingCountryCode, receivingMode);
	}

	@GetMapping("/fetch-bank-branches")
	public Map<String, Object> fetchBankBranches(@RequestParam String bankId, @RequestParam String receivingCountryCode,
			@RequestParam String correspondent, @RequestParam String receivingMode) {
		return externalApiService.getBankBranches(bankId, receivingCountryCode, correspondent, receivingMode);
	}

}
