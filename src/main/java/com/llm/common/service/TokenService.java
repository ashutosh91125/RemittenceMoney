package com.llm.common.service;

import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.Agent;
import com.llm.agent.repository.AgentRepositories;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class TokenService {

    @Autowired
    private AgentRepositories agentRepositories;

    @Autowired
    private StaffDetailsRepository staffDetailsRepository;

    @Autowired
    private UserRepository userRepository;

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

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Optional<StaffDetails> staffDetails = staffDetailsRepository.findByUsername(username);

        Agent byAgentId = agentRepositories.findByAgentId((staffDetails.get().getAgent()));


        body.add("username", byAgentId.getApiUsername());
        body.add("password", byAgentId.getApiPassword());
//        body.add("password", "Vml0Y29tYXhANzg28");
        body.add("grant_type", byAgentId.getGrantType());
        body.add("client_id", byAgentId.getClientId());
        body.add("client_secret", byAgentId.getClientSecret());
        return body;
    }

    public String getAccessToken() {
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(getTokenRequestBody(), getTokenHeaders());
        log.info("Access Token Header ++++++++++++++========="+ getTokenHeaders());
        log.info("Access Token Body +++++++=========="+ getTokenRequestBody());
        ResponseEntity<Map> response = restTemplate.postForEntity(TOKEN_URL, requestEntity, Map.class);
        return (String) response.getBody().get("access_token");
    }

}
