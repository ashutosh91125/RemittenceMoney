package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.AgentType;
import com.llm.repositories.AgentTypeRepositories;

@Service
public class AgentTypeServiceImpl implements IAgentTypeService {

	@Autowired
	private AgentTypeRepositories agentTypeRepositories;

	@Override
	public List<AgentType> getAllAgentType() {
		return agentTypeRepositories.findAll();
	}

	@Override
	public AgentType getByAgentTypeId(Integer agentTypeId) {

		return agentTypeRepositories.findById(agentTypeId)
				.orElseThrow(() -> new IllegalArgumentException("agent Type Id not found"));
	}
}
