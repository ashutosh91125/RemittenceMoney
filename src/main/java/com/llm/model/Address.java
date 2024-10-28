package com.llm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "address_type_id")
    private Integer addressTypeId;

    @Column(name = "building_name", length = 255)
    private String buildingName;

    @Column(name = "street_name", length = 255)
    private String streetName;

    @Column(name = "landmark", length = 255)
    private String landmark;

    @Column(name = "city", length = 255)
    private String city;

    @Column(name = "district", length = 255)
    private String district;

    @Column(name = "state", length = 255)
    private String state;

    @Column(name = "country", length = 2)
    private String country;

    @Column(name = "zip")
    private Integer zip;

    @Column(name = "po_box")
    private String poBox;

    @Column(name = "mobile_number", length = 20)
    private String mobileNumber;

    // Back Reference to Customer
    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
}
