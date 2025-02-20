package com.llm.model.request;

import lombok.Data;

@Data
public class CustomerValidationRequest {
    private String idNumber;
    private String idType;

    // Getters and Setters
}
