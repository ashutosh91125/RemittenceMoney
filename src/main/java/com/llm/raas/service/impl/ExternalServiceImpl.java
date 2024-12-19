package com.llm.raas.service.impl;


import com.llm.common.service.TokenService;
import com.llm.raas.service.ExternalService;
import com.llm.transfer.model.Transfer;
import com.llm.transfer.repository.TransferRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class ExternalServiceImpl implements ExternalService {

    @Autowired
    private TokenService tokenService;

    @Autowired
    TransferRepository transferRepository;

    @Override
    public Map<String, Object> callExternalApi(Map<String, Object> requestBody) {
        String url = "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/quote";

        // Create headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", "VITCOMEX");
        headers.set("channel", "Direct");
        headers.set("company", "458100");
        headers.set("branch", "458302");
        headers.set("Authorization", "Bearer "+ tokenService.getAccessToken());

        // Wrap headers and body
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);

        // Make the request
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);

        // Return the response body
        return response.getBody();
    }

    @Override
    public Map<String, Object> createTransaction(Map<String, Object> requestBody) {
        String url = "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/createtransaction";

        // Create headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", "VITCOMEX");
        headers.set("channel", "Direct");
        headers.set("company", "458100");
        headers.set("branch", "458302");
        headers.set("Authorization", "Bearer "+tokenService.getAccessToken());

        // Wrap headers and body
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);

        // Make the request
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);

        // Return the response body
        return response.getBody();
    }

    @Override
    public Map<String, Object> confirmTransaction(Map<String, Object> requestBody) {
        String url = "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/confirmtransaction";

        // Create headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", "VITCOMEX");
        headers.set("channel", "Direct");
        headers.set("company", "458100");
        headers.set("branch", "458302");
        headers.set("Authorization", "Bearer "+ tokenService.getAccessToken());

        // Wrap headers and body
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);

        // Make the request
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);

        // Return the response body
        return response.getBody();
    }

    @Override
    public Map<String, Object> enquireTransaction(String transactionRefNumber) {
        String url = "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/enquire-transaction";

        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", "VITCOMEX");
        headers.set("channel", "Direct");
        headers.set("company", "458100");
        headers.set("branch", "458302");
        headers.set("Authorization", "Bearer " + tokenService.getAccessToken());

        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("transaction_ref_number", transactionRefNumber);

        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        RestTemplate restTemplate = new RestTemplate();

        try {
            ResponseEntity<Map> response = restTemplate.exchange(
                    uriBuilder.toUriString(),
                    HttpMethod.GET,
                    requestEntity,
                    Map.class
            );
            return response.getBody();
        } catch (HttpClientErrorException e) {
            throw new RuntimeException("HTTP Client Error: " + e.getMessage(), e);
        } catch (HttpServerErrorException e) {
            throw new RuntimeException("HTTP Server Error: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException("An unexpected error occurred: " + e.getMessage(), e);
        }
    }


    @Override
    public Map<String, Object> getTransactionReceipt(String transactionRefNumber) {
        String url = "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/transaction-receipt";

        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", "VITCOMEX");
        headers.set("channel", "Direct");
        headers.set("company", "458100");
        headers.set("branch", "458302");
        headers.set("Authorization", "Bearer " + tokenService.getAccessToken());

        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("transaction_ref_number", transactionRefNumber);

        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        RestTemplate restTemplate = new RestTemplate();

        try {
            ResponseEntity<Map> response = restTemplate.exchange(
                    uriBuilder.toUriString(),
                    HttpMethod.GET,
                    requestEntity,
                    Map.class
            );
            return response.getBody();
        } catch (HttpClientErrorException e) {
            throw new RuntimeException("HTTP Client Error: " + e.getMessage(), e);
        } catch (HttpServerErrorException e) {
            throw new RuntimeException("HTTP Server Error: " + e.getMessage(), e);
        } catch (Exception e) {
            throw new RuntimeException("An unexpected error occurred: " + e.getMessage(), e);
        }
    }


    @Override
    public Map<String, Object> cancelTransaction(Map<String, Object> requestBody) {
        String url = "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/canceltransaction";

        // Create headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", "VITCOMEX");
        headers.set("channel", "Direct");
        headers.set("company", "458100");
        headers.set("branch", "458302");
        headers.set("Authorization", "Bearer "+ tokenService.getAccessToken());

        // Create HttpEntity with headers and body
        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.postForEntity(url, requestEntity, Map.class);

        return response.getBody();
    }

    @Override
    public Map<String, Object> getRates() {
        String url = "https://drap-sandbox.digitnine.com/raas/masters/v1/rates";

        // Create headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", "VITCOMEX");
        headers.set("channel", "Direct");
        headers.set("company", "458100");
        headers.set("branch", "458302");
        headers.set("Authorization", "Bearer " + tokenService.getAccessToken());

        // Create HttpEntity with headers
        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        // Make the GET request using exchange()
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.exchange(
                url,
                HttpMethod.GET,
                requestEntity,
                Map.class
        );

        // Return the response body
        return response.getBody();
    }

    @Override
    public Map<String, Object> getBanks(String receivingCountryCode, String receivingMode) {
        String url = "https://drap-sandbox.digitnine.com/raas/masters/v1/banks";

        // Create headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", "VITCOMEX");
        headers.set("channel", "Direct");
        headers.set("company", "458100");
        headers.set("branch", "458302");
        headers.set("Authorization", "Bearer " + tokenService.getAccessToken());

        // Create query parameters
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("receiving_country_code", receivingCountryCode)
                .queryParam("receiving_mode", receivingMode);

        // Create HttpEntity with headers
        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        // Make the GET request using exchange()
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.exchange(
                uriBuilder.toUriString(),
                HttpMethod.GET,
                requestEntity,
                Map.class
        );

        // Return the response body
        return response.getBody();
    }


    @Override
    public Map<String, Object> getBankBranches(String bankId, String receivingCountryCode, String correspondent, String receivingMode) {
        String baseUrl = "https://drap-sandbox.digitnine.com/raas/masters/v1/banks/" + bankId + "/branches";

        // Construct the query parameters
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(baseUrl)
                .queryParam("receiving_country_code", receivingCountryCode)
                .queryParam("correspondent", correspondent)
                .queryParam("receiving_mode", receivingMode);

        // Create headers
        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", "VITCOMEX");
        headers.set("channel", "Direct");
        headers.set("company", "458100");
        headers.set("branch", "458302");
        headers.set("Authorization", "Bearer " + tokenService.getAccessToken());

        // Create HttpEntity with headers
        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        // Make the GET request
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.exchange(
                uriBuilder.toUriString(),
                HttpMethod.GET,
                requestEntity,
                Map.class
        );

        // Return the response body
        return response.getBody();
    }

    @Scheduled(cron = "0 0/30 * * * *") // Runs every 30 minutes
    public void scheduledStateUpdate() {

        List<Transfer> transfers = transferRepository.findAll();

        for (Transfer transfer : transfers) {

            Map<String, Object> response = enquireTransaction(transfer.getTransactionReferenceNumber());

            if (response.containsKey("data")) {
                Map<String, Object> data = (Map<String, Object>) response.get("data");
                String state = (String) data.get("state");
                String subState = (String) data.get("sub_state");

                // Find and update the transfer in the repository
                Optional<Transfer> fetchedTransfer = transferRepository
                        .findTransactionByTransactionReferenceNumber(transfer.getTransactionReferenceNumber());

                if (fetchedTransfer.isPresent()) {
                    fetchedTransfer.get().setTransactionState(state);
                    fetchedTransfer.get().setTransactionSubState(subState);

                    transferRepository.save(fetchedTransfer.get());
                }

            }
        }
    }

}
