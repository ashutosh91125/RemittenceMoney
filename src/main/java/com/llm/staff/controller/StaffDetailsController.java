package com.llm.staff.controller;

import com.llm.agent.model.dto.AgentDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StaffDetailsController {

    @GetMapping("/staff")
    public String showCompanyDetailsForm(Model model) {
        model.addAttribute("staff", new AgentDTO());
        return "staff-register";
    }
}
