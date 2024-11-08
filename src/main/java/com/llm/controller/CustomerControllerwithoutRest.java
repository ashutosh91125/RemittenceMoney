package com.llm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.llm.Service.CustomerService;
import com.llm.Service.GenderService;
import com.llm.Service.ICountryService;
import com.llm.Service.ICurrencyService;
import com.llm.Service.IdTypesService;
import com.llm.Service.IncomeTypeServiceImpl;
import com.llm.Service.NationalityService;
import com.llm.Service.ProfessionCategoryService;
import com.llm.Service.SalutationServiceImpl;
import com.llm.model.Customer;

@Controller
@SessionAttributes({ "custDTO" })
public class CustomerControllerwithoutRest {
	@Autowired
	private SalutationServiceImpl salutationService;
	@Autowired
	private ICountryService countryService;
	@Autowired
	private ICurrencyService currencyService;
	@Autowired
	private IncomeTypeServiceImpl incomeTypeService;
	@Autowired
	private ProfessionCategoryService professionCategoryService;
	@Autowired
	private IdTypesService idTypesService;
	@Autowired
	private NationalityService nationalityService;
	@Autowired
	private GenderService genderService;

	@GetMapping("/customer")
	public String onboardCustomer1(Model model) {
		model.addAttribute("custDTO", new Customer()); // Ensure custDTO is added here
		model.addAttribute("salutationList", salutationService.findAllRecords());
		model.addAttribute("countryList", countryService.fetchCountries());
		model.addAttribute("currencyList", currencyService.fetchCurrencies());
		model.addAttribute("incomeTypeList", incomeTypeService.getAllIncomeType());
		model.addAttribute("professionCategoryList", professionCategoryService.getAllProfessionCategory());
		model.addAttribute("idTypesList", idTypesService.getAllIdTypes());
		model.addAttribute("nationalityList", nationalityService.getAllNationality());
		model.addAttribute("genderList", genderService.getGender());
		return "customeronboard";
	}

}
