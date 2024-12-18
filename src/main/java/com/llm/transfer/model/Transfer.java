package com.llm.transfer.model;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Transfer")
public class Transfer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long transferId;


	@Column(name = "ecrn")
	private String ecrn;

	@Column(name = "first_name", length = 100, nullable = false)
	private String firstName;

	@Column(name = "middle_name", length = 60)
	private String middleName;

	@Column(name = "last_name", length = 60, nullable = false)
	private String lastName;

	@Column(name = "date_of_birth")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String dateOfBirth;

	@Column(name = "primary_mobile_number", length = 20, nullable = false)
	private String primaryMobileNumber;

	@Column(name = "email_id", length = 255, nullable = false)
	private String emailId;

	@Column(name = "place_of_birth", length = 40)
	private String placeOfBirth;
	@Column(name = "address1")
	private String address1;

	@Column(name = "address2")
	private String address2;

	@Column(name = "city")
	private String city;

	@Column(name = "state")
	private String state;

	@Column(name = "country", length = 2)
	private String country;

	@Column(name = "country_of_residence", length = 2, nullable = false)
	private String countryOfResidence;

	@Column(name = "nationality", length = 2, nullable = false)
	private String nationality;

	private String customerCategory;

	private String customerType;

	private Integer idType;
	private String idNumber;
	private String issuedBy;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String issuedOn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String dateOfExpiry;
	private String issuedCountry;

	private String visaNumber;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String visaExpiryDate;
	private String visaType;

	//Beneficiary Details
	private String beneficiaryDeliveryOption;
	private String payOutCountry;
	private String currencies;
	private String beneficiaryBank;
	private String beneficiaryBranch;
	private String beneficiaryIban;
	private String beneficiaryAccountType;
	private String beneficiaryAccountNo;
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

	private String payInCurrency;
	private String sourceOfFund;
	private String transactionPurpose;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String valueDate;
	private String remarks;
	private Double payoutAmount;
	private Double rate;
//	private Double payInAmount;
	private Double commission;
	private Double tax;
//	private Double otherCharges;
//	private Double dynamicRate;
	private Double totalPayInAmount;
	private String paymentMode;

	private String transactionState;
	private String transactionSubState;
	private String transactionReferenceNumber;

}
