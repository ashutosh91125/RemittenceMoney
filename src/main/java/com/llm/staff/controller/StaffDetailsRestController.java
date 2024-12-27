package com.llm.staff.controller;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.model.dto.StaffDTO;
import com.llm.staff.model.dto.StaffDTO;
import com.llm.staff.service.StaffDetailsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
@Slf4j
@RequestMapping("/api/v1/staff")
public class StaffDetailsRestController {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private StaffDetailsService staffDetailsService;

    @PostMapping
    public ResponseEntity<String> registerStaff(@ModelAttribute StaffDTO staffDTO) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        log.info("Registering staff: {}", staffDTO);

        try {
            // Map StaffDTO to StaffDetails
            StaffDetails staff = new StaffDetails();
            staff.setBranch(staffDTO.getBranch());
            if (staffDTO.getStaffGroup() == Role.STAFF_TR){
                staff.setStaffGroup("Transfer");
            }else {
                staff.setStaffGroup("Head Office");
            }
            staff.setFirstName(staffDTO.getFirstName());
            staff.setMiddleName(staffDTO.getMiddleName());
            staff.setLastName(staffDTO.getLastName());
            staff.setUsername(staffDTO.getUsername());
            staff.setEmail(staffDTO.getEmail());
            staff.setMobile(staffDTO.getMobile());
            staff.setStatus(true);
            staff.setCreatedOn(LocalDateTime.now());
            staff.setCreatedBy(username);

            // Save StaffDetails
            staffDetailsService.createStaff(staff);

            // Create and save User
            User user = new User();
            user.setEmail(staff.getEmail());
            user.setPassword(new BCryptPasswordEncoder().encode(staffDTO.getPassword()));
            user.setAdminName(staffDTO.getFirstName() + " " + staffDTO.getLastName());
            user.setUsername(staffDTO.getUsername());
            user.setPhoneNumber(staffDTO.getMobile());
            user.setRole(staffDTO.getStaffGroup());
            user.setApproved(true);
            userRepository.save(user);

            return new ResponseEntity<>("Staff created successfully!", HttpStatus.CREATED);
        } catch (Exception e) {
            log.error("Error creating staff: {}", e.getMessage());
            return new ResponseEntity<>("Failed to create staff: " + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

}
