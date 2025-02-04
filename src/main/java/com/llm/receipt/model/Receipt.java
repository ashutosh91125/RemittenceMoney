package com.llm.receipt.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
public class Receipt {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String transactionRefNumber;

    @Lob // Large Object to store Base64 data
    @Basic(fetch = FetchType.EAGER)
    private String receiptBase64Data;

    private LocalDateTime createdOn;

    // Constructors
    public Receipt() {}

    public Receipt(String transactionRefNumber, String receiptBase64Data, LocalDateTime createdOn) {
        this.transactionRefNumber = transactionRefNumber;
        this.receiptBase64Data = receiptBase64Data;
        this.createdOn = createdOn;
    }
}

