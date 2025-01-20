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
	private Long id;
	@Column(name="agentId", length = 6)
	private String agentId;
	private String countries;
	private String currencies;
	@Column(name="agentName", length = 60)
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
	private double daily;
	private double remainingDaily;
	private String settlementMode;
	private String settlementType;
	private Boolean creditLimitStatus;
//	private Long perTransaction;
	@Column(name="grantType", length = 10)
	private String grantType;
	@Column(name="scope", length = 60)
	private String scope;
	@Column(name="clientId", length = 60)
	private String clientId;
	@Column(name="clientSecret", length = 60)
	private String clientSecret;
	@Column(unique = true)
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
	@Column(name="apiUsername", length = 60)
	private String apiUsername;
	@Column(name="apiPassword", length = 60)
	private String apiPassword;

	private double perTransactionLimit;
	private double perDayLimit;
	private double perMonthLimit;

	private double remainingPerDayLimit;
	private double remainingPerMonthLimit;

	@Column(name = "branch_location_id",length = 6, unique = true)
	private String branchLocationId;

}
