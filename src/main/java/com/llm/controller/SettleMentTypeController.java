package com.llm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.llm.Service.ISettleMentTypeService;
import com.llm.model.SettelementType;

@Controller
public class SettleMentTypeController {
	@Autowired
	private ISettleMentTypeService settleMentTypeService;

	@GetMapping("/setteleMentTypeList")
	public List<SettelementType> getSetteleMentMode() {
		List<SettelementType> setteleMentTypeList = settleMentTypeService.fetchAllSettleMentsType();
		return setteleMentTypeList;
	}

}
