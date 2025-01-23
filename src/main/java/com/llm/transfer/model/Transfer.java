package com.llm.transfer.model;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Data;

@Data
@Entity
@Table(name = "Transfer")
public class Transfer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long transferId;

	private String username;

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

	@Column(name = "primary_mobile_number", length = 20)
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

	@Column(name = "country", length = 25)
	private String country;

	@Column(name = "country_of_residence", length = 25, nullable = false)
	private String countryOfResidence;

	@Column(name = "nationality", length = 25, nullable = false)
	private String nationality;

	private String customerCategory;

	private String customerType;
	@Column(name = "idType", length = 30)
	private String idType;
	private String idNumber;
	private String issuedBy;
//	private String issuedAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String issuedOn;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String dateOfExpiry;
	private String issuedCountry;

	private String visaNumber;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String visaExpiryDate;
	private String visaType;

	// Beneficiary Details
	private String beneficiaryDeliveryOption;
	private String payOutCountry;
	private String currencies;
	private String beneficiaryBank;
	private String beneficiaryBranch;
	@Column(name="beneficiaryIban", length = 34)
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
	@Column(name="beneficiaryMobile", length = 20)
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
	private Double payInAmount;
	private Double commission;
	private Double tax;
//	private Double otherCharges;
//	private Double dynamicRate;
	private Double totalPayInAmount;
	private String paymentMode;

	private String staffCountry;

	private String paymentStatus;
	private String transactionState;
	private String transactionSubState;
	private String transactionReferenceNumber;
	private LocalDateTime transactionDate;
	@Transient
	private String transactionDateFormatted;
	private String agentId;
	private Long staffId;
	private Long branchId;
	private String branchLocationId;

	public void setTransactionState(String transactionState) {
		this.transactionState = transactionState.replace("_"," ");
	}

	public void setTransactionSubState(String transactionSubState) {
		this.transactionSubState = transactionSubState.replace("_", " ");
	}
}
