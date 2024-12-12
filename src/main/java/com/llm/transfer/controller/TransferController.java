package com.llm.transfer.controller;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.llm.Service.CustomerService;
import com.llm.model.Customer;

@Controller
public class TransferController {
	private static final Logger logger = LoggerFactory.getLogger(TransferController.class);

	@Autowired
	private CustomerService customerService;

	@GetMapping("/transfer")
	public String showTransfer(Model model) {
//		model.addAttribute("customer", new Customer());
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
		model.addAttribute("customer", new Customer());
		return "transfer";
	}
}
