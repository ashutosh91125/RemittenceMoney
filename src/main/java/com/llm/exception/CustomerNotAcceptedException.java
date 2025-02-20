package com.llm.exception;

public class CustomerNotAcceptedException extends RuntimeException {
    public CustomerNotAcceptedException(String message) {
        super(message);
    }
}