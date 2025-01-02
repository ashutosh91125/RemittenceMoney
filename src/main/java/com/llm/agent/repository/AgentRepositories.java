package com.llm.agent.repository;

import com.llm.agent.projection.AgentProjection;
import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.agent.model.Agent;

import java.util.List;

public interface AgentRepositories extends JpaRepository<Agent, Long> {
	Agent findByEmail(String email);
	Agent findByAgentId(Long agentId);

	// Custom query that fetches only specific fields (projection)
	List<AgentProjection> findAllProjectedBy();
	
	Agent findByUsername(String username);

}
