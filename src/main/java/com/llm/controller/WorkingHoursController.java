package com.llm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.llm.Service.IWorkingHoursService;
import com.llm.model.WorkingHours;

@Controller
public class WorkingHoursController {
	@Autowired
	private IWorkingHoursService workingHoursService;
	
	@GetMapping("/workinghours")
	public List<WorkingHours> getAllTimeZones(Map<String, Object> map) {
		List<WorkingHours> workinghourslist = workingHoursService.getAllWorkingHours();
		map.put("workinghourslist", workinghourslist);
		return workinghourslist;
	}
}
