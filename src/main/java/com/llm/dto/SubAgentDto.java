package com.llm.dto;

import java.util.List;

import com.llm.agent.model.Agent;
import com.llm.model.AgentType;
import com.llm.model.WorkingHours;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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

public class SubAgentDto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer subAgentId;

	private List<Agent> agent;


	private Boolean agentMode;
	
	private List<AgentType> agentTypes;

	private String agentChannelId;

	private String SubAgentName;

	private String SubAgentDisplayName;

	private String address1;

	private String address2;

	private String address3;

	private String city;

	private String state;

	private String zip;

	private List<WorkingHours> working;
	

	private String email;

	
	private Long mobile;


	private Long phone;


	private String contactPerson;

	private String misEmailId;
	
	private Long agentLocationId;
	
	private String licenceNo;
	
	private String outlateCode;
	
	
	private String remarks;


	private Boolean statusFlag;
	
	private Integer step;
	
	private String password;

}
