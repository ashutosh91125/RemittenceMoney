package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.AgentType;

public interface AgentTypeRepositories extends JpaRepository<AgentType, Integer> {

}
