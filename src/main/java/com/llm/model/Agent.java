package com.llm.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Agent")
public class Agent {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long agentId;
	private Long companyId;
	private String countries;
	private String companyName;
	private String companyDisplayName;
	private String address1;
	private String address2;
	private String address3;
	private String city;
	private String state;
	private String zip;
	private String timeZone;
	private String email;
	private Long mobile;
	private Long phone;
	private String contactPerson;
	private String misEmailId;
	private String taxIdentificationNumber;
	private String licenceNo;
	private Boolean taxApplicable;
	private String working;
	private Long daily;
	private String settlementMode;
	private String settlementType;
	private Boolean status;
	private Long perTransactionLimit;
	private Long perDayLimit;
	private Long perMonthLimit;
	private String grantType;
	private String scope;
	private String clientId;
	private String clientSecret;
	private String adminUserName;
	private String adminPassword;
	private String createdBy;
	private String createdOn;
	private String modifiedBy;
	private String modifiedOn;
	private String disabledBy;
	private String disabledOn;
	private String remarks;
	private Boolean statusFlag;
	private String currencies;
	private Boolean isValid;

}
