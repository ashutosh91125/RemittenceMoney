package com.llm.model;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

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

//        @JsonProperty("date_of_birth")
@Column(name = "date_of_birth")
@DateTimeFormat(pattern = "yyyy-MM-dd")
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
        @Column(name = "primary_mobile_number", length = 20, nullable = false,unique = true)
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
        @Column(name = "ecrn")
        private String ecrn;

        //Address data
        @Column(name = "address_type_id")
        private String addressTypeId;

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
        private String zip;

        @Column(name = "po_box")
        private String poBox;

        @Column(name = "mobile_number", length = 20)
        private String mobileNumber;

        //Permanent Address
        private String parAddressTypeId;

        private String parBuildingName;

        private String parStreetName;

        private String parLandmark;


        private String parCity;

        private String parDistrict;

        private String parState;

        private String parCountry;

        private String parZip;

        private String parPoBox;

        private String parMobileNumber;


        //Additional Document
        private String documentId;
        @Column(columnDefinition = "TEXT")
        private String docbase64Data;
        private String docContentType;

        //IdDetails
        private Integer idType;
        private String idNumber;
        private String visaNumber;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        private String visaExpiryDate;
        private String visaType;
        private String nameAsPerId;
        private String issuedCountry;
        private String issuedBy;
        private String issuedAt;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        private String issuedOn;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        private String dateOfExpiry;
        private Boolean defaultStatus;
        private Boolean activeStatus;
        

        @Lob
        private byte[] frontBase64Data;
        @Transient
        private MultipartFile frontPictureFile;
        private String frontContentType;

        @Lob
        private byte[] backBase64Data;
        @Transient
        private MultipartFile backPictureFile;
        private String BackContentType;


        //classification
        private Integer customerTypeId;
        private Integer annualIncomeRangeId;
        private String annualIncomeCurrencyCode;
        private String socialSecurityNumber;
        private Long taxRegistrationNumber;
        private String txnIssuedCountry;
        private String employerName;
        private String employerAddress;
        private String employerPhone;
        private String employerEstablishmentId;
        private Integer riskRatingId;
        private Integer pepCategory;
        private String personalMohreId;
        private Integer incomeType;
        private String professionCategory;
        private String reasonForAcc;
        private Integer txnVolMonth;
        private Integer txnCountMonth;
        private Boolean showRemarksOnTxn;
        private String customerRemarks;
        private String agentRefNo;
        private String firstLanguage;
        private Integer maritalStatus;
        private Boolean dnfbp;
        private Boolean dpms;
        private Integer profileCategory;

        //SocialLink
        private Integer socialLinksId;
        private String textField;

        //Profile Photo
        private String profBase64Data;
        private String profContentType;
        
        private Boolean isValid;
}
