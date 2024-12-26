package com.llm.agent.service;

import java.util.List;

import com.llm.agent.model.Agent;
import com.llm.agent.projection.AgentProjection;

public interface IAgentService {
	 void addAgent(Agent agent);
	 List<Agent> findAllAgent();
	 Agent getByEmail(String email);

    List<AgentProjection> getAllAgentByProjection();

}
