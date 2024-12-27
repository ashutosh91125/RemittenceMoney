package com.llm.staff.controller;

import com.llm.agent.model.dto.AgentDTO;
import com.llm.agent.projection.AgentProjection;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.projection.BranchProjection;
import com.llm.branch.service.BranchDetailsService;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.model.dto.StaffDTO;
import com.llm.staff.service.StaffDetailsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Slf4j
@RequiredArgsConstructor
public class StaffDetailsController {

    @Autowired
    private final StaffDetailsService staffDetailsService;

    @Autowired
    private final BranchDetailsService branchDetailsService;

    @GetMapping("/staff")
    public String showCompanyDetailsForm(Model model) {
        model.addAttribute("staff", new StaffDTO());

        try {
            List<BranchProjection> branchProjections = branchDetailsService.getAllBranchesByProjection();
            model.addAttribute("branchList", branchProjections);

        } catch (Exception e) {
            log.error("Error Branch List: ", e);
            model.addAttribute("branchList", List.of()); // or set a default list if needed
        }

        return "staff-register";
    }

    @GetMapping("/staff-list")
    public String getStaffList(Model model) {
        List<StaffDetails> staffDetailsList = staffDetailsService.getAllStaff();
        model.addAttribute("staffDetailsList", staffDetailsList);
        return "staff-listing";

    }
}
