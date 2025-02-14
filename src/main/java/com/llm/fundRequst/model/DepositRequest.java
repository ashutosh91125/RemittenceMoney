package com.llm.fundRequst.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDate;
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

    @Column(columnDefinition = "TEXT")
    private String remarks;

    @Column(nullable = false, unique = true)
    private String depositRequestNumber;

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
