package com.llm.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "customer_classification")
public class CustomerClassification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

//    @JsonProperty("customer_type_id")
    @Column(name = "customer_type_id")
    private Integer customerTypeId;

//    @JsonProperty("annual_income_range_id")
    @Column(name = "annual_income_range_id")
    private Integer annualIncomeRangeId;

//    @JsonProperty("annual_income_currency_code")
    @Column(name = "annual_income_currency_code", length = 3)
    private String annualIncomeCurrencyCode;

//    @JsonProperty("social_security_number")
    @Column(name = "social_security_number", length = 20)
    private String socialSecurityNumber;

//    @JsonProperty("tax_registration_number")
    @Column(name = "tax_registration_number")
    private Integer taxRegistrationNumber;

//    @JsonProperty("txn_issued_country")
    @Column(name = "txn_issued_country", length = 2)
    private String txnIssuedCountry;

//    @JsonProperty("employer_name")
    @Column(name = "employer_name", length = 255)
    private String employerName;

//    @JsonProperty("employer_address")
    @Column(name = "employer_address", length = 255)
    private String employerAddress;

//    @JsonProperty("employer_phone")
    @Column(name = "employer_phone", length = 20)
    private String employerPhone;

//    @JsonProperty("employer_establishment_id")
    @Column(name = "employer_establishment_id", length = 255)
    private String employerEstablishmentId;

//    @JsonProperty("risk_rating_id")
    @Column(name = "risk_rating_id")
    private Integer riskRatingId;

//    @JsonProperty("pep_category")
    @Column(name = "pep_category")
    private Integer pepCategory;

//    @JsonProperty("personal_mohre_id")
    @Column(name = "personal_mohre_id", length = 50)
    private String personalMohreId;

//    @JsonProperty("income_type")
    @Column(name = "income_type")
    private Integer incomeType;

//    @JsonProperty("profession_category")
    @Column(name = "profession_category", length = 10)
    private String professionCategory;

//    @JsonProperty("reason_for_acc")
    @Column(name = "reason_for_acc", length = 100)
    private String reasonForAcc;

//    @JsonProperty("txn_vol_month")
    @Column(name = "txn_vol_month")
    private Integer txnVolMonth;

//    @JsonProperty("txn_count_month")
    @Column(name = "txn_count_month")
    private Integer txnCountMonth;

//    @JsonProperty("show_remarks_on_txn")
    @Column(name = "show_remarks_on_txn")
    private Boolean showRemarksOnTxn;

//    @JsonProperty("customer_remarks")
    @Column(name = "customer_remarks", length = 500)
    private String customerRemarks;

//    @JsonProperty("agent_ref_no")
    @Column(name = "agent_ref_no", length = 100)
    private String agentRefNo;

//    @JsonProperty("first_language")
    @Column(name = "first_language", length = 2)
    private String firstLanguage;

//    @JsonProperty("marital_status")
    @Column(name = "marital_status")
    private Integer maritalStatus;

//    @JsonProperty("dnfbp")
    @Column(name = "dnfbp")
    private Boolean dnfbp;

//    @JsonProperty("dpms")
    @Column(name = "dpms")
    private Boolean dpms;

//    @JsonProperty("profile_category")
    @Column(name = "profile_category")
    private Integer profileCategory;

    // Social Links Relation (One-to-Many)
//    @JsonProperty("social_links")
    @JsonManagedReference
    @OneToMany(mappedBy = "customerClassification", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<SocialLink> socialLinks;

//    @JsonProperty("profile_photo")
    @JsonManagedReference
    @OneToOne(mappedBy = "customerClassification", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private ProfilePhoto profilePhoto;


    // Back Reference to Customer


    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    @JsonBackReference
    private Customer customer;

}
