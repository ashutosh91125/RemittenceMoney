package com.llm.controller;


import com.llm.Service.KeycloakAuthService;
import com.llm.model.TokenResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

@RestController
public class TokenController {

    private final KeycloakAuthService keycloakAuthService;

    public TokenController(KeycloakAuthService keycloakAuthService) {
        this.keycloakAuthService = keycloakAuthService;
    }

    @GetMapping("/getAccessToken")
    public Mono<TokenResponse> getToken() {

        return keycloakAuthService.getAccessToken();
    }
}


