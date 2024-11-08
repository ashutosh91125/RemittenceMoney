package com.llm.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class CustomerCreationService {

    private RestTemplate restTemplate;

    private static final String TOKEN_URL = "https://drap-sandbox.digitnine.com/auth/realms/cdp/protocol/openid-connect/token";
    private static final String CUSTOMER_ONBOARDING_URL = "https://drap-sandbox.digitnine.com/caas-lcm/api/v1/CAAS/onBoarding/customer";

    @Autowired
    public CustomerCreationService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
        this.restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
    }

    // Headers and Body for Token Request
    private HttpHeaders getTokenHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.add("X-API-Key", "f594c3c3-4039-4dc8-a94f-458ea663e818");
        return headers;
    }

    private MultiValueMap<String, String> getTokenRequestBody() {
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("username", "vitcomex");
        body.add("password", "Vml0Y29tYXhANzg28");
        body.add("grant_type", "password");
        body.add("client_id", "cdp_app");
        body.add("client_secret", "mSh18BPiMZeQqFfOvWhgv8wzvnNVbj3Y");
        return body;
    }

    public String getAccessToken() {
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(getTokenRequestBody(), getTokenHeaders());
        ResponseEntity<Map> response = restTemplate.postForEntity(TOKEN_URL, requestEntity, Map.class);

        return (String) response.getBody().get("access_token");
    }


    // Headers for Customer Onboarding Request
    private HttpHeaders getCustomerHeaders(String token) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(token);
        return headers;
    }

//    public ResponseEntity<Map<String, Object>> createCustomer(Map<String, Object> customerData) {
//        String token = getAccessToken();
//
//        // Set up headers and body for the customer onboarding request
//        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(customerData, getCustomerHeaders(token));
//
//        // Call the customer onboarding API
//        return restTemplate.exchange(CUSTOMER_ONBOARDING_URL, HttpMethod.POST, requestEntity, String.class);
//    }

    public ResponseEntity<Map<String, Object>> createCustomer(Map<String, Object> customerData) {
        // Retrieve the access token
        String token = getAccessToken();

        // Set up headers and body for the customer onboarding request
        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(customerData, getCustomerHeaders(token));

        // Call the customer onboarding API and expect a response of type Map<String, Object>
        ResponseEntity<Map<String, Object>> response = restTemplate.exchange(
                CUSTOMER_ONBOARDING_URL,
                HttpMethod.POST,
                requestEntity,
                new ParameterizedTypeReference<Map<String, Object>>() {
                }
        );

        return response;
    }
}

