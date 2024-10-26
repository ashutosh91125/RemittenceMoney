package com.llm.Service;

import java.util.List;

import com.llm.model.Agent;

public interface IAgentService {
	public Agent addAgent(Agent agent);
	public List<Agent> findAllAgent();
	public Agent getByEmail(String email);
	public Agent getAgentByCompanyId(Long companyId);

}
