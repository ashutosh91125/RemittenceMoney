package com.llm.customer.model.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class UpdateCustomerStatusDTO {
    @JsonProperty("ecrn")
    private String ecrn;

    @JsonProperty("aml_scan_status")
    private String amlScanStatus;

    @JsonProperty("customer_status")
    private String customerStatus;
}
