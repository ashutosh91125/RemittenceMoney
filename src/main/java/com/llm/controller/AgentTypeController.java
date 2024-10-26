package com.llm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.llm.Service.IAgentTypeService;
import com.llm.model.AgentType;

@Controller
public class AgentTypeController {
	@Autowired
	private IAgentTypeService agentTypeService;

	@GetMapping("/agenttypeist")
	public List<AgentType> getAllAgentType() {
		List<AgentType> agentTypeList = agentTypeService.getAllAgentType();
		return agentTypeList;
	}

}
