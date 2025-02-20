package com.llm.agent.service;

import java.util.List;
import java.util.Optional;

import com.llm.agent.model.Agent;
import com.llm.agent.projection.AgentBranchProjection;
import com.llm.agent.projection.AgentProjection;

public interface IAgentService {
	void addAgent(Agent agent);

	List<Agent> findAllAgent();

	Agent getByEmail(String email);

	List<Agent> findByCountries(String countries);

	Agent getByBranchLocationId(String branchLocationId);

	List<AgentBranchProjection> getAllAgentByProjection();

	AgentProjection getAgentProjectionByBranchLocationId(String branchLocationId);

	List<AgentBranchProjection> getAgentsProjectionByCountry(String country);

	Optional<Agent> getById(Long id);

//	Agent getByAgentId(String agentId);

	void updateAgent(Long id, Agent updatedAgent, String modifiedBy);

	List<String> getAllAgentIds();

}
