package com.llm.agent.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.agent.model.Agent;
import com.llm.agent.projection.AgentProjection;
import com.llm.agent.repository.AgentRepositories;
import com.llm.agent.service.IAgentService;

@Service
public class AgentServiceImpl implements IAgentService {
	@Autowired
	private AgentRepositories agentRepositories;

	@Override
	public void addAgent(Agent agent) {
		agentRepositories.save(agent);
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
	public Agent getByAgentId(String agentId) {
		return agentRepositories.findByAgentId(agentId);
	}

	@Override
	public List<AgentProjection> getAllAgentByProjection() {
		return agentRepositories.findAllProjectedBy();
	}

	@Override
	public Optional<Agent> getById(Long id) {
		return agentRepositories.findById(id);
	}

}
