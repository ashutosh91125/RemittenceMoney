package com.llm.Service;

import java.util.Map;

import com.llm.common.service.TokenService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
    private static  final Logger looger= LoggerFactory.getLogger(CustomerCreationService.class);

    private RestTemplate restTemplate;
    @Value("${customer.tokenurl}")
    private String TOKEN_URL;
    @Value("${customer.onboardingurl}")
    private String CUSTOMER_ONBOARDING_URL;

    @Autowired
    private TokenService tokenService;

    @Autowired
    public CustomerCreationService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
        this.restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
    }


    // Headers for Customer Onboarding Request
    private HttpHeaders getCustomerHeaders(String token) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(token);
        return headers;
    }

    public ResponseEntity<Map<String, Object>> createCustomer(Map<String, Object> customerData) {
        // Retrieve the access token
        String token = tokenService.getAccessToken();

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

