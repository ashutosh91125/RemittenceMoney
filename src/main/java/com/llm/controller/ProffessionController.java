package com.llm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.llm.Service.ProffessionServiceImpl;
import com.llm.model.Proffession;

@RestController("/proffession")
public class ProffessionController {
	@Autowired
	private ProffessionServiceImpl proffessionService;

	@PostMapping
	public String registerProfession(@RequestBody Proffession proffession) {
		proffessionService.addProffession(proffession);
		return "data saved successfully";
	}

}
