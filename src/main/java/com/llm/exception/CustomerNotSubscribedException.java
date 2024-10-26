package com.llm.exception;

public class CustomerNotSubscribedException extends RuntimeException {
    public CustomerNotSubscribedException(String message) {
        super(message);
    }
}
