package com.llm.staff.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import com.llm.branch.model.BranchDetails;
import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.staff.repository.StaffDetailsRepository;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.Agent;
import com.llm.agent.repository.AgentRepositories;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.model.dto.StaffDTO;
import com.llm.staff.projection.StaffDetailsProjection;
import com.llm.staff.service.StaffDetailsService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/api/v1/staff")
public class StaffDetailsRestController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AgentRepositories agentRepositories;

	@Autowired
	private BranchDetailsRepository branchDetailsRepository;

	@Autowired
	private StaffDetailsService staffDetailsService;

	@Autowired
	private StaffDetailsRepository staffDetailsRepository;

	@PostMapping
	public ResponseEntity<String> registerStaff(@ModelAttribute StaffDTO staffDTO) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		Agent byUsername = agentRepositories.findByUsername(username);
		Optional<BranchDetails> branch = branchDetailsRepository.findById(staffDTO.getBranches());
		String country = byUsername.getCountries();


		log.info("Registering staff: {}", staffDTO);

		try {
			// Map StaffDTO to StaffDetails
			StaffDetails staff = new StaffDetails();
			staff.setBranches(staffDTO.getBranches());
            branch.ifPresent(branchDetails -> staff.setStaffGroup(branchDetails.getBranchMode()));

			staff.setFirstName(staffDTO.getFirstName());
			staff.setMiddleName(staffDTO.getMiddleName());
			staff.setLastName(staffDTO.getLastName());
			staff.setUsername(staffDTO.getUsername());
			staff.setEmail(staffDTO.getEmail());
			staff.setMobile(staffDTO.getMobile());
			staff.setAgent(byUsername.getAgentId());
			staff.setStatus(true);
			staff.setCreatedOn(LocalDateTime.now());
			staff.setCreatedBy(username);
			staff.setCountry(country);
			staff.setBranchLocationId(branch.get().getBranchLocationId());

			// Save StaffDetails
			staffDetailsService.createStaff(staff);

			// Create and save User
			User user = new User();
			user.setEmail(staff.getEmail());
			user.setPassword(new BCryptPasswordEncoder().encode(staffDTO.getPassword()));
			user.setAdminName(staffDTO.getFirstName() + " " + staffDTO.getLastName());
			user.setUsername(staffDTO.getUsername());
			user.setCountry(country);
			user.setPhoneNumber(staffDTO.getMobile());
			if (staff.getStaffGroup().equals("Transaction")){
				user.setRole(Role.STAFF_TR);
			}else {
				user.setRole(Role.STAFF_HO);
			}

			user.setFirstLogin(true);
			user.setApproved(true);
			userRepository.save(user);

			return new ResponseEntity<>("Staff created successfully!", HttpStatus.CREATED);
		} catch (Exception e) {
			log.error("Error creating staff: {}", e.getMessage());
			return new ResponseEntity<>("Failed to create staff: " + e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}

	@PutMapping("{id}")
	public ResponseEntity<String> updateStaff(@PathVariable("id") Long id,
			@ModelAttribute StaffDetails updatedDetails) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();

		try {
//			Agent agent = agentRepositories.findByUsername(username);
//			String country = agent.getCountries();
//			updatedDetails.setAgent(agent.getAgentId());
//			updatedDetails.setCountry(country);
			staffDetailsService.updateStaff(id, updatedDetails, username);

			return new ResponseEntity<>("Staff updated successfully!", HttpStatus.OK);
		} catch (Exception e) {
			log.error("Error updating staff: {}", e.getMessage());
			return new ResponseEntity<>("Failed to update staff: " + e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
	 @GetMapping("/staff")
		public ResponseEntity<?> getAllStaffByProjection() {
		 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		 String username = authentication.getName();
		 String role = authentication.getAuthorities().stream()
				 .map(GrantedAuthority::getAuthority)
				 .findFirst()
				 .orElse(null);

		 if ("ROLE_ADMIN".equals(role)) {
			 return ResponseEntity.ok(staffDetailsService.getAllStaffByProjection());
		 }

		 if ("ROLE_SUB_ADMIN".equals(role)) {
			 Optional<User> user = userRepository.findByUsername(username);
			 return ResponseEntity.ok(staffDetailsService.getAllStaffByProjectionByCountry(user.get().getCountry()));
		 }

		 if ("ROLE_AGENT".equals(role)) {
			 Agent byUsername = agentRepositories.findByUsername(username);
			 return ResponseEntity.ok(staffDetailsService.getAllStaffByProjectionByAgent(byUsername.getAgentId()));
		 }
		 return ResponseEntity.ok(List.of());
	 }
}
