package com.llm.customer.model.dto;

import lombok.Data;

@Data
public class UpdateCustomerStatusDTO {
    private String ecrn;
    private String amlScanStatus;
    private String customerStatus;
}
