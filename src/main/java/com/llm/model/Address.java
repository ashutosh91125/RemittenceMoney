package com.llm.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "address_type_id", length = 50)
    private String addressTypeId;

    @Column(name = "building_name")
    private String buildingName;

    @Column(name = "street_name")
    private String streetName;

    @Column(name = "landmark")
    private String landmark;

    @Column(name = "city", length = 60)
    private String city;

    @Column(name = "district")
    private String district;

    @Column(name = "state")
    private String state;

    @Column(name = "country", length = 2)
    private String country;

    @Column(name = "zip")
    private long zip;

    @Column(name = "po_box", length = 50)
    private String poBox;

    @Column(name = "mobile_number", length = 20)
    private String mobileNumber;

    // Instead of ManyToOne relation, just use the customer ID
    @Column(name = "customer_id")
    private Long customerId;
}
