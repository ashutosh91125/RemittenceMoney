package com.llm.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "customer")
public class Customer {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

//        @JsonProperty("channel")
        @Column(name = "channel", length = 20, nullable = false)
        private String channel;

//        @JsonProperty("agent_location_id")
        @Column(name = "agent_location_id", nullable = false)
        private String agentLocationId;


//        @JsonProperty("salutation")
        @Column(name = "salutation", length = 3)
        private String salutation;

//        @JsonProperty("first_name")
        @Column(name = "first_name", length = 100, nullable = false)
        private String firstName;

//        @JsonProperty("middle_name")
        @Column(name = "middle_name", length = 60)
        private String middleName;

//        @JsonProperty("last_name")
        @Column(name = "last_name", length = 60, nullable = false)
        private String lastName;

//        @JsonProperty("preferred_name")
        @Column(name = "preferred_name", length = 255)
        private String preferredName;

//        @JsonProperty("nationality")
        @Column(name = "nationality", length = 2, nullable = false)
        private String nationality;

//        @JsonProperty("second_nationality")
        @Column(name = "second_nationality", length = 2)
        private String secondNationality;

//        @JsonProperty("native_region")
        @Column(name = "native_region")
        private Integer nativeRegion;

////        @JsonProperty("date_of_birth")
//        @DateTimeFormat(pattern = "yyyy-MM-dd")
        @Column(name = "date_of_birth", nullable = false)
        private String dateOfBirth;

//        @JsonProperty("country_of_birth")
        @Column(name = "country_of_birth", length = 2, nullable = false)
        private String countryOfBirth;

//        @JsonProperty("place_of_birth")
        @Column(name = "place_of_birth", length = 40)
        private String placeOfBirth;

//        @JsonProperty("resident_type_id")
        @Column(name = "resident_type_id")
        private Long residentTypeId;

//        @JsonProperty("country_of_residence")
        @Column(name = "country_of_residence", length = 2, nullable = false)
        private String countryOfResidence;

//        @JsonProperty("gender")
        @Enumerated(EnumType.STRING)
        @Column(name = "gender", length = 12, nullable = false)
        private Gender gender;

//        @JsonProperty("mothers_maiden_name")
        @Column(name = "mothers_maiden_name", length = 255)
        private String mothersMaidenName;

//        @JsonProperty("primary_mobile_number")
        @Column(name = "primary_mobile_number", length = 20, nullable = false)
        private String primaryMobileNumber;

//        @JsonProperty("secondary_mobile_number")
        @Column(name = "secondary_mobile_number", length = 20)
        private String secondaryMobileNumber;

//        @JsonProperty("email_id")
        @Column(name = "email_id", length = 255, nullable = false)
        private String emailId;

//        @JsonProperty("phone_number")
        @Column(name = "phone_number", length = 20)
        private String phoneNumber;

//        @JsonProperty("occupation_id")
        @Column(name = "occupation_id")
        private Long occupationId;

//        @JsonProperty("political_exposed_person")
        @Column(name = "political_exposed_person")
        private Boolean politicalExposedPerson;

//        @JsonProperty("updated_by")
        @Column(name = "updated_by", length = 50)
        private String updatedBy;

//        @JsonProperty("ecrn")
        @Column(name = "ecrn", unique = true, length = 10)
        private String ecrn;

        // Address List Relation (One-to-Many)
//        @JsonProperty("address_list")
        @JsonManagedReference
        @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
        private List<Address> addressList;

        // Additional Documents Relation (One-to-Many)
//        @JsonProperty("additional_docs")
        @JsonManagedReference
        @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
        private List<Document> additionalDocs;

        // ID Details (One-to-Many)
//        @JsonProperty("id_details")
        @JsonManagedReference
        @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
        private List<IdDetail> idDetails;

        // Customer Classification Relation (One-to-One)
//        @JsonProperty("customer_classification")
        @JsonManagedReference
        @OneToOne(mappedBy = "customer",cascade = CascadeType.ALL, fetch = FetchType.EAGER)
        private CustomerClassification customerClassification;
}
