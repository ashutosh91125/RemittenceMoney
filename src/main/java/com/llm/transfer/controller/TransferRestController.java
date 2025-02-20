package com.llm.transfer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.llm.agent.model.Agent;
import com.llm.agent.service.IAgentService;
import com.llm.model.response.ResponseDTO;
import com.llm.transfer.model.dto.UpdateTransactionStateDTO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
import com.llm.transfer.Service.TransferService;
import com.llm.transfer.model.Transfer;

@RestController
@RequestMapping("/api/v1/transfer")
public class TransferRestController {
	private static final Logger logger = LoggerFactory.getLogger(TransferRestController.class);
	@Autowired
	private TransferService transferService;

	@Autowired
	private StaffDetailsRepository staffDetailsRepository;

	@Autowired
	private IAgentService agentService;
	
	@Autowired
	private BranchDetailsRepository branchDetailsRepository;


	@PostMapping
	public ResponseEntity<?> registerTransferredDetails(@RequestBody Transfer transfer, HttpServletRequest servletRequest, HttpServletResponse servletResponse) {


		Map<String, Object> response = new HashMap<>();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		String selectedBranch = (String) servletRequest.getSession().getAttribute("selectedBranch");

		Optional<StaffDetails> byUsername = staffDetailsRepository.findByUsername(username);
		transfer.setAgentId(byUsername.get().getAgent());
		transfer.setStaffCountry(byUsername.get().getCountry());
		transfer.setBranchId(Long.valueOf(selectedBranch));
		transfer.setStaffId(byUsername.get().getId());
		transfer.setBranchLocationId(byUsername.get().getBranchLocationId());
		try {
			if (transfer.getPaymentStatus().equals("SUCCESS") || transfer.getPaymentStatus().equals("success")){
				Agent agent = agentService.getByBranchLocationId(transfer.getBranchLocationId());
				agent.setRemainingDaily(agent.getRemainingDaily() - transfer.getTotalPayInAmount());
				agent.setRemainingPerDayLimit(agent.getRemainingPerDayLimit() - transfer.getTotalPayInAmount());
				agent.setRemainingPerMonthLimit(agent.getRemainingPerMonthLimit() - transfer.getTotalPayInAmount());
				agentService.addAgent(agent);
			}

			transferService.createTransfer(transfer, servletRequest, servletResponse);
			response.put("status", "CREATED");
			response.put("message", "Transaction details saved successfully");
			return new ResponseEntity<>(response, HttpStatus.CREATED);
		} catch (Exception e) {
			logger.error("Error while registering transfer details: ", e);

			// Use refined error extraction
			String errorMessage = extractRelevantErrorMessage(e.getMessage());

			response.put("status", "BAD_REQUEST");
			response.put("message", "An error occurred while registering transfer details.");
			response.put("error", errorMessage);

			return ResponseEntity.badRequest().body(response);
		}
	}

	@GetMapping
	public ResponseEntity<List<Transfer>> getAllTransfers() {
		return ResponseEntity.ok(transferService.getAllTransfers());
	}

	private String extractRelevantErrorMessage(String exceptionMessage) {
		if (exceptionMessage == null || exceptionMessage.isEmpty()) {
			return "Unknown error occurred.";
		}

		// Check for "Detail:" and extract the part after it
		if (exceptionMessage.contains("Detail:")) {
			int detailIndex = exceptionMessage.indexOf("Detail:");
			String detailPart = exceptionMessage.substring(detailIndex + 7).trim();
			int endIndex = detailPart.indexOf("[");
			if (endIndex > 0) {
				return detailPart.substring(0, endIndex).trim();
			}
			return detailPart; // If no bracket is found, return the whole detail part
		}

		// Check for "constraint" or "duplicate key" errors
		if (exceptionMessage.toLowerCase().contains("duplicate key")) {
			return "Duplicate key error: " + exceptionMessage.split("constraint")[1].trim();
		}

		// Default fallback to the full message or a portion
		return exceptionMessage.split(":")[0]; // Get only the first part if no markers are found
	}

	@GetMapping("/transfer-details")
	public ResponseEntity<?> getTransferDetails(@RequestParam("transactionReferenceNumber") String transactionReferenceNumber) {
	    try {
	        Transfer transferDetails = transferService.getTransactionByTransactionReferenceNumber(transactionReferenceNumber);
	        return ResponseEntity.ok(transferDetails); // Return 200 OK with the transfer details
	    } catch (IllegalArgumentException e) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
	                             .body("No transfer details found for the given reference number: " + transactionReferenceNumber); // Return 404 Not Found with an error message
	    }
	}

	/**
	 * Endpoint to update transaction state and sub-state based on the reference number.
	 *
	 * @param requestDTO Request body containing transactionReferenceNumber, transactionState, and transactionSubState.
	 * @return ResponseEntity with the result of the operation.
	 */
	@PostMapping("/update-transaction-state")
	public ResponseEntity<ResponseDTO> updateTransactionState(
			@RequestBody UpdateTransactionStateDTO requestDTO) {
		ResponseDTO response = transferService.updateTransactionState(
				requestDTO.getTransactionReferenceNumber(),
				requestDTO.getTransactionState(),
				requestDTO.getTransactionSubState()
		);
		return ResponseEntity.status(response.getStatusCode()).body(response);
	}
}
