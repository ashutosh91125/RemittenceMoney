package com.llm.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "customer_classification")
public class CustomerClassification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "customer_type_id")
    private long customerTypeId;

    @Column(name = "annual_income_range_id")
    private long annualIncomeRangeId;

    @Column(name = "annual_income_currency_code", length = 10)
    private String annualIncomeCurrencyCode;

    @Column(name = "social_security_number", length = 30)
    private String socialSecurityNumber;

    @Column(name = "tax_registration_number")
    private long taxRegistrationNumber;

    @Column(name = "txn_issued_country", length = 2)
    private String txnIssuedCountry;

    @Column(name = "employer_name", length = 100)
    private String employerName;

    @Column(name = "employer_address")
    private String employerAddress;

    @Column(name = "employer_phone", length = 20)
    private String employerPhone;

    @Column(name = "employer_ecrn", length = 20)
    private String employerEcrn;

    @Column(name = "employer_establishment_id", length = 50)
    private String employerEstablishmentId;

    @Column(name = "risk_rating_id")
    private long riskRatingId;

    @Column(name = "pep_category")
    private int pepCategory;

    @Column(name = "personal_mohre_id", length = 50)
    private String personalMohreId;

    @Column(name = "income_type")
    private long incomeType;

    @Column(name = "profession_category", length = 50)
    private String professionCategory;

    @Column(name = "reason_for_acc")
    private String reasonForAcc;

    @Column(name = "txn_vol_month")
    private long txnVolMonth;

    @Column(name = "txn_count_month")
    private long txnCountMonth;

    @Column(name = "show_remarks_on_txn")
    private Boolean showRemarksOnTxn;

    @Column(name = "customer_remarks")
    private String customerRemarks;

    @Column(name = "agent_ref_no", length = 50)
    private String agentRefNo;

    @Column(name = "first_language", length = 5)
    private String firstLanguage;

    @Column(name = "marital_status")
    private int maritalStatus;

    @Column(name = "dnfbp")
    private Boolean dnfbp;

    @Column(name = "dpms")
    private Boolean dpms;

    @Column(name = "profile_category")
    private int profileCategory;

    // Instead of ManyToOne relation, just use the customer ID
    @Column(name = "customer_id")
    private Long customerId;
}
