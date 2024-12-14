package com.llm.raas.controller;

import java.util.Map;

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

@RestController
@RequestMapping("/api/v1/raas")
public class ExternalApiController {
	private static final Logger logger = LoggerFactory.getLogger(ExternalApiController.class);

	@Autowired
	private ExternalService externalApiService;

	@PostMapping("/quote")
	public ResponseEntity<?> getQuote(@RequestBody Map<String, Object> requestBody) {
		// Call external service
		Map<String, Object> response = externalApiService.callExternalApi(requestBody);

		if (response.containsKey("data")) {
			Map<String, Object> data = (Map<String, Object>) response.get("data");
			String quoteId = (String) data.get("quote_id");

			return ResponseEntity.ok(Map.of("quote_id", quoteId, "status", 200));
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Failed to get quote"));
		}
	}

	@PostMapping("/create-transaction")
	public ResponseEntity<?> createTransaction(@RequestBody Map<String, Object> requestBody) {
		logger.info(requestBody.toString());
		// Call external service
		Map<String, Object> response = externalApiService.createTransaction(requestBody);

		if (response.containsKey("data")) {
			Map<String, Object> data = (Map<String, Object>) response.get("data");
			String transactionRefNumber = (String) data.get("transaction_ref_number");

			return ResponseEntity.ok(Map.of("transaction_ref_number", transactionRefNumber, "status", 200));
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("error", "Failed to create transaction"));
		}
	}

	@PostMapping("/confirm-transaction")
	public Map<String, Object> confirmTransaction(@RequestBody Map<String, Object> requestBody) {
		return externalApiService.confirmTransaction(requestBody);
	}

	@GetMapping("/enquire-transaction")
	public Map<String, Object> enquireTransaction(@RequestParam("transaction_ref_number") String transactionRefNumber) {
		return externalApiService.enquireTransaction(transactionRefNumber);
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
