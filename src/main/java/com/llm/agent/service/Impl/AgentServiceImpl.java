package com.llm.agent.service.Impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.agent.model.Agent;
import com.llm.agent.projection.AgentProjection;
import com.llm.agent.repository.AgentRepositories;
import com.llm.agent.service.IAgentService;

@Service
public class AgentServiceImpl implements IAgentService {
	@Autowired
	private AgentRepositories agentRepositories;

	@Override
	public void addAgent(Agent agent) {
		agentRepositories.save(agent);
	}

	@Override
	public List<Agent> findAllAgent() {
		return agentRepositories.findAll();
	}

	@Override
	public Agent getByEmail(String email) {
		return agentRepositories.findByEmail(email);
	}

	@Override
	public Agent getByAgentId(String agentId) {
		return agentRepositories.findByAgentId(agentId);
	}

	@Override
	public List<AgentProjection> getAllAgentByProjection() {
		return agentRepositories.findAllProjectedBy();
	}

	@Override
	public Optional<Agent> getById(Long id) {
		return agentRepositories.findById(id);
	}

	@Override
	public double checkCreditLimit(String agentId){
		Agent byAgentId = agentRepositories.findByAgentId(agentId);
		return byAgentId.getDaily();
	}

	@Override
	public void updateAgent(Long id, Agent updatedAgent, String modifiedBy) {
	    Agent existingAgent = agentRepositories.findById(id)
	        .orElseThrow(() -> new IllegalArgumentException("Agent not found with id: " + id));

	    // Update fields of the existing entity with values from the updatedAgent
	    existingAgent.setCountries(updatedAgent.getCountries());
	    existingAgent.setCurrencies(updatedAgent.getCurrencies());
	    existingAgent.setAgentName(updatedAgent.getAgentName());
	    existingAgent.setAgentDisplayName(updatedAgent.getAgentDisplayName());
	    existingAgent.setAddress1(updatedAgent.getAddress1());
	    existingAgent.setAddress2(updatedAgent.getAddress2());
	    existingAgent.setAddress3(updatedAgent.getAddress3());
	    existingAgent.setCity(updatedAgent.getCity());
	    existingAgent.setState(updatedAgent.getState());
	    existingAgent.setZip(updatedAgent.getZip());
	    existingAgent.setTimeZone(updatedAgent.getTimeZone());
	    existingAgent.setEmail(updatedAgent.getEmail());
	    existingAgent.setMobile(updatedAgent.getMobile());
	    existingAgent.setPhone(updatedAgent.getPhone());
	    existingAgent.setContactPerson(updatedAgent.getContactPerson());
	    existingAgent.setMisEmailId(updatedAgent.getMisEmailId());
	    existingAgent.setTaxIdentificationNumber(updatedAgent.getTaxIdentificationNumber());
	    existingAgent.setLicenceNo(updatedAgent.getLicenceNo());
	    existingAgent.setTaxApplicable(updatedAgent.getTaxApplicable());
	    existingAgent.setWorkingHours(updatedAgent.getWorkingHours());
	    existingAgent.setDaily(updatedAgent.getDaily());
	    existingAgent.setSettlementMode(updatedAgent.getSettlementMode());
	    existingAgent.setSettlementType(updatedAgent.getSettlementType());
	    existingAgent.setPerTransaction(updatedAgent.getPerTransaction());
	    existingAgent.setModifiedBy(modifiedBy);
	    existingAgent.setModifiedOn(LocalDateTime.now());
	    existingAgent.setDisabledBy(modifiedBy);
	    existingAgent.setDisabledOn(LocalDateTime.now());
	    existingAgent.setRemarks(updatedAgent.getRemarks());
	    existingAgent.setStatusFlag(updatedAgent.getStatusFlag());
	    existingAgent.setIsValid(updatedAgent.getIsValid());
	    existingAgent.setPerTransactionLimit(updatedAgent.getPerTransactionLimit());
	    existingAgent.setPerDayLimit(updatedAgent.getPerDayLimit());
	    existingAgent.setPerMonthLimit(updatedAgent.getPerMonthLimit());
	    existingAgent.setOutletCode(updatedAgent.getOutletCode());
	    existingAgent.setBranchLocationId(updatedAgent.getBranchLocationId());

	    // Save the updated agent
	    agentRepositories.save(existingAgent);
	}
}
