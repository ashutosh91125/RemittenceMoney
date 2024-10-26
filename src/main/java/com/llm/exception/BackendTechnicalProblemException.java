package com.llm.exception;

public class BackendTechnicalProblemException extends RuntimeException {
    public BackendTechnicalProblemException(String message) {
        super(message);
    }
}