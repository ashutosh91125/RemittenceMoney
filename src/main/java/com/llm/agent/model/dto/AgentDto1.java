package com.llm.agent.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AgentDto1 {
	private Long id;
	private String grantType;
	private String scope;
	private String clientId;
	private String clientSecret;
	private String apiUsername;
	private String apiPassword;
}

