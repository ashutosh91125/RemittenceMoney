package com.llm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.llm.Service.IAppTimeZoneService;
import com.llm.model.AppTimeZone;

@Controller
public class AppTimeZoneServiceController {
	@Autowired
	private IAppTimeZoneService timezoneService;

	@GetMapping("/timezone")
	public List<AppTimeZone> getAllTimeZones(Map<String, Object> map) {
		List<AppTimeZone> timezonelist = timezoneService.getAllTimeZones();
		map.put("timezonelist", timezonelist);
		return timezonelist;
	}

}
