package com.llm.model;

import lombok.Data;

@Data
public class TokenResponse {
    private String token_type;
    private String scope;
    private String access_token;
    private String refresh_token;
    private int expires_in;
    private int refresh_expires_in;
}
