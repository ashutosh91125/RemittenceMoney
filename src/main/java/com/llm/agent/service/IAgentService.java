package com.llm.agent.service;

import java.util.List;
import java.util.Optional;

import com.llm.agent.model.Agent;
import com.llm.agent.projection.AgentProjection;

public interface IAgentService {
	void addAgent(Agent agent);

	List<Agent> findAllAgent();

	Agent getByEmail(String email);

	List<AgentProjection> getAllAgentByProjection();

	Optional<Agent> getById(Long id);

	Agent getByAgentId(String agentId);

	Agent updateAgent(Long id, Agent updatedAgent);

}
