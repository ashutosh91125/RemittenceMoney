package com.llm.agent.controller;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.dto.AgentDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import com.llm.agent.service.IAgentService;
import com.llm.agent.model.Agent;

import java.time.LocalDateTime;

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
			if (agentDTO.getAgentName().isEmpty()){
				return new ResponseEntity<>("Failed to create agent!", HttpStatus.BAD_REQUEST);
			}
			Agent agent = new Agent();
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

}
