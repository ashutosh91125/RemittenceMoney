package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.SubAgent;

public interface SubAgentRepository extends JpaRepository<SubAgent, Long> {
	 SubAgent findByEmail(String email);

}