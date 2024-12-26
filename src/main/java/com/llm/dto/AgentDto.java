package com.llm.dto;

import com.llm.model.SubAgent;

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
public class AgentDto {
	private Long aId;
	private Long companyId;
	private String companyName;
	private String companyDisplayName;
	private String address1;
	private String address2;
	private String address3;
	private String city;
	private String state;
	private String zip;
	private String email;
	private Long mobile;
	private Long phone;
	private String contactPerson;
	private String misEmailId;
	private String taxIdentificationNumber;
	private String licenceNo;
	private Boolean taxApplicable;
	private Long daily;
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
	private String disabledBy;
	private String disabledOn;
	private String remarks;
	private Boolean statusFlag;
	private SubAgent subagents;


}
