package com.llm.agent.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "agent")
public class Agent {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long agentId;
	private String countries;
	private String currencies;
	private String agentName;
	private String agentDisplayName;
	private String address1;
	private String address2;
	private String address3;
	private String city;
	private String state;
	private String zip;
	private String timeZone;
	private String email;
	private String mobile;
	private String phone;
	private String contactPerson;
	private String misEmailId;
	private String taxIdentificationNumber;
	private String licenceNo;
	private Boolean taxApplicable;
	private String workingHours;
	private Long daily;
	private String settlementMode;
	private String settlementType;
	private Boolean status;
	private Long perTransaction;
	private Long perDay;
	private Long perMonth;
//	private String grantType;
//	private String scope;
//	private String clientId;
//	private String clientSecret;
	private String username;
	private String createdBy;
	private LocalDateTime createdOn;
	private String modifiedBy;
	private LocalDateTime modifiedOn;
	private String disabledBy;
	private LocalDateTime disabledOn;
	private String remarks;
	private Boolean statusFlag;
	private Boolean isValid;

	private String perTransactionLimit;
	private String perDayLimit;
	private String perMonthLimit;

}
