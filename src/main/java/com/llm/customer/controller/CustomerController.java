package com.llm.customer.controller;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.llm.Service.CustomerEcrnService;
import com.llm.Service.CustomerService;
//import com.llm.Service.CustomerValidationService;
import com.llm.model.Customer;

@RestController
@RequestMapping("/caas/api/v2/customer")
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	private static final String BASE_URL = "https://drap-sandbox.digitnine.com";
	@Autowired
	private CustomerService customerService;

	@Autowired
	private CustomerEcrnService customerEcrnService;

	@GetMapping
	public ResponseEntity<List<Customer>> customer() {

		return ResponseEntity.ok(customerService.getAllCustomer());
	}

	@InitBinder
	public void myDateBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(sdf, true));
	}

	@GetMapping("/{ecrn}")
	public ResponseEntity<Customer> getCustomerByEcrn(@PathVariable("ecrn") String ecrn) {
		Optional<Customer> customerData = customerService.getByEcrn(ecrn);
		return customerData.map(customer -> new ResponseEntity<>(customer, HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}

	@GetMapping("/search")
	public ResponseEntity<List<Customer>> searchCustomers(@RequestParam("criteria") String criteria,
			@RequestParam("query") String query) {

		try {
			List<Customer> customers = customerService.searchByCriteria(criteria, query);
			if (customers.isEmpty()) {
				return ResponseEntity.status(HttpStatus.NO_CONTENT).body(customers);
			}
			return ResponseEntity.ok(customers);
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.emptyList());
		}
	}

	@PostMapping(value = "/onBoarding/customer", consumes = "application/json")
	public ResponseEntity<String> createCustomer(@RequestBody Customer customer) {
		logger.info("=========customer=======" + customer);
		String status = new String();
		try {
			status = customerService.createCustomer(customer);
			return new ResponseEntity<>(status, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("Failed to onboard customer" + status, HttpStatus.BAD_REQUEST);
		}
	}

	@GetMapping("/verify-mobile")
	public ResponseEntity<Map<String, String>> verifyMobile(@RequestParam String primaryMobileNumber) {
		logger.info(primaryMobileNumber.toString());
		Map<String, String> response = new HashMap<>();
		boolean isMobileExist = customerService.verifyPrimaryMobileNumber(primaryMobileNumber);

		if (isMobileExist) {
			response.put("message", "Customer already exists with this mobile number.");
		}

		return ResponseEntity.ok(response);
	}
}
