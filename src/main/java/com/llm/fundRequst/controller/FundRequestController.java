package com.llm.fundRequst.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FundRequestController {

    @GetMapping("/fund-request")
    public String fundRequestForm(){
        return "fund-request";
    }
}
