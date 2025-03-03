package com.llm.agent.controller;

import java.util.List;
import java.util.Optional;

import com.llm.UserIdentity.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.llm.agent.model.Agent;
import com.llm.agent.model.dto.AgentDTO;
import com.llm.agent.service.IAgentService;
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;

import lombok.RequiredArgsConstructor;

@Controller
//@SessionAttributes({ "agent" })
@RequiredArgsConstructor
public class AgentController {
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);

	@Autowired
	private IAgentService agentService;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private EnumEntityService enumEntityService;

//	@ModelAttribute("agent")
//	public Agent initializeSubAgent() {
//		return new Agent();
//	}

	@GetMapping("/agent")
	public String showCompanyDetailsForm(Model model) {
		model.addAttribute("agent", new AgentDTO());

		try {
			Optional<EnumEntity> countriesEntity = enumEntityService.getEnumEntityByKey("country");
			countriesEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of());
		}
		try {
			Optional<EnumEntity> countriesEntity = enumEntityService.getEnumEntityByKey("timezone");
			countriesEntity.ifPresent(entity -> model.addAttribute("timezoneList", entity.getValues()));

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
			model.addAttribute("workingHoursList", List.of());
		}
		return "agentregister";
	}

	@PostMapping("/agent")
	public String saveAgent(@ModelAttribute Agent agent) {
		agentService.addAgent(agent);
		return "agentlist";
	}

	@GetMapping("/agentlist")
	public String getAgentList(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		String country = (userRepository.findByUsername(username).get().getCountry());
		String role = authentication.getAuthorities().stream()
				.map(GrantedAuthority::getAuthority)
				.findFirst() // Assuming a single role per user
				.orElse("");

		if ("ROLE_ADMIN".equals(role)){
			List<Agent> agentList = agentService.findAllAgent();
			model.addAttribute("agentList", agentList);
			return "agentlist";
		}

		if ("ROLE_SUB_ADMIN".equals(role)){
			List<Agent> agentList = agentService.findByCountries(country);
			model.addAttribute("agentList", agentList);
			return "agentlist";
		}

		model.addAttribute("agentList", List.of());
		return "agentlist";


	}

	@GetMapping("/agentlogin")
	public String showLoginForm(Model model) {
		model.addAttribute("agent", new Agent());
		return "agentlogin";
	}

//	@PostMapping("/agentlogin")
//	public String loginAgent(@ModelAttribute("agent") Agent agent, Model model) {
//		Agent agent1 = agentService.getByEmail(agent.getEmail());
//
//		if (agent1 != null && agent1.getPassword().equals(agent.getPassword())) {
//			return "redirect:/agentlist";
//		} else {
//			model.addAttribute("error", "Invalid email or password");
//			return "agentlogin";
//		}
//	}
	@GetMapping("/agent-detail")
	public String getAgentDetails(@RequestParam("id") Long id, Model model) {

		Optional<Agent> fetch = agentService.getById(id);
		Agent agent = fetch.get();
		model.addAttribute("countries", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",agent.getCountries()));
		model.addAttribute("currencies", enumEntityService.getEnumValueDescriptionByKeyAndValueId("currency",agent.getCurrencies()));
		model.addAttribute("states", enumEntityService.getEnumValueDescriptionByKeyAndFilters("state",agent.getCountries(),agent.getState()));
		model.addAttribute("timezones", enumEntityService.getEnumValueDescriptionByKeyAndValueId("timezone",agent.getTimeZone()));
		model.addAttribute("agent", agent);
	  
		return "agent-details";
	}


	@GetMapping("/agent-update")
	public String showUpdateForm(@RequestParam("id") Long id, Model model) {
		Optional<Agent> existingAgent = agentService.getById(id);
		if (existingAgent.isPresent()) {
			model.addAttribute("agents", existingAgent);
		}
		try {
			Optional<EnumEntity> countriesEntity = enumEntityService.getEnumEntityByKey("country");
			countriesEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of());
		}
		try {
			Optional<EnumEntity> countriesEntity = enumEntityService.getEnumEntityByKey("timezone");
			countriesEntity.ifPresent(entity -> model.addAttribute("timezoneList", entity.getValues()));

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
			model.addAttribute("workingHoursList", List.of());
		}
		return "agent-view-update";
	}

}