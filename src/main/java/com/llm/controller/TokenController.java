//package com.llm.controller;
//
//
//import org.springframework.web.bind.annotation.RestController;
//
//import com.llm.Service.KeycloakAuthService;
//
//@RestController
//public class TokenController {
//
//    private final KeycloakAuthService keycloakAuthService;
//
//    public TokenController(KeycloakAuthService keycloakAuthService) {
//        this.keycloakAuthService = keycloakAuthService;
//    }

//    @GetMapping("/getAccessToken")
//    public Mono<TokenResponse> getToken() {
//
//        return keycloakAuthService.getAccessToken();
//    }
//}


