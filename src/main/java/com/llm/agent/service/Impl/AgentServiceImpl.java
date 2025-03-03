package com.llm.agent.service.Impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.projection.AgentBranchProjection;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.raas.repository.BranchRepository;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
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

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private BranchDetailsRepository branchDetailsRepository;

	@Autowired
	private StaffDetailsRepository staffDetailsRepository;

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
	public List<Agent> findByCountries(String countries) {
		return agentRepositories.findByCountries(countries);
	}

	@Override
	public Agent getByBranchLocationId(String branchLocationId) {
		return agentRepositories.findByBranchLocationId(branchLocationId);
	}

	@Override
	public List<AgentBranchProjection> getAllAgentByProjection() {
		return agentRepositories.findAllProjectedBy();
	}

	@Override
	public AgentProjection getAgentProjectionByBranchLocationId(String branchLocationId) {
		return agentRepositories.findProjectionsByBranchLocationId(branchLocationId);
	}

	@Override
	public List<AgentBranchProjection> getAgentsProjectionByCountry(String country) {
		return agentRepositories.findProjectionsByCountries(country);
	}

	@Override
	public Optional<Agent> getById(Long id) {
		return agentRepositories.findById(id);
	}

	@Override
	public void updateAgent(Long id, Agent updatedAgent, String modifiedBy) {
	    Agent existingAgent = agentRepositories.findById(id)
	        .orElseThrow(() -> new IllegalArgumentException("Agent not found with id: " + id));

	    existingAgent.setCountries(updatedAgent.getAgentId());
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
	    existingAgent.setModifiedBy(modifiedBy);
	    existingAgent.setModifiedOn(LocalDateTime.now());
	    if (!updatedAgent.getStatusFlag()){
			existingAgent.setStatusFlag(false);
			existingAgent.setDisabledBy(modifiedBy);
			existingAgent.setDisabledOn(LocalDateTime.now());
			Optional<User> byUsername = userRepository.findByUsername(existingAgent.getUsername());
			byUsername.get().setApproved(false);
			userRepository.save(byUsername.get());

			List<BranchDetails> branchDetails = branchDetailsRepository.findByBranchLocationId(existingAgent.getBranchLocationId());

			for (BranchDetails branchDetail : branchDetails){
				branchDetail.setStatus(false);
				branchDetail.setDisabledBy(modifiedBy);
				branchDetail.setDisabledOn(LocalDateTime.now());

				branchDetailsRepository.save(branchDetail);
			}

			List<StaffDetails> staffs = staffDetailsRepository.findByBranchLocationId(existingAgent.getBranchLocationId());

			for (StaffDetails staffDetail : staffs){
				staffDetail.setStatus(false);
				staffDetail.setDisabledOn(LocalDateTime.now());
				staffDetail.setDisabledBy(modifiedBy);
				staffDetailsRepository.save(staffDetail);

				Optional<User> staffUser = userRepository.findByUsername(staffDetail.getUsername());
				staffUser.get().setApproved(false);
				userRepository.save(staffUser.get());
			}


		}else {
			Optional<User> byUsername = userRepository.findByUsername(existingAgent.getUsername());
			byUsername.get().setApproved(true);
			userRepository.save(byUsername.get());
			existingAgent.setStatusFlag(true);
			existingAgent.setDisabledBy("");
			existingAgent.setDisabledOn(null);
		}
	    existingAgent.setRemarks(updatedAgent.getRemarks());
	    existingAgent.setIsValid(updatedAgent.getIsValid());
	    existingAgent.setPerTransactionLimit(updatedAgent.getPerTransactionLimit());
	    existingAgent.setPerDayLimit(updatedAgent.getPerDayLimit());
	    existingAgent.setPerMonthLimit(updatedAgent.getPerMonthLimit());

		existingAgent.setBankName(updatedAgent.getBankName());
		existingAgent.setBranchName(updatedAgent.getBranchName());
		existingAgent.setAccountNumber(updatedAgent.getAccountNumber());

	    existingAgent.setBranchLocationId(updatedAgent.getBranchLocationId());
	    existingAgent.setCreditLimitStatus(updatedAgent.getCreditLimitStatus());
		existingAgent.setRemainingDaily(updatedAgent.getDaily());
		existingAgent.setRemainingPerDayLimit(updatedAgent.getPerDayLimit());
		existingAgent.setRemainingPerMonthLimit(updatedAgent.getPerMonthLimit());

	    // Save the updated agent
	    agentRepositories.save(existingAgent);
	}

	@Override
	public List<String> getAllAgentIds() {
	    return agentRepositories.findAll().stream()
	            .map(Agent::getAgentId)
	            .collect(Collectors.toList());
	}

}
