package com.llm.agent.repository;

import com.llm.agent.projection.AgentBranchProjection;
import com.llm.agent.projection.AgentProjection;
import com.llm.branch.projection.BranchProjection;
import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.agent.model.Agent;

import java.util.List;

public interface AgentRepositories extends JpaRepository<Agent, Long> {
	Agent findByEmail(String email);
	Agent findByAgentId(String agentId);
	Agent findByBranchLocationId(String branchLocationId);

	boolean existsByBranchLocationId(String branchLocationId);

	// Custom query that fetches only specific fields (projection)
	List<AgentBranchProjection> findAllProjectedBy();
	
	Agent findByUsername(String username);

	AgentProjection findProjectionsByBranchLocationId(String branchLocationId);

	// Custom query to fetch projection by countries field
	List<Agent> findByCountries(String countries);

	List<AgentBranchProjection> findProjectionsByCountries(String country);
}
