package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Agent;
import com.llm.repositories.AgentRepositories;

@Service
public class AgentServiceImpl implements IAgentService {
	@Autowired
	private AgentRepositories agentRepositories;

	@Override
	public Agent addAgent(Agent agent) {
		return agentRepositories.save(agent);
	}

	@Override
	public List<Agent> findAllAgent() {
		return agentRepositories.findAll();
	}

	@Override
	public Agent getByEmail(String email) {
		return agentRepositories.findByEmail(email);
	}

	@Override
	public Agent getAgentByCompanyId(Long companyId) {
		
		return agentRepositories.findByCompanyId(companyId);
	}

}
