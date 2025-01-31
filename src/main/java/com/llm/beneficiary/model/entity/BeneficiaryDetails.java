package com.llm.beneficiary.model.entity;

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

	// Beneficiary Details
	private String beneficiaryDeliveryOption;
	private String payOutCountry;
	private String currencies;
	private String beneficiaryBank;
	private String beneficiaryBranch;
	@Column(name = "beneficiaryIban", length = 34)
	private String beneficiaryIban;
	private String beneficiaryAccountType;
	@Column(name = "beneficiaryAccountNo", length = 34)
	private String beneficiaryAccountNo;
	private String beneficiaryAccountName;
	private String beneficiaryType;
	private String beneficiaryRelation;
	private String beneficiaryNickname;
	@Column(name = "beneficiaryFirstName", length = 60)
	private String beneficiaryFirstName;
	@Column(name = "beneficiaryMiddleName", length = 60)
	private String beneficiaryMiddleName;
	@Column(name = "beneficiaryLastName", length = 60)
	private String beneficiaryLastName;
	@Column(name = "beneficiaryAddress1", length = 70)
	private String beneficiaryAddress1;
	private String beneficiaryAddress2;
	@Column(name = "beneficiaryCity", length = 35)
	private String beneficiaryCity;
	private String beneficiaryState;
	@Column(name = "beneficiaryMobile", length = 20)
	private String beneficiaryMobile;
	private String beneficiaryNationality;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String beneficiaryDob;
	private String beneficiaryIdType;
	private String beneficiaryIdNo;
	private Boolean status;
}
