package com.llm.transfer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.llm.transfer.Service.TransferService;
import com.llm.transfer.model.Transfer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/transfer")
public class TransferRestController {
	private static final Logger logger = LoggerFactory.getLogger(TransferRestController.class);
	@Autowired
	private TransferService transferService;

	@PostMapping
	public ResponseEntity<?> registerTransferredDetails(@RequestBody Transfer transfer) {
		Map<String, Object> response = new HashMap<>();

		try {
			transferService.createTransfer(transfer);
			response.put("status", "CREATED");
			response.put("message", "Transaction details saved successfully");
			return ResponseEntity.ok(response);
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


}
