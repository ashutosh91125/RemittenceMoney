package com.llm.dto;

import java.util.List;

import com.llm.model.AppTimeZone;
import com.llm.model.Country;
import com.llm.model.Currency;
import com.llm.model.SettelementType;
import com.llm.model.SettlementMode;
import com.llm.model.SubAgent;
import com.llm.model.WorkingHours;

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
	private List<Country> countries;
	private String companyName;
	private String companyDisplayName;
	private String address1;
	private String address2;
	private String address3;
	private String city;
	private String state;
	private String zip;
	private List<AppTimeZone> timeZone;
	private String email;
	private Long mobile;
	private Long phone;
	private String contactPerson;
	private String misEmailId;
	private String taxIdentificationNumber;
	private String licenceNo;
	private Boolean taxApplicable;
	private List<WorkingHours> working;
	private Long daily;
	private List<SettlementMode> settlementMode;
	private List<SettelementType> settlementType;
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
	private List<Currency> currencies;
	private SubAgent subagents;
	private String password;

}
