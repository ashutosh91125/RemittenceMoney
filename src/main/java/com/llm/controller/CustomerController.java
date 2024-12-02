package com.llm.controller;

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
import com.llm.Service.OnboardingService;
import com.llm.model.Customer;

@RestController
@RequestMapping("/caas/api/v2/customer")
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	private static final String BASE_URL = "https://drap-sandbox.digitnine.com";
	@Autowired
	private CustomerService customerService;

//	@Autowired
//	private CustomerValidationService customerValidationService;

	@Autowired
	private OnboardingService onboardingService;
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

// Endpoint 1: Get Customer Details by ID
//	@GetMapping("/{ecrn}")
//	public ResponseEntity<Customer> getCustomerDetails(@PathVariable String ecrn) {
//		Optional<Customer> customer = customerService.getByEcrn(ecrn);
//
//		if (!customer.isPresent()) {
//			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); // Return 404 if no customer is found
//		}
//
//		Customer response = new Customer();
//		// response.setStatus("success");
//		// response.setStatusCode(200);
//		// response.setData(customer.get()); // Mapping to the response DTO
//
//		return ResponseEntity.ok(customer.get());
//	}
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
				return ResponseEntity.status(HttpStatus.NO_CONTENT).body(customers); // Return empty list with no
																						// content status
			}
			return ResponseEntity.ok(customers); // Return 200 OK with the customer list
		} catch (Exception e) {
			// In case of error, return an error response
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.emptyList()); // Return
																											// empty
																											// list with
																											// internal
																											// server
																											// error
		}
	}

	// Endpoint 2: Validate Customer
//	@PostMapping("/validate")
//	public ResponseEntity<CustomerValidationResponse> validateCustomer(@RequestBody CustomerValidationRequest request) {
//		CustomerValidationResponse.CustomerData customerData = customerValidationService
//				.validateCustomer(request.getIdNumber(), Integer.valueOf(request.getIdType()));
//
//		if (customerData == null) {
//			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); // Return 404 if customer not found
//		}
//
//		CustomerValidationResponse response = new CustomerValidationResponse();
//		response.setStatus("success");
//		response.setStatusCode(200);
//		response.setData(customerData);
//
//		return ResponseEntity.ok(response);
//	}

	// Endpoint 3: Onboard Customer
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

	// Endpoint 3: Onboard Customer
//	@PostMapping(value = "/onBoarding/customer", consumes = "application/json")
//	public ResponseEntity<OnboardingSuccessResponse> onboardCustomer(@RequestBody Customer customerRequest) {
//		// Call the onboarding service to save customer details
//		Customer customer = onboardingService.onboardCustomer(customerRequest);
//
//		// Create the success response
//		OnboardingSuccessResponse response = new OnboardingSuccessResponse();
//		response.setStatus("success");
//		response.setStatusCode(200);
//
//		// Populate the response with required data
//		Data responseData = new Data();
//		responseData.setAml_scan_status(AMLScanStatu.ACCEPTED); // Assuming this is determined elsewhere
//		// responseData.setEcrn(customer.getEcrn()); // Assuming the customer has an
//		// ECRN field
//		responseData.setCustomer_status(CustomerStatus.ACTIVE.toString()); // Assuming the customer is active
//		responseData.setPep(customer.getPoliticalExposedPerson()); // Assuming there's a boolean field for PEP
//		responseData.setAml_category("2"); // Assuming a static value for now
//
//		response.setData(responseData);
//		response.setRequestId("4138e3038999d41b7534ce12a18a6031"); // Replace with dynamically generated request ID
//
//		// Return the response entity with a 200 status
//		return ResponseEntity.ok(response);
//	}


	@GetMapping("/verify-mobile")
	public ResponseEntity<Map<String, String>> verifyMobile(@RequestParam String primaryMobileNumber) {
	    logger.info("primaryMobileNumber=========" + primaryMobileNumber);
	    Map<String, String> response = new HashMap<>();
	    boolean isMobileExist = customerService.verifyPrimaryMobileNumber(primaryMobileNumber);
	    logger.info("isMobileExist======"+isMobileExist);
	    
	    if (isMobileExist) {
	        response.put("message", "Customer already exists with this mobile number.");
	        return ResponseEntity.status(HttpStatus.CONFLICT).body(response); 
	    } else {
	        response.put("message", "Mobile number is available.");
	        return ResponseEntity.ok(response);
	    }
	}



}
