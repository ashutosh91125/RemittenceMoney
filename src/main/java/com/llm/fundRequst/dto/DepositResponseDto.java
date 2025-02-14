package com.llm.fundRequst.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DepositResponseDto {
    private Long id;
    private Double amount;
    private String depositMode;
    private String referenceNumber;
    private String depositBy;
    private String remarks;
    private String depositDate;
    private String bankReceiptPath;
}

