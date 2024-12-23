package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.Agent;

public interface AgentRepositories extends JpaRepository<Agent, Long> {
	Agent findByEmail(String email);
	/* Agent findByCompanyId(Long companyId); */

}
