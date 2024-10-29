package com.llm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.llm.Service.SalutationServiceImpl;
import com.llm.model.Salutation;

@Controller
public class SalutationController {
	@Autowired
	private SalutationServiceImpl salutationServiceImpl;

	@GetMapping("/salutation")
	public List<Salutation> getAllSalutation() {
		return salutationServiceImpl.findAllRecords();
	}

}
