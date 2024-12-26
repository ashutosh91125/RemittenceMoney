package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.SubAgent;
import com.llm.subagent.repositories.SubAgentRepository;

@Service
public class SubAgentServiceImpl implements ISubAgentService {
	@Autowired
	private SubAgentRepository subAgentRepository;

	@Override
	public SubAgent addSubAgent(SubAgent subAgent) {
		return subAgentRepository.save(subAgent);

	}

	@Override
	public List<SubAgent> findAllAgent() {

		return subAgentRepository.findAll();
	}

	@Override
	public SubAgent getByEmail(String email) {
	
		return subAgentRepository.findByEmail(email);
	}
}
