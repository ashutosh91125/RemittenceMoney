package com.llm.raas.controller;

import com.llm.raas.service.BankDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/banks")
public class BankDetailsController {

    @Autowired
    private BankDetailsService bankService;

    /**
     * Endpoint to fetch and store banks.
     *
     * @return Response as a map with a message and status.
     */
    @GetMapping("/fetch-bank")
    public ResponseEntity<Map<String, Object>> fetchAndStoreBanks(@RequestParam String receivingCountryCode,
                                                                  @RequestParam String receivingMode ) {
        Map<String, Object> response = new HashMap<>();

        try {
            // Call the service to fetch and store banks
            bankService.fetchAndStoreBanks(receivingCountryCode,receivingMode);

            // Prepare success response
            response.put("message", "Banks fetched and stored successfully.");
            response.put("status", HttpStatus.OK.value());
            return ResponseEntity.ok(response);

        } catch (HttpClientErrorException ex) {
            // Handle HTTP errors (e.g., 400 or 401)
            response.put("message", "HTTP Error: " + ex.getResponseBodyAsString());
            response.put("status", ex.getStatusCode().value());
            return ResponseEntity.status(ex.getStatusCode()).body(response);

        } catch (HttpServerErrorException ex) {
            // Handle server errors (e.g., 500)
            response.put("message", "Server Error: " + ex.getResponseBodyAsString());
            response.put("status", HttpStatus.INTERNAL_SERVER_ERROR.value());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);

        } catch (Exception ex) {
            // Handle generic exceptions
            response.put("message", "An unexpected error occurred: " + ex.getMessage());
            response.put("status", HttpStatus.INTERNAL_SERVER_ERROR.value());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    @GetMapping("/fetch-branches")
    public ResponseEntity<Map<String, Object>> fetchAndStoreBranches(
            @RequestParam String fetchBankId,
            @RequestParam String receivingCountryCode,
            @RequestParam String correspondent,
            @RequestParam String receivingMode) {

        Map<String, Object> response = new HashMap<>();

        try {
            // Call the service to fetch and store branches
            bankService.fetchAndStoreBranches(fetchBankId, receivingCountryCode, correspondent, receivingMode);

            // Prepare success response
            response.put("message", "Branches fetched and stored successfully.");
            response.put("status", HttpStatus.OK.value());
            return ResponseEntity.ok(response);

        } catch (HttpClientErrorException ex) {
            // Handle HTTP errors (e.g., 400 or 401)
            response.put("message", "HTTP Error: " + ex.getResponseBodyAsString());
            response.put("status", ex.getStatusCode().value());
            return ResponseEntity.status(ex.getStatusCode()).body(response);

        } catch (HttpServerErrorException ex) {
            // Handle server errors (e.g., 500)
            response.put("message", "Server Error: " + ex.getResponseBodyAsString());
            response.put("status", HttpStatus.INTERNAL_SERVER_ERROR.value());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);

        } catch (Exception ex) {
            // Handle generic exceptions
            response.put("message", "An unexpected error occurred: " + ex.getMessage());
            response.put("status", HttpStatus.INTERNAL_SERVER_ERROR.value());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

}
