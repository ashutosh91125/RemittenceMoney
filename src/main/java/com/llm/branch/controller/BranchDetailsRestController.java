package com.llm.branch.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import com.llm.agent.model.Agent;
import com.llm.agent.projection.AgentProjection;
import com.llm.agent.repository.AgentRepositories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.projection.BranchProjection;
import com.llm.branch.service.BranchDetailsService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("api/v1/branch")
@Slf4j
public class BranchDetailsRestController {

    @Autowired
    private BranchDetailsService branchDetailsService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AgentRepositories agentRepositories;

    @PostMapping
    public ResponseEntity<String> registerBranch(@ModelAttribute BranchDetails branchDetails) {
        log.info(branchDetails.toString());

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        try {
            Agent byUsername = agentRepositories.findByUsername(username);

            branchDetails.setCounty(byUsername.getCountries());
            branchDetails.setBranchLocationId(byUsername.getBranchLocationId());
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
    
    @GetMapping("/branches")
	public ResponseEntity<?> getAllBrancByProjection() {
	    List<BranchProjection> branchIds = branchDetailsService.getBranchByProjection();
	    if (branchIds.isEmpty()) {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND)
	                .body("No agents found.");
	    }
	    return ResponseEntity.ok(branchIds);  // This will return agentId and agentName
	}

}
