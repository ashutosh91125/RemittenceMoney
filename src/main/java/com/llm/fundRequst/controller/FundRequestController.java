package com.llm.fundRequst.controller;

import com.llm.fundRequst.model.DepositRequest;
import com.llm.fundRequst.service.DepositRequestService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class FundRequestController {

    private final DepositRequestService depositRequestService;

    @GetMapping("/fund-request")
    public String fundRequestForm(){
        return "fund-request";
    }

    @GetMapping("/fund-request-list")
    public String fundRequestList(Authentication authentication, Model model){
        String role = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .findFirst() // Assuming a single role per user
                .orElse("");
        List<DepositRequest> depositRequestList = new ArrayList<>();
        if (role.equals("ROLE_AGENT")) {
            depositRequestList = depositRequestService.getAllByCreatedBy(authentication.getName());
        } else if (role.equals("ROLE_STAFF_ALL")) {
            depositRequestList = depositRequestService.getAll();
        }

        model.addAttribute("fundRequestList", depositRequestList);
        return "fund-request-list";
    }

    @GetMapping("/fund-request-by-id")
    public String fundRequestById(@RequestParam("id") Long id, Model model){
        DepositRequest depositRequest = depositRequestService.getById(id);
        model.addAttribute("fundRequest", depositRequest);
        return "fund-request-details";
    }

    @GetMapping("/fund-request-receipt")
    public String fundRequestReceipt(@RequestParam("id") Long id, Model model){
        DepositRequest depositRequest = depositRequestService.getById(id);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yyyy hh:mm:ss a");
        String formattedDate = depositRequest.getCreateOn().format(formatter);
        model.addAttribute("fundRequest", depositRequest);
        model.addAttribute("dateFundCreated", formattedDate);
        return "fund-request-receipt";
    }
}
