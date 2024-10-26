package com.llm.model;

import jakarta.persistence.*;
import lombok.Data;


@Data
@Entity
@Table(name = "communication_consent")
public class CommunicationConsent {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "communication_type")
    private int communicationType;

    @Column(name = "allow")
    private boolean allow;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
}
