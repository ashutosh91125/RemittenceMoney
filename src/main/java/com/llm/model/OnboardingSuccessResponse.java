package com.llm.model;

import com.llm.model.response.Data;

@lombok.Data
public class OnboardingSuccessResponse {

    private String status;
    private Data data;
    private int statusCode;
    private String requestId;

}
