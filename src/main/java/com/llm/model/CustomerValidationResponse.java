package com.llm.model;

import lombok.Data;

@Data
public class CustomerValidationResponse {
    private String status;
    private int statusCode;
    private CustomerData data;

    @Data
    public static class CustomerData {
        private String ecrn;
        private String firstName;
        private String middleName;
        private String lastName;
        private String agentLocationId;
        private String primaryMobileNumber;
        private String emailId;
        private String customerStatus;
        private String amlScanStatus;
        private String idStatus;
        private String idDateOfExpiry;
    }
}
