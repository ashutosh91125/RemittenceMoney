package com.llm.raas.service.impl;


import com.llm.agent.model.Agent;
import com.llm.agent.repository.AgentRepositories;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.common.service.TokenService;
import com.llm.raas.repository.BranchRepository;
import com.llm.raas.service.ExternalService;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.HashMap;
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
    private BankDetailsFetchToken bankDetailsFetchToken;

    @Autowired
    TransferRepository transferRepository;

    @Autowired
    StaffDetailsRepository staffDetailsRepository;

    @Autowired
    BranchDetailsRepository branchDetailsRepository;

    @Autowired
    AgentRepositories agentRepositories;

    private HttpHeaders createHeaders() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Optional<StaffDetails> staffDetails = staffDetailsRepository.findByUsername(username);

        var fetchBranch = branchDetailsRepository.findById(staffDetails.get().getBranches());

        Agent byAgentId = agentRepositories.findByAgentId((staffDetails.get().getAgent()));

        HttpHeaders headers = new HttpHeaders();
        headers.set("Content-Type", "application/json");
        headers.set("sender", byAgentId.getAgentName());
        headers.set("channel", fetchBranch.get().getRaasChannel());
        headers.set("company", byAgentId.getAgentId());
        headers.set("branch", byAgentId.getBranchLocationId());
        headers.set("Authorization", "Bearer " + tokenService.getAccessToken());
        return headers;
    }

    @Override
    public Map<String, Object> callExternalApi(Map<String, Object> requestBody) {

        String url = "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/quote";

        // Wrap headers and body
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, createHeaders());

        // Make the request
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);

        // Return the response body
        return response.getBody();
    }

    @Override
    public Map<String, Object> createTransaction(Map<String, Object> requestBody) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Optional<StaffDetails> byUsername = staffDetailsRepository.findByUsername(username);

        Optional<BranchDetails> branch = branchDetailsRepository.findById(byUsername.get().getBranches());

        BranchDetails branchDetails = branch.get();

        // Inject static values into the transaction object
        Map<String, Object> transaction = (Map<String, Object>) requestBody.get("transaction");
        if (transaction == null) {
            transaction = new HashMap<>();
            requestBody.put("transaction", transaction);
        }

        // Add static ordering institution values
        Map<String, Object> orderingInstitution = new HashMap<>();
        orderingInstitution.put("name", "abc");

        Map<String, Object> institutionAddress = new HashMap<>();
        institutionAddress.put("country_code", branchDetails.getCounty());
        institutionAddress.put("address_line", branchDetails.getAddress1());
        institutionAddress.put("address_type", "PRESENT");
        institutionAddress.put("town_name", branchDetails.getCity());
        institutionAddress.put("post_code", branchDetails.getZip());
        institutionAddress.put("building_number", branchDetails.getOutletCode());

        orderingInstitution.put("institution_address", institutionAddress);
        transaction.put("ordering_institution", orderingInstitution);

        // Log the modified request body
        log.info("Modified request body: {}", requestBody);

        // Wrap headers and body
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, createHeaders());

        // Make the request
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.postForEntity(
                "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/createtransaction",
                request,
                Map.class
        );

        // Return the response body
        return response.getBody();
    }


    @Override
    public Map<String, Object> confirmTransaction(Map<String, Object> requestBody) {

        String url = "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/confirmtransaction";

        // Wrap headers and body
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, createHeaders());

        // Make the request
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Map> response = restTemplate.postForEntity(url, request, Map.class);

        // Return the response body
        return response.getBody();
    }

    @Override
    public Map<String, Object> enquireTransaction(String transactionRefNumber) {

        String url = "https://drap-sandbox.digitnine.com/amr/ras/api/v1_0/ras/enquire-transaction";

        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("transaction_ref_number", transactionRefNumber);

        HttpEntity<Void> requestEntity = new HttpEntity<>(createHeaders());

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

        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("transaction_ref_number", transactionRefNumber);

        HttpEntity<Void> requestEntity = new HttpEntity<>(createHeaders());

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

        // Create HttpEntity with headers and body
        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBody, createHeaders());

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
        headers.set("Authorization", "Bearer " + bankDetailsFetchToken.getAccessToken());

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
        headers.set("Authorization", "Bearer " + bankDetailsFetchToken.getAccessToken());

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
        headers.set("Authorization", "Bearer " + bankDetailsFetchToken.getAccessToken());

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

                state = state.replace("_", " ");
                subState = subState.replace("_", " ");

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
