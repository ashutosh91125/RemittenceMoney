package com.llm.model;

import lombok.Data;

@Data
public class OnboardingResponse {
    private String status;
    private int statusCode;
    private String ecrn;
    private String customerStatus;
    // Add more fields based on the API's expected response
}
