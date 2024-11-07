//package com.llm.Service;
//
//
//import com.llm.config.KeycloakConfig;
//import com.llm.exception.TokenRetrievalException;
//import com.llm.model.TokenResponse;
//import com.llm.util.AuthConstants;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Service;
//
//import org.springframework.http.MediaType;
//import org.springframework.web.reactive.function.BodyInserters;
//import org.springframework.web.reactive.function.client.WebClient;
//import reactor.core.publisher.Mono;
//
//@Service
//@RequiredArgsConstructor
//public class KeycloakAuthService {
//
//    private final WebClient webClient;
//    private final KeycloakConfig keycloakConfig;
//
//    public Mono<TokenResponse> getAccessToken() {
//        return webClient.post()
//                .uri(keycloakConfig.getAuthUrl())
//                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
//                .body(BodyInserters.fromFormData("grant_type", AuthConstants.GRANT_TYPE_PASSWORD)
//                        .with("client_id", keycloakConfig.getClientId())
//                        .with("client_secret", keycloakConfig.getClientSecret())
//                        .with("username", keycloakConfig.getUsername())
//                        .with("password", keycloakConfig.getPassword())
//                    //    .with("scope", keycloakConfig.getScope())
//                )
//                .retrieve()
//                .bodyToMono(TokenResponse.class)
//                .switchIfEmpty(Mono.error(new TokenRetrievalException("Failed to retrieve access token")));
//    }
//}
//
//
//
