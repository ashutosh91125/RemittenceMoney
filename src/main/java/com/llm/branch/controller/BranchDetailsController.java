package com.llm.branch.controller;

import com.llm.branch.model.BranchDetails;
import com.llm.branch.service.BranchDetailsService;
import com.llm.common.model.EnumEntity;
import com.llm.common.model.EnumValue;
import com.llm.common.service.EnumEntityService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
@Slf4j
public class BranchDetailsController {

    @Autowired
    private BranchDetailsService branchDetailsService;

    @Autowired
    private EnumEntityService enumEntityService;

    @GetMapping("/branch")
    public String branchRegister(Model model) {
        model.addAttribute("branch", new BranchDetails());

        try {
            List<EnumValue> nativeRegionEntity = enumEntityService.getDataByDependent("MY");
            model.addAttribute("stateList", nativeRegionEntity);

        } catch (Exception e) {
            log.error("Error Native Region List: ", e);
            model.addAttribute("native Region List", List.of()); // or set a default list if needed
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
}
