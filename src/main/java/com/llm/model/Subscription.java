package com.llm.model;

import jakarta.persistence.*;
import lombok.Data;



@Data
@Entity
@Table(name = "subscription")
public class Subscription {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "subscription_type", length = 100)
    private String subscriptionType;

    @Column(name = "subscription_id", length = 100)
    private String subscriptionId;

    @Column(name = "status", length = 50)
    private String status;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;
}
