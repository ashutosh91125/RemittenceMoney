package com.llm.exception;

import java.util.Map;

public class MissingMandatoryFieldsException extends RuntimeException {
    private Map<String, String> details;

    public MissingMandatoryFieldsException(String message, Map<String, String> details) {
        super(message);
        this.details = details;
    }

    public Map<String, String> getDetails() {
        return details;
    }
}
