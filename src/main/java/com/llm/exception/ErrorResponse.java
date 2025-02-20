package com.llm.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ErrorResponse {

    private String requestId;
    private String status;
    private int statusCode;
    private int errorCode;
    private String message;
    private Map<String, String> details; // Optional field for specific details

}
