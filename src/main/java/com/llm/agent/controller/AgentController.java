package com.llm.agent.controller;

import java.util.List;
import java.util.Optional;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.service.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;
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
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import com.llm.model.Agent;

@Controller
//@SessionAttributes({ "agent" })
@RequiredArgsConstructor
public class AgentController {
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);

	@Autowired
	private IAgentService agentService;

	@Autowired
	private EnumEntityService enumEntityService;

	@Autowired
	private CustomUserDetailsService customUserDetailsService;

//	@ModelAttribute("agent")
//	public Agent initializeSubAgent() {
//		return new Agent();
//	}

	@GetMapping("/agent")
	public String showCompanyDetailsForm(Model model) {
		model.addAttribute("agent", new Agent());

		try {
			Optional<EnumEntity> countriesEntity = enumEntityService.getEnumEntityByKey("country");
			countriesEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of());
		}
		try {
			Optional<EnumEntity> currencyEntity = enumEntityService.getEnumEntityByKey("currency");
			currencyEntity.ifPresent(entity -> model.addAttribute("currencyList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving currency list: ", e);
			model.addAttribute("currencyList", List.of());
		}
		try {
			Optional<EnumEntity> nativeRegionEntity = enumEntityService.getEnumEntityByKey("state");
			nativeRegionEntity.ifPresent(entity -> model.addAttribute("stateList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error Native Region List: ", e);
			model.addAttribute("native Region List", List.of()); // or set a default list if needed
		}
		try {
			Optional<EnumEntity> workingEntity = enumEntityService.getEnumEntityByKey("workingHours");
			workingEntity.ifPresent(entity -> model.addAttribute("workingHoursList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving working list: ", e);
			model.addAttribute("workingList", List.of());
		}
		return "agentregister";
	}

	@GetMapping("/agentlist")
	public String getAdminList(Model model) {
		List<User> agentList = customUserDetailsService.getUserByRole(Role.AGENT);
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

		if (agent1 != null && agent1.getPassword().equals(agent.getPassword())) {
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
