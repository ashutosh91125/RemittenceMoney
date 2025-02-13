package com.llm.fundRequst.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;

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
    private LocalDate depositDate;

    @Column(nullable = false)
    private String depositMode;

    @Column(nullable = false, unique = true)
    private Long referenceNumber;

    @Column(nullable = false)
    private String bankReceiptPath;

    @Column(nullable = false)
    private String depositBy;

    @Column(columnDefinition = "TEXT")
    private String remarks;
}
