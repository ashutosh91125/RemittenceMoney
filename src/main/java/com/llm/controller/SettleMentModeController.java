package com.llm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.llm.Service.ISetteleMentModeService;
import com.llm.model.SettlementMode;

@Controller
public class SettleMentModeController {
	@Autowired
	private ISetteleMentModeService setteleMentModeService;

	@GetMapping("/setteleMentModeList")
	public List<SettlementMode> getSetteleMentMode(){
		List<SettlementMode> setteleMentModeList=setteleMentModeService.fetchSettlementMode();
				return setteleMentModeList;
	}

}
