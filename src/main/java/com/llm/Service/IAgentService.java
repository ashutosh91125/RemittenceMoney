package com.llm.Service;

import java.util.List;

import com.llm.model.Agent;

public interface IAgentService {
	 Agent addAgent(Agent agent);
	 List<Agent> findAllAgent();
	 Agent getByEmail(String email);
//	 Agent getAgentByCompanyId(Long companyId);

}
