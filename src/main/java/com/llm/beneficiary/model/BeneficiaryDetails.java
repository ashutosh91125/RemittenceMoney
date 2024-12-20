package com.llm.beneficiary.model;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@Data
@Entity
@Table(name = "beneficiary_details")
public class BeneficiaryDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ecrn")
    private String ecrn;

    //Beneficiary Details
    private String beneficiaryDeliveryOption;
    private String payOutCountry;
    private String currencies;
    private String beneficiaryBank;
    private String beneficiaryBranch;
    private String beneficiaryIban;
    private String beneficiaryAccountType;
    private String beneficiaryAccountNo;
    private String beneficiaryAccountName;
    private String beneficiaryType;
    private String beneficiaryRelation;
    private String beneficiaryNickname;
    private String beneficiaryFirstName;
    private String beneficiaryMiddleName;
    private String beneficiaryLastName;
    private String beneficiaryAddress1;
    private String beneficiaryAddress2;
    private String beneficiaryCity;
    private String beneficiaryState;
    private String beneficiaryMobile;
    private String beneficiaryNationality;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String beneficiaryDob;
    private String beneficiaryIdType;
    private String beneficiaryIdNo;
}
