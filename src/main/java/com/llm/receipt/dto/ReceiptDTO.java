package com.llm.receipt.dto;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class ReceiptDTO {

    private String transactionRefNumber;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;
    private String customerNo;
    private Double payoutAmount;
    private String payOutCurrency;
    private String customerName;
    private String customerPhone;
    private String customerIdType;
    private String customerIdNo;
    private String idDateOfExpiry;
    private String nationality;
    private String issuedAt;
    private String sourceOfFund;
    private String purposeOfTxn;
    private String customerCity;
    private String employerName;
    private String occupation;
    private Double payInAmount;
    private String payInCurrency;
    private Double commission;
    private Double rate;
    private Double tax;
    private Double otherCharges;
    private Double totalPayInAmount;
    private String beneficiaryName;
    private String beneficiaryPhone;
    private String beneficiaryRelation;
    private String beneficiaryNationality;
    private String benBank;
    private String benBranch;
    private String iban;
    private String accountNo;
    private String remarks;
    private String beneficiaryAddress;
    private String createdBy;
}

