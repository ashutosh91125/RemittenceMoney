package com.llm.common.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class TokenService {

    private RestTemplate restTemplate;
    @Value("${customer.tokenurl}")
    private String TOKEN_URL;

    @Autowired
    public TokenService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
        this.restTemplate.getMessageConverters().add(new FormHttpMessageConverter());
    }

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

}
