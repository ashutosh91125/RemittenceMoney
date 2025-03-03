package com.llm.staff.controller;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.agent.model.Agent;
import com.llm.agent.repository.AgentRepositories;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.model.dto.BranchDTO;
import com.llm.branch.service.BranchDetailsService;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.model.dto.StaffDTO;
import com.llm.staff.service.StaffDetailsService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class StaffDetailsController {

    @Autowired
    private final StaffDetailsService staffDetailsService;

    @Autowired
    private final BranchDetailsService branchDetailsService;

    @Autowired
    private final AgentRepositories agentRepositories;

    @Autowired
    private final UserRepository userRepository;

//    @GetMapping("/staff-login")
//    public String staffLogin(Model model) {
//        return "staff-login";
//    }

    @GetMapping("/staff")
    public String showCompanyDetailsForm(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Agent byUsername = agentRepositories.findByUsername(username);
        model.addAttribute("staff", new StaffDTO());
        try {
            List<BranchDTO> branchDTOS = branchDetailsService.getAllBranchDTOByBranchLocationId(byUsername.getBranchLocationId(), true);
            model.addAttribute("branchList", branchDTOS);

        } catch (Exception e) {
            log.error("Error Branch List: ", e);
            model.addAttribute("branchList", List.of()); // or set a default list if needed
        }

        return "staff-register";
    }

    @GetMapping("/staff-list")
    public String getStaffList(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        log.info("List of Staff +++++============ {}", username);
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");


        // Extract the user's role
        String role = authentication.getAuthorities().stream()
                .map(authority -> authority.getAuthority())
                .findFirst() // Assuming a single role per user
                .orElse("");

        if (role.equals("ROLE_AGENT")) {
            Agent byUsername = agentRepositories.findByUsername(username);
            List<StaffDetails> staffDetailsList = staffDetailsService.getAllStaffByBranchLocationId(byUsername.getBranchLocationId());
            for(StaffDetails staffDetails: staffDetailsList) {
            	  String formattedDate = staffDetails.getCreatedOn().format(dateFormatter);
            	  staffDetails.setStaffCraetedDateFormated(formattedDate);
            }
            model.addAttribute("staffDetailsList", staffDetailsList);
            return "staff-listing";
        }

        if (role.equals("ROLE_SUB_ADMIN")) {
            Optional<User> byUsername = userRepository.findByUsername(username);
            List<StaffDetails> staffDetailsList = staffDetailsService.getAllStaffByCountry(byUsername.get().getCountry());
            for(StaffDetails staffDetails: staffDetailsList) {
          	  String formattedDate = staffDetails.getCreatedOn().format(dateFormatter);
          	  staffDetails.setStaffCraetedDateFormated(formattedDate);
          }
            model.addAttribute("staffDetailsList", staffDetailsList);
            return "staff-listing";
        }

        if (role.equals("ROLE_ADMIN")) {
            List<StaffDetails> staffDetailsList = staffDetailsService.getAllStaff();
            for(StaffDetails staffDetails: staffDetailsList) {
          	  String formattedDate = staffDetails.getCreatedOn().format(dateFormatter);
          	  staffDetails.setStaffCraetedDateFormated(formattedDate);
          }
            model.addAttribute("staffDetailsList", staffDetailsList);
            return "staff-listing";
        }

		/* List<StaffDetails> staffDetailsList = staffDetailsService.getAllStaff(); */
        model.addAttribute("staffDetailsList", List.of() );
        return "staff-listing";

    }

    @GetMapping("/staff-deatils")
    public String getStaffDetails(@RequestParam("id") Long id, Model model) {
        Optional<StaffDetails> staffDetails = staffDetailsService.getById(id);
        if (staffDetails.isPresent()) {
            List<Long> branchIds = staffDetails.get().getBranches();
            List<String> branchNames = new ArrayList<>();
            
            for (Long branchId : branchIds) {
                try {
                    Optional<BranchDetails> branchDetails = branchDetailsService.getById(branchId);
                    branchDetails.ifPresent(branch -> branchNames.add(branch.getBranchName()));
                } catch (Exception e) {
                    log.error("Error fetching branch details for branchId: " + branchId, e);
                }
            }
            String branchNamesString = String.join(", ", branchNames);
            
            model.addAttribute("branches", branchNamesString);
            model.addAttribute("staff", staffDetails.get());
        }
        return "staff-details";
    }

    @GetMapping("/staff-update-form")
	public String showUpdateForm(@RequestParam("id") Long id, Model model) {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Agent byUsername = agentRepositories.findByUsername(username);

        model.addAttribute("staff", new StaffDTO());
        try {
            List<BranchDTO> branchDTOS = branchDetailsService.getAllBranchDTOByBranchLocationId(byUsername.getBranchLocationId(), true);
            model.addAttribute("branchList", branchDTOS);

        } catch (Exception e) {
            log.error("Error Branch List: ", e);
            model.addAttribute("branchList", List.of()); 
        }
    	Optional<StaffDetails> staffDetails = staffDetailsService.getById(id);
    	if(staffDetails.isPresent()) {
    		model.addAttribute("staff",staffDetails.get());
    	}
    	return "staff-view-update";
    }
    
  
}
