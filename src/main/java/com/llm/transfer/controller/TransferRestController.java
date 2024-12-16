package com.llm.transfer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.llm.transfer.Service.TransferService;
import com.llm.transfer.model.Transfer;

@RestController
@RequestMapping("/api/v1/transfer")
public class TransferRestController {
	private static final Logger logger = LoggerFactory.getLogger(TransferRestController.class);
	@Autowired
	private TransferService transferService;

	@PostMapping
	public ResponseEntity<String> registerTransferredDetails(@RequestBody Transfer transfer) {
	    try {
	        transferService.createTransfer(transfer);
	        return ResponseEntity.ok("Transfer details registered successfully.");
	    } catch (Exception e) {
	        logger.error("Error while registering transfer details: ", e);
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST)
	                .body("An error occurred while registering transfer details. Please try again later.");
	    }
	}

}
