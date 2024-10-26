package com.llm.Service;

import java.util.List;
import com.llm.model.AgentType;

public interface IAgentTypeService {
	public List<AgentType> getAllAgentType();

	public AgentType getByAgentTypeId(Integer agentTypeId);

}
