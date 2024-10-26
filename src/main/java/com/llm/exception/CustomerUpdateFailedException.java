package com.llm.exception;

public class CustomerUpdateFailedException extends RuntimeException {
    public CustomerUpdateFailedException(String message) {
        super(message);
    }
}
