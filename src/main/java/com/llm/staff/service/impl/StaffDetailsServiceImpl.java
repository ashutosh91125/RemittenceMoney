package com.llm.staff.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.Agent;
import com.llm.agent.repository.AgentRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.staff.model.StaffDetails;
import com.llm.staff.projection.StaffDetailsProjection;
import com.llm.staff.repository.StaffDetailsRepository;
import com.llm.staff.service.StaffDetailsService;

import jakarta.persistence.EntityNotFoundException;

@Service
public class StaffDetailsServiceImpl implements StaffDetailsService {

	@Autowired
	private StaffDetailsRepository staffDetailsRepository;

	@Autowired
	private AgentRepositories agentRepositories;

	@Autowired
	private UserRepository userRepository;

	@Override
	public void createStaff(StaffDetails staffDetails) {
		staffDetailsRepository.save(staffDetails);
	}

	@Override
	public List<StaffDetails> getAllStaff() {
		return staffDetailsRepository.findAll();
	}

	@Override
	public List<StaffDetails> getAllStaffByAgent(String agent) {
		return staffDetailsRepository.findByAgent(agent);
	}

	@Override
	public List<StaffDetails> getAllStaffByBranchLocationId(String branchLocationId) {
		return staffDetailsRepository.findByBranchLocationId(branchLocationId);
	}

	@Override
	public List<StaffDetails> getAllStaffByCountry(String county) {
		return staffDetailsRepository.findByCountry(county);
	}

	@Override
	public Optional<StaffDetails> getById(Long id) {
		return staffDetailsRepository.findById(id);
	}

	@Override
	public void updateStaff(Long id, StaffDetails updatedDetails, String updatedBy) {
		Optional<StaffDetails> optionalStaffDetails = staffDetailsRepository.findById(id);

		if (optionalStaffDetails.isPresent()) {
			StaffDetails existingDetails = optionalStaffDetails.get();

			existingDetails.setFirstName(updatedDetails.getFirstName());
			existingDetails.setMiddleName(updatedDetails.getMiddleName());
			existingDetails.setLastName(updatedDetails.getLastName());
			existingDetails.setEmail(updatedDetails.getEmail());
			existingDetails.setModifiedBy(updatedBy);
			existingDetails.setModifiedOn(LocalDateTime.now());
			existingDetails.setRemarks(updatedBy);
			if (!updatedDetails.isStatus()){
				existingDetails.setStatus(false);
				existingDetails.setDisabledBy(updatedBy);
				existingDetails.setDisabledOn(LocalDateTime.now());
				Optional<User> byUsername = userRepository.findByUsername(existingDetails.getUsername());
				byUsername.get().setApproved(false);
				userRepository.save(byUsername.get());
			}
			else {
				existingDetails.setStatus(true);
				existingDetails.setDisabledBy("");
				existingDetails.setDisabledOn(null);

				Optional<User> byUsername = userRepository.findByUsername(existingDetails.getUsername());
				byUsername.get().setApproved(true);
				userRepository.save(byUsername.get());
			}

			existingDetails.setStatus(updatedDetails.isStatus());
			staffDetailsRepository.save(existingDetails);
		} else {
			throw new EntityNotFoundException("Staff not found with ID: " + id);
		}
	}

	@Override
	public List<StaffDetailsProjection> getAllStaffByProjection() {
		return staffDetailsRepository.findAllProjectedBy();
	}

	@Override
	public List<StaffDetailsProjection> getAllStaffByProjectionByCountry(String country) {
		return staffDetailsRepository.findProjectionsByCountry(country);
	}

	@Override
	public List<StaffDetailsProjection> getAllStaffByProjectionByAgent(String agent) {
		return staffDetailsRepository.findProjectionsByAgent(agent);
	}

}
