package com.llm.agent.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.Agent;
import com.llm.agent.model.dto.AgentDTO;
import com.llm.agent.model.dto.AgentDto1;
import com.llm.agent.repository.AgentRepositories;
import com.llm.agent.service.IAgentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/v1/agent")
public class AgentRestController {
	private static final Logger logger = LoggerFactory.getLogger(AgentRestController.class);
	@Autowired
	private IAgentService agentService;

	@Autowired
	private AgentRepositories agentRepositories;

	@Autowired
	private UserRepository userRepository;

	@PostMapping
	public ResponseEntity<String> registerAgent(@ModelAttribute AgentDTO agentDTO) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		logger.info(agentDTO.toString());
		try {
			if (agentRepositories.existsByUsername(agentDTO.getUsername())){
				return new ResponseEntity<>("Username already exists!!", HttpStatus.CONFLICT);
			}

			if (agentRepositories.existsByBranchLocationId(agentDTO.getBranchLocationId())){
				return new ResponseEntity<>("Agent Location Id already exists!!", HttpStatus.CONFLICT);
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
			agent.setRemainingDaily(agent.getDaily());
			agent.setSettlementMode(agentDTO.getSettlementMode());
			agent.setSettlementType(agentDTO.getSettlementType());
//			agent.setPerTransaction(agentDTO.getPerTransaction());
			agent.setCreatedBy(username);
			agent.setCreatedOn(LocalDateTime.now());
			agent.setGrantType(agentDTO.getGrantType());
			agent.setScope(agentDTO.getScope());
			agent.setClientId(agentDTO.getClientId());
			agent.setClientSecret(agentDTO.getClientSecret());
			agent.setCreditLimitStatus(agentDTO.getCreditLimitStatus());

			agent.setBankName(agentDTO.getBankName());
			agent.setBranchName(agentDTO.getBranchName());
			agent.setAccountNumber(agentDTO.getAccountNumber());
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
			agent.setRemainingPerDayLimit(agent.getPerDayLimit());
			agent.setRemainingPerMonthLimit(agent.getPerMonthLimit());
			agent.setUsername(agentDTO.getUsername());
			agent.setBranchLocationId(agentDTO.getBranchLocationId());
			agent.setApiUsername(agentDTO.getApiUsername());
			agent.setApiPassword(agentDTO.getApiPassword());

			agentService.addAgent(agent);

			User user = new User();
			user.setEmail(agent.getEmail());
			user.setPassword(new BCryptPasswordEncoder().encode(agentDTO.getPassword()));
			if (user.getPasswordHistory() == null) {
				user.setPasswordHistory(new ArrayList<>());
			}
			user.getPasswordHistory().add(user.getPassword());
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

	@GetMapping("/{id}")
	public ResponseEntity<String> getAgentNameByAgentId(@PathVariable Long id) {
		Optional<Agent> existingAgent = agentService.getById(id);
		if (existingAgent.isPresent()) {
			Agent agent = existingAgent.get();
			return ResponseEntity.ok().body(agent.getAgentName());
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Agent not found for Id: " + id);
		}
	}

//	@GetMapping("/agentId")
//	public ResponseEntity<?> getAllAgentIds() { 
//	    List<String> allAgentIds = agentService.getAllAgentIds();
//	    if (allAgentIds.isEmpty()) {
//	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
//	                .body("No agents found.");
//	    }
//	    return ResponseEntity.ok(allAgentIds);
//	}
	@GetMapping("/agents")
	public ResponseEntity<?> getAllAgentIds() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		String role = authentication.getAuthorities().stream()
				.map(GrantedAuthority::getAuthority)
				.findFirst()
				.orElse(null);

		if ("ROLE_ADMIN".equals(role)){
			return ResponseEntity.ok(agentService.getAllAgentByProjection());
		}

		if ("ROLE_SUB_ADMIN".equals(role)){
			Optional<User> user = userRepository.findByUsername(username);
			return ResponseEntity.ok(agentService.getAgentsProjectionByCountry(user.get().getCountry()));
		}
	return ResponseEntity.ok(List.of());
	}
	
	@PostMapping("/api-details/{id}")
	public ResponseEntity<AgentDto1> getAgentApiDetailsById(
	        @PathVariable("id") Long id, 
	        @RequestParam String password) {
	    
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    String username = authentication.getName();
	    
	    Optional<User> user = userRepository.findByUsername(username);
	    
	    if (user.isPresent()) {
	        User foundUser = user.get();
	        String foundPassword = foundUser.getPassword();
	        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	        if (passwordEncoder.matches(password, foundPassword)) {
	            Optional<Agent> existingAgent = agentService.getById(id); 
	            
	            if (existingAgent.isPresent()) {
	                Agent agent = existingAgent.get();
	                
	                
	                AgentDto1 agentDto = new AgentDto1();
	                agentDto.setId(agent.getId());
	                agentDto.setClientId(agent.getClientId());
	                agentDto.setClientSecret(agent.getClientSecret());
	                agentDto.setGrantType(agent.getGrantType());
	                agentDto.setScope(agent.getScope());
	                agentDto.setApiUsername(agent.getApiUsername());
	                agentDto.setApiPassword(agent.getApiPassword());
	                
	                return ResponseEntity.ok().body(agentDto);
	            } else {
	                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
	            }
	        } else {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
	        }
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); 
	    }
	}


}
