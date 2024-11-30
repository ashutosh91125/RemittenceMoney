package com.llm.controller;

import java.util.List;
import java.util.Map;

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

import com.llm.Service.IAgentService;
import com.llm.model.Agent;

@Controller
@SessionAttributes({ "agent" })
public class AgentController {
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);

	@Autowired
	private IAgentService agentService;

	@ModelAttribute("agent")
	public Agent initializeSubAgent() {
		return new Agent();
	}

	@GetMapping("/agent")
	public String showCompanyDetailsForm(Model model) {
		logger.info("Displaying company details form");
		model.addAttribute("agent", new Agent());
		return "companydetails";
	}

	@PostMapping("/agent")
	public String processCompanyDetails(@RequestParam("step") int step, @ModelAttribute("agent") Agent agent,
			Model model) {
		logger.info("Processing company details: {}", agent);
		try {
			if (step == 1) {

				model.addAttribute("step", 2);
				model.addAttribute("agent", agent);
				return "contactdetails";

			} else if (step == 2) {
				model.addAttribute("step", 3);
				model.addAttribute("agent", agent);
				return "regularitydetails";
			} else if (step == 3) {
				model.addAttribute("step", 4);
				model.addAttribute("agent", agent);
				return "creditlimit";
			} else if (step == 4) {
				model.addAttribute("step", 5);
				model.addAttribute("agent", agent);
				return "customertansaction";
			} else if (step == 5) {
				model.addAttribute("step", 6);
				model.addAttribute("agent", agent);
				return "apidetails";
			} else if (step == 6) {
				model.addAttribute("step", 7);
				model.addAttribute("agent", agent);
				return "auditdetails";
			} else if (step == 7) {
				agentService.addAgent(agent);
				return "success";
			}
		} catch (

		Exception e) {
			logger.error("Error processing company details: ", e);
			return "error";
		}
		return "companydetails";
	}

	

	@GetMapping("/agentlist")
	public String getAdminList(Model model) {
		List<Agent> agentList = agentService.findAllAgent();
		model.addAttribute("agentList", agentList);
		return "agentlist";

	}

	@GetMapping("/agentlogin")
	public String showLoginForm(Model model) {
		model.addAttribute("agent", new Agent());
		return "agentlogin";
	}

	@PostMapping("/agentlogin")
	public String loginAgent(@ModelAttribute("agent") Agent agent, Model model) {
		Agent agent1 = agentService.getByEmail(agent.getEmail());

		if (agent1 != null && agent1.getAdminPassword().equals(agent.getAdminPassword())) {
			return "redirect:/agentlist";
		} else {
			model.addAttribute("error", "Invalid email or password");
			return "agentlogin";
		}
	}

	private Long getLongValue(Object value) {
		if (value instanceof Long) {
			return (Long) value;
		} else if (value instanceof String) {
			String strValue = (String) value;
			if (strValue != null && !strValue.isEmpty()) {
				try {
					return Long.parseLong(strValue);
				} catch (NumberFormatException e) {
					logger.error("Invalid number format for value: {}", strValue);
				}
			}
		}
		return null;
	}

	private Long parseLong(Object value) {
		if (value instanceof Long) {
			return (Long) value;
		} else if (value instanceof String) {
			String strValue = (String) value;
			if (strValue != null && !strValue.isEmpty()) {
				try {
					return Long.parseLong(strValue);
				} catch (NumberFormatException e) {
					logger.error("Invalid number format for value: {}", strValue);
				}
			}
		}
		return null;
	}

}
