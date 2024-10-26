package com.llm.exception;

public class InvalidNationalityException extends RuntimeException {
    public InvalidNationalityException(String message) {
        super(message);
    }
}