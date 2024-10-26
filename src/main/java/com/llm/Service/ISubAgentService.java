package com.llm.Service;

import java.util.List;

import com.llm.model.SubAgent;

public interface ISubAgentService {
	public SubAgent addSubAgent(SubAgent subAgent);
	public List<SubAgent> findAllAgent();
	public SubAgent getByEmail(String email);

}
