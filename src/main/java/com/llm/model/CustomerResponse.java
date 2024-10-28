package com.llm.model;

import lombok.Data;

import java.util.Optional;

@Data
public class CustomerResponse {
    private String status;
    private int statusCode;
    private Optional<Customer> data;
}
