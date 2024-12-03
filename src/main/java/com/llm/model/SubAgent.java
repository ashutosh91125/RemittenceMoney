package com.llm.model;

import jakarta.persistence.Column;
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
@Table(name = "SubAgent")
public class SubAgent {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer subAgentId;
//	@OneToMany(mappedBy = "subagents", cascade = CascadeType.ALL, orphanRemoval = true)
//	private List<Agent> agent;

	@Column(name = "AgentMode")
	private Boolean agentMode;
//	@OneToMany(mappedBy = "subagents", cascade = CascadeType.ALL, orphanRemoval = true)
	private String agentTypes;

	private String agentChannelId;

	private String SubAgentName;

	private String SubAgentDisplayName;

	private String address1;

	private String address2;

	private String address3;

	private String city;

	private String state;

	private String zip;
//	@OneToMany(mappedBy = "subagents", cascade = CascadeType.ALL, orphanRemoval = true)
	private String working;
	

	private String email;

	
	private Long mobile;


	private Long phone;
	
	private Integer step;


	private String contactPerson;

	private String misEmailId;
	
	private Long agentLocationId;
	
	private String licenceNo;
	
	private String outlateCode;
	
	
	private String remarks;


	private Boolean statusFlag;
	
	private String password;
	
	private Boolean isValid;

}
