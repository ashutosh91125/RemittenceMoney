package com.llm.branch.controller;

import java.util.List;
import java.util.Optional;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.llm.agent.projection.AgentProjection;
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

    @GetMapping("/branch")
    public String branchRegister(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<User> byUsername = userRepository.findByUsername(username);

        String country = byUsername.get().getCountry();
        log.info("+++++++++===Country====++++ :" + country);

        model.addAttribute("branch", new BranchDetails());

        try {
            List<EnumValue> nativeRegionEntity = enumEntityService.getDataByDependent("MY");
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
    public String getAdminList(Model model) {
        List<BranchDetails> branchDetailsList = branchDetailsService.getAllBranches();
        model.addAttribute("branchDetailsList", branchDetailsList);
        return "branch-listing";

    }
    @GetMapping("/branch-detail")
    public String getAdminDetails(@RequestParam("id") Long id,Model model) {
    	Optional<BranchDetails> branchDetails = branchDetailsService.getById(id);
    	if(branchDetails.isPresent()) {
    		model.addAttribute("agent",agentService.getById(id).get().getAgentName());
    		model.addAttribute("states", enumEntityService.getEnumValueDescriptionByKeyAndValueId("state",branchDetails.get().getState()));
    		model.addAttribute("branch",branchDetails);
    	}
    	return "branch-details";
    }
}
