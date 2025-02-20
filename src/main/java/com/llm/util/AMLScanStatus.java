package com.llm.util;

public enum AMLScanStatus {
    ACCEPTED("Accepted"), 
    REJECTED("Rejected"), 
    UNDER_INVESTIGATION("Under Investigation"), 
    FAILED("Failed"), 
    NOT_AVAILABLE("N/A");

    private final String status;

    AMLScanStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return status;
    }
}
