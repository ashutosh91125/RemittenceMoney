package com.llm.agent.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.Agent;
import com.llm.agent.model.dto.AgentDTO;
import com.llm.agent.service.IAgentService;

@RestController
@RequestMapping("/api/v1/agent")
public class AgentRestController {
	private static final Logger logger = LoggerFactory.getLogger(AgentRestController.class);
	@Autowired
	private IAgentService agentService;

	@Autowired
	private UserRepository userRepository;

	@PostMapping
	public ResponseEntity<String> registerAgent(@ModelAttribute AgentDTO agentDTO) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		logger.info(agentDTO.toString());
		try {
			if (agentDTO.getAgentName().isEmpty()) {
				return new ResponseEntity<>("Failed to create agent!", HttpStatus.BAD_REQUEST);
			}
			Agent agent = new Agent();
			agent.setAgentId(agentDTO.getAgentId());
			agent.setCountries(agentDTO.getCountries());
			agent.setCurrencies(agentDTO.getCurrencies());
			agent.setAgentName(agentDTO.getAgentName());
			agent.setAgentDisplayName(agentDTO.getAgentDisplayName());
			agent.setAddress1(agentDTO.getAddress1());
			agent.setAddress2(agentDTO.getAddress2());
			agent.setAddress3(agentDTO.getAddress3());
			agent.setCity(agentDTO.getCity());
			agent.setState(agentDTO.getState());
			agent.setZip(agentDTO.getZip());
			agent.setTimeZone(agentDTO.getTimeZone());
			agent.setEmail(agentDTO.getEmail());
			agent.setMobile(agentDTO.getMobile());
			agent.setPhone(agentDTO.getPhone());
			agent.setContactPerson(agentDTO.getContactPerson());
			agent.setMisEmailId(agentDTO.getMisEmailId());
			agent.setTaxIdentificationNumber(agentDTO.getTaxIdentificationNumber());
			agent.setLicenceNo(agentDTO.getLicenceNo());
			agent.setTaxApplicable(agentDTO.getTaxApplicable());
			agent.setWorkingHours(agentDTO.getWorkingHours());
			agent.setDaily(agentDTO.getDaily());
			agent.setSettlementMode(agentDTO.getSettlementMode());
			agent.setSettlementType(agentDTO.getSettlementType());
			agent.setPerTransaction(agentDTO.getPerTransaction());
			agent.setCreatedBy(username);
			agent.setCreatedOn(LocalDateTime.now());
			agent.setGrantType(agentDTO.getGrantType());
			agent.setScope(agentDTO.getScope());
			agent.setClientId(agentDTO.getClientId());
			agent.setClientSecret(agentDTO.getClientSecret());
			agent.setCreditLimitStatus(agentDTO.getCreditLimitStatus());
//			agent.setModifiedBy(agentDTO.getModifiedBy());
//			agent.setModifiedOn(agentDTO.getModifiedOn());
//			agent.setDisabledBy(agentDTO.getDisabledBy());
//			agent.setDisabledOn(agentDTO.getDisabledOn());
//			agent.setRemarks(agentDTO.getRemarks());
			agent.setStatusFlag(true);
			agent.setIsValid(agentDTO.getIsValid());
			agent.setPerTransactionLimit(agentDTO.getPerTransactionLimit());
			agent.setPerDayLimit(agentDTO.getPerDayLimit());
			agent.setPerMonthLimit(agentDTO.getPerMonthLimit());
			agent.setUsername(agentDTO.getUsername());
			agent.setOutletCode(agentDTO.getOutletCode());
			agent.setBranchLocationId(agentDTO.getBranchLocationId());
			agent.setApiUsername(agentDTO.getApiUsername());
			agent.setApiPassword(agentDTO.getApiPassword());

			agentService.addAgent(agent);

			User user = new User();
			user.setEmail(agent.getEmail());
			user.setPassword(new BCryptPasswordEncoder().encode(agentDTO.getPassword()));
			user.setAdminName(agentDTO.getAgentName());
			user.setUsername(agentDTO.getUsername());
			user.setPhoneNumber(agentDTO.getPhone());
			user.setCountry(agentDTO.getCountries());
			user.setFirstLogin(true);
			user.setRole(Role.AGENT);
			user.setApproved(true);
			userRepository.save(user);

			return new ResponseEntity<>("agent create successfully!", HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("Failed to create agent!", HttpStatus.BAD_REQUEST);
		}

	}

//	 @PostMapping("/view-update")
//	    public RedirectView submitForm(@ModelAttribute("agent") Agent agent, Model model) {
//		 Long agentId = Long.valueOf(agent.getAgentId());
//		 return new RedirectView("/agent?agentId=" + agentId, true);
//
//	    }

	@PutMapping("{id}")
	public ResponseEntity<String> updateAgent(@PathVariable Long id, @ModelAttribute Agent agents) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();

		try {
			agentService.updateAgent(id, agents, username);
			return new ResponseEntity<>("Agent updated successfully!", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("Failed to update agent!", HttpStatus.BAD_REQUEST);
		}
	}

	@GetMapping("/{agentId}")
	public ResponseEntity<String> getAgentNameByAgentId(@PathVariable Long agentId) {
		Agent existingAgent = agentService.getByAgentId(String.valueOf(agentId));
		if (existingAgent != null) {
			return ResponseEntity.ok().body(existingAgent.getAgentName());
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Agent not found for agentId: " + agentId);
		}
	}

	@GetMapping("/agentId")
	public ResponseEntity<?> getAllAgentIds() {
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();

	    String role = authentication.getAuthorities().stream()
	            .map(authority -> authority.getAuthority())
	            .findFirst() 
	            .orElse("");

	    List<String> allAgentIds = new ArrayList<>();
	    if (role.equals("ROLE_AGENT") || role.equals("ROLE_SUB_ADMIN")) {
	        allAgentIds = agentService.getAllAgentIds();
	    }
	     
	    if (allAgentIds.isEmpty()) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
	                .body("No agents found.");
	    }
	    return ResponseEntity.ok(allAgentIds);
	}


}