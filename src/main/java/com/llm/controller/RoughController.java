package com.llm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RoughController {
	@GetMapping("/subagentCompanyDtails")
	public String getsubAgentCompanyDetails() {
		return "companydetailssubagent";
	}
	@GetMapping("/contactDetails")
	public String getcontactDetails() {
		return "contactdetailssubagent";
	}
	@GetMapping("/regurilitysubagent")
	public String regurilitySubagentDetails() {
		return "regurilitysubagent";
	}
	@GetMapping("/auditsubagent")
	public String auditSubaAentDetails() {
		return "auditsubagent";
	} 
	@GetMapping("/dashboard")
	public String dashboard() {
		return "dashboard";
	}
	@GetMapping("/customercreate")
	public String createCustomer() {
		return "customercreate";
	}
	@GetMapping("/transfer")
	public String transfer() {
		return "transfer";
	}
	@GetMapping("/customer-onboard")
	public String customerOnBoard() {
		return "customeronboard";
	}

}
