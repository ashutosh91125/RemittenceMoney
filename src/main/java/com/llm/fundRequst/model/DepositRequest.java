package com.llm.fundRequst.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.llm.fundRequst.enums.FundRequestStatus;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Random;

@Entity
@Table(name = "deposit_requests")
@Getter
@Setter
public class DepositRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Double amount;

    @Column(nullable = false)
    private String depositCurrency;

    @Column(nullable = false)
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    private LocalDate depositDate;

    @Column(nullable = false)
    private String depositMode;

    @Column(nullable = false, unique = true)
    private String referenceNumber;

    @Column(nullable = false)
    private String bankReceiptPath;

    @Column(nullable = false)
    private String depositBy;

    @Column(nullable = false)
    private String createdBy;

    private String createdByUsername;

    private LocalDateTime createOn;

    @Column(columnDefinition = "TEXT")
    private String remarks;

    @Enumerated(EnumType.STRING)
    private FundRequestStatus fundRequestStatus;

    @Column(nullable = false, unique = true)
    private String depositRequestNumber;

    private String depositBank;
    private String depositAcNumber;
    private String depositBankBranch;
    private String agentAddress;

    @PrePersist
    public void generateRequestNumber() {
        this.depositRequestNumber = generateUniqueRequestNumber();
    }

    private String generateUniqueRequestNumber() {
        Random random = new Random();
        long requestNumber = 1000000000L + (long) (random.nextDouble() * 9000000000L);
        return String.valueOf(requestNumber);
    }
}
