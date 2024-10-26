package com.llm.model;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "customer")
public class Customer {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @Column(name = "id_number")
        private String idNumber;

        @Column(name = "id_type")
        private String idType;

        @Column(name = "channel", length = 50)
        private String channel;

        @Column(name = "first_name", length = 100)
        private String firstName;

        @Column(name = "middle_name", length = 60)
        private String middleName;

        @Column(name = "last_name", length = 60)
        private String lastName;

        @Column(name = "salutation", length = 10)
        private String salutation;

        @Column(name = "preferred_name")
        private String preferredName;

        @Column(name = "nationality", length = 2)
        private String nationality;

        @Column(name = "second_nationality", length = 2)
        private String secondNationality;

        @Column(name = "native_region")
        private int nativeRegion;

        @Column(name = "date_of_birth")
        private Date dateOfBirth;

        @Column(name = "country_of_birth", length = 2)
        private String countryOfBirth;

        @Column(name = "place_of_birth", length = 40)
        private String placeOfBirth;

        @Column(name = "resident_type_id")
        private Long residentTypeId;

        @Column(name = "country_of_residence", length = 2)
        private String countryOfResidence;

        @Column(name = "gender", length = 10)
        private String gender;

        @Column(name = "mothers_maiden_name")
        private String mothersMaidenName;

        @Column(name = "primary_mobile_number", length = 20)
        private String primaryMobileNumber;

        @Column(name = "secondary_mobile_number", length = 20)
        private String secondaryMobileNumber;

        @Column(name = "email_id")
        private String emailId;

        @Column(name = "phone_number", length = 20)
        private String phoneNumber;

        @Column(name = "occupation_id")
        private Long occupationId;

        @Column(name = "political_exposed_person")
        private Boolean politicalExposedPerson;

        @Column(name = "updated_by", length = 50)
        private String updatedBy;

        @OneToMany(mappedBy = "customerId", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        private List<Address> addressList;


        // Apply @JsonManagedReference similarly to other relations as needed
       /* @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        private List<IdDetail> idDetails;
*/
        @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        private List<Document> additionalDocs;

        @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        private List<SocialLink> socialLinks;



        @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        @JoinColumn(name = "customer_classification_id", referencedColumnName = "customer_id")
        private CustomerClassification customerClassification;

        @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        private List<Subscription> subscriptions;

        @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
        private List<CommunicationConsent> communicationConsents;
}
