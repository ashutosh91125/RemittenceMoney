package com.llm.fundRequst.controller;

import com.llm.fundRequst.model.DepositRequest;
import com.llm.fundRequst.service.DepositRequestService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.nio.file.attribute.UserPrincipal;
import java.util.List;

@Controller
public class FundRequestController {

    private final DepositRequestService depositRequestService;

    public FundRequestController(DepositRequestService depositRequestService) {
        this.depositRequestService = depositRequestService;
    }

    @GetMapping("/fund-request")
    public String fundRequestForm(){
        return "fund-request";
    }

    @GetMapping("/fund-request-list")
    public String fundRequestList(Authentication authentication, Model model){
        List<DepositRequest> depositRequestList = depositRequestService.getAllByCreatedBy(authentication.getName());
        model.addAttribute("fundRequestList", depositRequestList);
        return "fund-request-list";
    }

    @GetMapping("/fund-request-by-id")
    public String fundRequestById(@RequestParam("id") Long id, Model model){
        DepositRequest depositRequest = depositRequestService.getById(id);
        model.addAttribute("fundRequest", depositRequest);
        return "fund-request-details";
    }
}
