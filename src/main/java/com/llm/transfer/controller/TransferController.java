package com.llm.transfer.controller;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.llm.Service.CustomerService;
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import com.llm.model.Customer;

@Controller
public class TransferController {
	private static final Logger logger = LoggerFactory.getLogger(TransferController.class);

	@Autowired
	private CustomerService customerService;
	@Autowired
	private EnumEntityService enumEntityService;

	@GetMapping("/transfer")
	public String showTransfer(Model model) {
		try {
			Optional<EnumEntity> countryEntity = enumEntityService.getEnumEntityByKey("country");
			countryEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of()); 
		}
		try {
			Optional<EnumEntity> currencyEntity = enumEntityService.getEnumEntityByKey("currency");
			currencyEntity.ifPresent(entity -> model.addAttribute("currencyList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving currency list: ", e);
			model.addAttribute("currencyList", List.of()); 
		}
		return "transfer";
	}

	@GetMapping("/customer-list-transfer")
	public String getCustomerList(Model model) {
		try {
			List<Customer> customerList = customerService.getAllCustomer();
			Collections.reverse(customerList);
			model.addAttribute("customerList1", customerList);
			return "customerlistingontranfer";
		} catch (Exception e) {
			logger.error("Error occurred while fetching customer list: " + e);
			return "customerlistingontranfer";
		}
	}

	@GetMapping("/searchCustomersOnTransfer")
	public String searchCustomers(@RequestParam("criteria") String criteria, @RequestParam("query") String query,
			Model model) {
		try {
			List<Customer> customers = customerService.searchByCriteria(criteria, query);
			model.addAttribute("customerListOnTransfer", customers);
		} catch (Exception e) {
			logger.error(e.toString());
		}
		
		try {
			Optional<EnumEntity> countryEntity = enumEntityService.getEnumEntityByKey("country");
			countryEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of()); 
		}
		try {
			Optional<EnumEntity> currencyEntity = enumEntityService.getEnumEntityByKey("currency");
			currencyEntity.ifPresent(entity -> model.addAttribute("currencyList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving currency list: ", e);
			model.addAttribute("currencyList", List.of()); 
		}
		model.addAttribute("customer", new Customer());
		return "transfer";
	}
}
