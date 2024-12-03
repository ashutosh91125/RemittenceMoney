package com.llm.controller;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.llm.Service.ISubAgentService;
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import com.llm.model.SubAgent;

@Controller
@SessionAttributes("subAgent")
public class SubAgentcontroller {
	private static final Logger logger = LoggerFactory.getLogger(SubAgentcontroller.class);
	@Autowired
	private EnumEntityService enumEntityService;
	@Autowired
	private ISubAgentService subAgentService;

	@ModelAttribute("subAgent")
	public SubAgent initializeSubAgent() {
		return new SubAgent();
	}

	@GetMapping("/subagent")
	public String showCompanyDetailsForm(Model model) {
		model.addAttribute("subAgent", new SubAgent());
		try {
			Optional<EnumEntity> workingEntity = enumEntityService.getEnumEntityByKey("working");
			workingEntity.ifPresent(entity -> model.addAttribute("workingList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving working list: ", e);
			model.addAttribute("workingList", List.of());
		}
		return "registersubagent";
	}

	@PostMapping("/subagent")
	public String processSubAgentForm(@ModelAttribute("subAgent") SubAgent subAgent, Model model) {
		try {
			subAgentService.addSubAgent(subAgent);

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("subAgent", subAgent);
		return "registersubagent";

	}

	@GetMapping("/subagentlist")
	public String getSubAgentList(Model model) {
		List<SubAgent> subAgentList = subAgentService.findAllAgent();
		model.addAttribute("subAgentList", subAgentList);
		return "subagentlist";
	}

	@GetMapping("/subagentlogin")
	public String login(Model model) {
		model.addAttribute("subAgent", new SubAgent());
		return "subagentlogin";

	}

	@PostMapping("/subagentlogin")
	public String login(@ModelAttribute("subAgent") SubAgent subAgent, @RequestParam("email") String email,
			@RequestParam("password") String password, Model model) {

		SubAgent subagent = subAgentService.getByEmail(email);
		if (subagent != null && subagent.getPassword().equals(password)) {

			model.addAttribute("subagent", subagent);
			return "subagentlist";
		} else {

			model.addAttribute("error", "Invalid user email or password.");
			return "subagentlogin";
		}
	}

}
