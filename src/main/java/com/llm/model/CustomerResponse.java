package com.llm.model;

import lombok.Data;

@Data
public class CustomerResponse {
    private String ecrn;
    private String firstName;
    private String lastName;
    private String customerStatus;


    private String status;
    private int statusCode;
    private Customer data;
}
