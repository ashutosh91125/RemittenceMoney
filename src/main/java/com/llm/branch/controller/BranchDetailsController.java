package com.llm.branch.controller;

import java.util.List;
import java.util.Optional;

import com.llm.UserIdentity.model.enums.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.Agent;
import com.llm.agent.projection.AgentProjection;
import com.llm.agent.repository.AgentRepositories;
import com.llm.agent.service.IAgentService;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.service.BranchDetailsService;
import com.llm.common.model.EnumEntity;
import com.llm.common.model.EnumValue;
import com.llm.common.service.EnumEntityService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BranchDetailsController {

    @Autowired
    private BranchDetailsService branchDetailsService;

    @Autowired
    private EnumEntityService enumEntityService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private IAgentService agentService;
    
    @Autowired
    private AgentRepositories agentRepositories;

    @GetMapping("/branch")
    public String branchRegister(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<User> byUsername = userRepository.findByUsername(username);

        String country = byUsername.get().getCountry();
        model.addAttribute("branch", new BranchDetails());

        try {
            List<EnumValue> nativeRegionEntity = enumEntityService.getDataByDependent(country);
            model.addAttribute("stateList", nativeRegionEntity);

        } catch (Exception e) {
            log.error("Error Native Region List: ", e);
            model.addAttribute("stateList", List.of()); // or set a default list if needed
        }

        try {
            List<AgentProjection> agentProjections = agentService.getAllAgentByProjection();
            model.addAttribute("agentList", agentProjections);

        } catch (Exception e) {
            log.error("Error Native Region List: ", e);
            model.addAttribute("agentList", List.of()); // or set a default list if needed
        }

        try {
            Optional<EnumEntity> workingEntity = enumEntityService.getEnumEntityByKey("workingHours");
            workingEntity.ifPresent(entity -> model.addAttribute("workingHoursList", entity.getValues()));

        } catch (Exception e) {
            log.error("Error retrieving working list: ", e);
            model.addAttribute("workingHoursList", List.of());
        }

        return "branch-register";
    }

    @GetMapping("/branch-list")
    public String getBranchDetailsList(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        // Extract the user's role
        String role = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .findFirst() // Assuming a single role per user
                .orElse("");

        // Check role and fetch data accordingly
        if (role.equals("ROLE_AGENT")) { // Ensure you check against the correct role string
            Agent agent = agentRepositories.findByUsername(username);
            List<BranchDetails> branchDetailsList = branchDetailsService.getAllBranchesByAgent(agent.getAgentId());
            model.addAttribute("branchDetailsList", branchDetailsList);
            return "branch-listing";
        }

        if (role.equals("ROLE_SUB_ADMIN")) { // Ensure you check against the correct role string
            Optional<User> byUsername = userRepository.findByUsername(username);
            List<BranchDetails> branchDetailsList = branchDetailsService.getAllBranchesByCountry(byUsername.get().getCountry());
            model.addAttribute("branchDetailsList", branchDetailsList);
            return "branch-listing";
        }

        List<BranchDetails> branchDetailsList = branchDetailsService.getAllBranches();
        model.addAttribute("branchDetailsList", branchDetailsList);
        return "branch-listing";
    }

    @GetMapping("/branch-detail")
    public String getAdminDetails(@RequestParam("id") Long id,Model model) {
    	Optional<BranchDetails> branchDetails = branchDetailsService.getById(id);
    	if(branchDetails.isPresent()) {
    		Agent agents = agentService.getByAgentId(branchDetails.get().getAgent());
    		model.addAttribute("agent", agents.getAgentName());
    		model.addAttribute("states", enumEntityService.getEnumValueDescriptionByKeyAndValueId("state",branchDetails.get().getState()));
    		model.addAttribute("branch", branchDetails);
    	}
    	
    	return "branch-details";
    }
}  
