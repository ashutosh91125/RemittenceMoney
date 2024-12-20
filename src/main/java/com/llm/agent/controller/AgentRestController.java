package com.llm.agent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.llm.Service.IAgentService;
import com.llm.model.Agent;

@RestController
@RequestMapping("/api/v1/agent")
public class AgentRestController {
	private static final Logger logger = LoggerFactory.getLogger(AgentRestController.class);
	@Autowired
	private IAgentService agentService;

	@PostMapping
	public ResponseEntity<String> registerAgent(@RequestBody Agent agent) {
		logger.info(agent.toString());
		try {
			agentService.addAgent(agent);
			return new ResponseEntity<>("agent create successfully", HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("Failed to saved agent" + agent, HttpStatus.BAD_REQUEST);
		}

	}

}
