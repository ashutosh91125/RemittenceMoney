package com.llm.fundRequst.dto;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class FundReqReceiptDTO {

    private Double amount;
    private String depositMode;
    private String referenceNumber;
    private String depositBy;
    private String remarks;
    private LocalDate depositDate;
    private String bankReceiptPath;
    private String depositRequestNumber;

    private String agentName;
    private String agentPhone;
    private String agentAddress;
    private String agentCounty;
    private LocalDateTime createOn;
}
