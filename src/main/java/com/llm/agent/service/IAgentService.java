package com.llm.agent.service;

import java.util.List;

import com.llm.agent.model.Agent;

public interface IAgentService {
	 void addAgent(Agent agent);
	 List<Agent> findAllAgent();
	 Agent getByEmail(String email);
//	 Agent getAgentByCompanyId(Long companyId);

}
