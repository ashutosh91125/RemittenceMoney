package com.llm.agent.controller;

import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

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
			agent.setStatus(agentDTO.getStatus());
			agent.setPerTransaction(agentDTO.getPerTransaction());
			agent.setPerDay(agentDTO.getPerDay());
			agent.setPerMonth(agentDTO.getPerMonth());
			agent.setCreatedBy(username);
			agent.setCreatedOn(LocalDateTime.now());
			agent.setGrantType(agentDTO.getGrantType());
			agent.setScope(agentDTO.getScope());
			agent.setClientId(agentDTO.getClientId());
			agent.setClientSecret(agentDTO.getClientSecret());
//			agent.setModifiedBy(agentDTO.getModifiedBy());
//			agent.setModifiedOn(agentDTO.getModifiedOn());
//			agent.setDisabledBy(agentDTO.getDisabledBy());
//			agent.setDisabledOn(agentDTO.getDisabledOn());
//			agent.setRemarks(agentDTO.getRemarks());
			agent.setStatusFlag(agentDTO.getStatusFlag());
			agent.setIsValid(agentDTO.getIsValid());
			agent.setPerTransactionLimit(agentDTO.getPerTransactionLimit());
			agent.setPerDayLimit(agentDTO.getPerDayLimit());
			agent.setPerMonthLimit(agentDTO.getPerMonthLimit());
			agent.setUsername(agentDTO.getUsername());
			agent.setPassword(agentDTO.getPassword());
			agent.setOutletCode(agentDTO.getOutletCode());
			agent.setBranchLocationId(agentDTO.getBranchLocationId());

			agentService.addAgent(agent);

			User user = new User();
			user.setEmail(agent.getEmail());
			user.setPassword(new BCryptPasswordEncoder().encode(agentDTO.getPassword()));
			user.setAdminName(agentDTO.getAgentName());
			user.setUsername(agentDTO.getUsername());
			user.setPhoneNumber(agentDTO.getPhone());
			user.setCountry(agentDTO.getCountries());
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
	@PutMapping("{agentId}")
	public ResponseEntity<String> updateAgent(@PathVariable Long agentId, @ModelAttribute Agent agent) {
		try {
			Agent existingAgent = agentService.getByAgentId(String.valueOf(agentId));
	        if (existingAgent != null) {
	        	existingAgent.setAgentId(existingAgent.getAgentId());
				existingAgent.setCountries(existingAgent.getCountries());
				existingAgent.setCurrencies(existingAgent.getCurrencies());
				existingAgent.setAgentName(existingAgent.getAgentName());
				existingAgent.setAgentDisplayName(existingAgent.getAgentDisplayName());
				existingAgent.setAddress1(existingAgent.getAddress1());
				existingAgent.setAddress2(existingAgent.getAddress2());
				existingAgent.setAddress3(existingAgent.getAddress3());
				existingAgent.setCity(existingAgent.getCity());
				existingAgent.setState(existingAgent.getState());
				existingAgent.setZip(existingAgent.getZip());
				existingAgent.setTimeZone(existingAgent.getTimeZone());
				existingAgent.setEmail(existingAgent.getEmail());
				existingAgent.setMobile(existingAgent.getMobile());
				existingAgent.setPhone(existingAgent.getPhone());
				existingAgent.setContactPerson(existingAgent.getContactPerson());
				existingAgent.setMisEmailId(existingAgent.getMisEmailId());
				existingAgent.setTaxIdentificationNumber(existingAgent.getTaxIdentificationNumber());
				existingAgent.setLicenceNo(existingAgent.getLicenceNo());
				existingAgent.setTaxApplicable(existingAgent.getTaxApplicable());
				existingAgent.setWorkingHours(existingAgent.getWorkingHours());
				existingAgent.setDaily(existingAgent.getDaily());
				existingAgent.setSettlementMode(existingAgent.getSettlementMode());
				existingAgent.setSettlementType(existingAgent.getSettlementType());
				existingAgent.setStatus(existingAgent.getStatus());
				existingAgent.setPerTransaction(existingAgent.getPerTransaction());
				existingAgent.setPerDay(existingAgent.getPerDay());
				existingAgent.setPerMonth(existingAgent.getPerMonth());
//				existingAgent.setGrantType(existingAgent.getGrantType());
//				existingAgent.setScope(existingAgent.getScope());
//				existingAgent.setClientId(existingAgent.getClientId());
//				existingAgent.setClientSecret(existingAgent.getClientSecret());
//				existingAgent.setUsername(existingAgent.getUsername());
//				existingAgent.setPassword(existingAgent.getPassword());
				existingAgent.setModifiedOn(LocalDateTime.now());
				existingAgent.setDisabledBy(existingAgent.getDisabledBy());
				existingAgent.setDisabledOn(existingAgent.getDisabledOn());
				existingAgent.setRemarks(existingAgent.getRemarks());
				existingAgent.setStatusFlag(existingAgent.getStatusFlag());
				existingAgent.setIsValid(existingAgent.getIsValid());
				existingAgent.setPerTransactionLimit(existingAgent.getPerTransactionLimit());
				existingAgent.setPerDayLimit(existingAgent.getPerDayLimit());
				existingAgent.setPerMonthLimit(existingAgent.getPerMonthLimit());
				existingAgent.setUsername(existingAgent.getUsername());
			
				agentService.updateAgent(agentId,existingAgent);
//	            agentService.addAgent(existingAgent);
	        }
			return new ResponseEntity<>("agent update successfully!", HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("Failed to create agent!", HttpStatus.BAD_REQUEST);
		}
	}

}