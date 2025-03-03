package com.llm.staff.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.staff.model.dto.BranchResponseDto;
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
	private BranchDetailsRepository branchDetailsRepository;

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
			existingDetails.setBranches(updatedDetails.getBranches());
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

	@Override
	public List<BranchResponseDto> getBranchesByUsername(String username) {
		StaffDetails staff = staffDetailsRepository.findByUsername(username).orElse(null);

		if (staff == null || staff.getBranches() == null || staff.getBranches().isEmpty()) {
			return List.of();
		}

		List<BranchDetails> branchDetailsList = branchDetailsRepository.findByIdIn(staff.getBranches());

		return branchDetailsList.stream()
				.map(branch -> {
					String suffix = "";
					if ("STAFF_TR".equals(branch.getBranchStaffRole())) {
						suffix = " (TR)";
					} else if ("STAFF_HO".equals(branch.getBranchStaffRole())) {
						suffix = " (HO)";
					}
					return new BranchResponseDto(branch.getId(), branch.getBranchName() + suffix);
				})
				.collect(Collectors.toList());
	}

}
