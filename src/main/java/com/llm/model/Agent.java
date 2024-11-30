package com.llm.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
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
	private Long aId;
	@Column(name = "Agent_Id")
	private Long companyId;
//	@OneToMany(mappedBy = "agents", cascade = CascadeType.ALL,orphanRemoval = true)
	private String countries;

	@Column(name = "Agent_Name")
	private String companyName;

	@Column(name = "Company_Display_Name")
	private String companyDisplayName;

	@Column(name = "Address1")
	private String address1;

	@Column(name = "Address2")
	private String address2;

	@Column(name = "Address3")
	private String address3;

	@Column(name = "City")
	private String city;

	@Column(name = "State")
	private String state;

	@Column(name = "Zip/PoBox")
	private String zip;

//	@OneToMany(mappedBy = "agents", cascade = CascadeType.ALL,orphanRemoval = true)
	
	private String timeZone;

	@Column(name = "Email")
	private String email;

	@Column(name = "Mobile")
	private Long mobile;

	@Column(name = "Phone")
	private Long phone;

	@Column(name = "ContactPerson")
	private String contactPerson;

	@Column(name = "MisEmailId")
	private String misEmailId;

	@Column(name = "Tax_Identification_Number")
	private String taxIdentificationNumber;

	@Column(name = "Licence_No")
	private String licenceNo;

	@Column(name = "TaxApplicable")
	private Boolean taxApplicable;

//	@OneToMany(mappedBy = "agents", cascade = CascadeType.ALL,orphanRemoval = true)
	private String working;

//	@Column(name = "Daily")
	private Long daily;

//	@OneToMany(mappedBy = "agents", cascade = CascadeType.ALL,orphanRemoval = true)
	
	private String settlementMode;
//	@OneToMany(mappedBy = "agents", cascade = CascadeType.ALL,orphanRemoval = true)
	
	private String settlementType;

	@Column(name = "Credit_Limit_Status")
	private Boolean status;

	@Column(name = "Per_Transaction_Limit")
	private Long perTransactionLimit;

	@Column(name = "Per_Day_Limit")
	private Long perDayLimit;

	@Column(name = "Per_Month_Limit")
	private Long perMonthLimit;

	@Column(name = "GrantType")
	private String grantType;

	@Column(name = "Scope")
	private String scope;

	@Column(name = "ClientId")
	private String clientId;

	@Column(name = "ClientSecret")
	private String clientSecret;

	@Column(name = "Admin_User_Name")
	private String adminUserName;

	@Column(name = "Admin_Password")
	private String adminPassword;

	@Column(name = "CreatedBy")
	private String createdBy;

	@Column(name = "CreatedOn")
	private String createdOn;

	@Column(name = "ModifiedBy")
	private String modifiedBy;

	@Column(name = "ModifiedOn")
	private String modifiedOn;

	@Column(name = "DisabledBy")
	private String disabledBy;

	@Column(name = "DisabledOn")
	private String disabledOn;

	@Column(name = "Remarks")
	private String remarks;

	@Column(name = "AgentStatus")
	private Boolean statusFlag;
	
//	@OneToMany(mappedBy = "agents", cascade = CascadeType.ALL,orphanRemoval = true)
	private String currencies;
//	@ManyToOne
//	private SubAgent subagents;
	@Transient
	private Integer step;

}
