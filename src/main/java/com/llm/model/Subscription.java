/*
package com.llm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "subscription")
public class Subscription {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @JsonProperty("subscription_type")
    @Column(name = "subscription_type", length = 30, nullable = true) // CONDITIONAL
    private String subscriptionType;

    @JsonProperty("subscription_id")
    @Column(name = "subscription_id", length = 30, nullable = true) // CONDITIONAL
    private String subscriptionId;

    @JsonProperty("status")
    @Column(name = "status", length = 30, nullable = true) // CONDITIONAL
    private String status;

    @JsonProperty("first_language")
    @Column(name = "first_language", length = 3, nullable = true) // CONDITIONAL
    private String firstLanguage;

    @JsonProperty("marital_status")
    @Column(name = "marital_status", nullable = true) // CONDITIONAL
    private Integer maritalStatus;

    @JsonProperty("profile_category")
    @Column(name = "profile_category", nullable = true) // CONDITIONAL
    private Integer profileCategory;

    @JsonProperty("dnfbp")
    @Column(name = "dnfbp", nullable = true) // CONDITIONAL
    private Boolean dnfbp;

    @JsonProperty("dpms")
    @Column(name = "dpms", nullable = true) // CONDITIONAL
    private Boolean dpms;

    // Back Reference to Customer
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
}
*/
