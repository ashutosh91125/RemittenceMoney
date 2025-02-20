package com.llm.util;

public enum CustomerStatus {
    ACTIVE(1, "Customer is active"), 
    KYC_PENDING(2, "KYC process is pending"), 
    INACTIVE(3, "Customer is inactive"), 
    REJECTED(4, "Customer is rejected"), 
    BLOCKED(5, "Customer is blocked");

    private final int statusCode;
    private final String description;

    CustomerStatus(int statusCode, String description) {
        this.statusCode = statusCode;
        this.description = description;
    }

    public int getStatusCode() {
        return statusCode;
    }

    public String getDescription() {
        return description;
    }

    @Override
    public String toString() {
        switch (this) {
            case KYC_PENDING:
                return "KYC PENDING";
            default:
                return this.name();
        }
    }
}
