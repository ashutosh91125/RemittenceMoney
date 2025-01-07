package com.llm.branch.controller;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.service.BranchDetailsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Optional;

@RestController
@RequestMapping("api/v1/branch")
@Slf4j
public class BranchDetailsRestController {

    @Autowired
    private BranchDetailsService branchDetailsService;

    @Autowired
    private UserRepository userRepository;

    @PostMapping
    public ResponseEntity<String> registerBranch(@ModelAttribute BranchDetails branchDetails) {
        log.info(branchDetails.toString());

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        try {
            Optional<User> byUsername = userRepository.findByUsername(username);

            branchDetails.setCounty(byUsername.get().getCountry());
            branchDetails.setCreatedBy(username);
            branchDetails.setCreatedOn(LocalDateTime.now());
            branchDetails.setStatus(true);
            branchDetailsService.createBranch(branchDetails);

            return new ResponseEntity<>("Branch create successfully!", HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Failed to create branch!", HttpStatus.BAD_REQUEST);
        }

    }

    @GetMapping
    public ResponseEntity<String> getAllBranches() {

        try {
            branchDetailsService.getAllBranches();

            return new ResponseEntity<>("Fetched successfully!", HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Failed to fetch the branch details!", HttpStatus.BAD_REQUEST);
        }

    }
    
    @PutMapping("/{branchId}")
    public ResponseEntity<String> updateBranch(@PathVariable("branchId") Long branchId, @ModelAttribute BranchDetails branchDetails) {
        log.info(branchDetails.toString());

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        try {
            Optional<User> byUsername = userRepository.findByUsername(username);

            if (!byUsername.isPresent()) {
                return new ResponseEntity<>("User not found!", HttpStatus.NOT_FOUND);
            }

            boolean updated = branchDetailsService.updateBranch(branchId, branchDetails, byUsername.get(), username);
            
            if (updated) {
                return new ResponseEntity<>("Branch updated successfully!", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Branch not found!", HttpStatus.NOT_FOUND);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Failed to update branch!", HttpStatus.BAD_REQUEST);
        }
    }




}
