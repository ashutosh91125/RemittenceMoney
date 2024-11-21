package com.llm.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.llm.Service.ICountryService;
import com.llm.model.Country;

@Controller
public class CountriesController {
	@Autowired
	private ICountryService countryService;

	@GetMapping("/show")
	public String getCountries(
			@PageableDefault(page = 0, size = 5, sort = "countryId", direction = Sort.Direction.ASC) Pageable pageable,
			Map<String, Object> map) {
		Page<Country> page = countryService.getCountry(pageable);
		map.put("countrieslist", page);
		map.put("currentPage", page.getNumber());
		map.put("totalPages", page.getTotalPages());
		map.put("size", page.getSize());
		return "countrieslist";
	}
	
	

	@PostMapping("/countries")
	public String registeredCountries(@RequestParam Country country) {
		countryService.addCountries(country);
		return "data saved successfully";
	}

}
