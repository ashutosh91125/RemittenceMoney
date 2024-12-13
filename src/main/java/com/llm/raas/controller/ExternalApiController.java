package com.llm.raas.controller;

import com.llm.raas.service.ExternalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/v1/raas")
public class ExternalApiController {

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
    public Map<String, Object> getTransactionReceipt(@RequestParam("transaction_ref_number") String transactionRefNumber) {
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
    public Map<String, Object> fetchBanks(
            @RequestParam String receivingCountryCode,
            @RequestParam String receivingMode) {
        return externalApiService.getBanks(receivingCountryCode, receivingMode);
    }

    @GetMapping("/fetch-bank-branches")
    public Map<String, Object> fetchBankBranches(
            @RequestParam String bankId,
            @RequestParam String receivingCountryCode,
            @RequestParam String correspondent,
            @RequestParam String receivingMode) {
        return externalApiService.getBankBranches(bankId, receivingCountryCode, correspondent, receivingMode);
    }

}
