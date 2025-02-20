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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.llm.customer.model.Customer;
import com.llm.customer.service.CustomerService;
import com.llm.iddetail.model.IdDetail;
import com.llm.iddetail.service.IdDetailsService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/caas/api/v2/customer")
public class CustomerController {

//	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private IdDetailsService idDetailsService;

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

	@GetMapping("/verify-mobile")
	public ResponseEntity<Map<String, String>> verifyMobile(@RequestParam String primaryMobileNumber) {
		log.info(primaryMobileNumber.toString());
		Map<String, String> response = new HashMap<>();
		boolean isMobileExist = customerService.verifyPrimaryMobileNumber(primaryMobileNumber);

		if (isMobileExist) {
			response.put("message", "Customer exists with this mobile number. Please Change!");
		}

		return ResponseEntity.ok(response);
	}

	@PutMapping("onBoarding/updateCustomer/{ecrn}")
	public ResponseEntity<String> updateCustomer(@PathVariable("ecrn") String ecrn,
												 @ModelAttribute Customer updateCustomer, HttpServletRequest servletRequest) {
		if (updateCustomer.getIdDetails() != null && !updateCustomer.getIdDetails().isEmpty()) {
			for (IdDetail idDetail : updateCustomer.getIdDetails()) {
				if (idDetail.getFrontPictureFile() != null && !idDetail.getFrontPictureFile().isEmpty()) {
					String contentType = idDetail.getFrontPictureFile().getContentType();

					if (contentType == null || !contentType.startsWith("image/")) {
						throw new IllegalArgumentException("Only image files are allowed (JPEG, PNG, etc.).");
					}
					try {
						idDetail.setFrontBase64Data(idDetail.getFrontPictureFile().getBytes());
						idDetail.setFrontContentType(contentType);
					} catch (Exception e) {

						return ResponseEntity.badRequest().body("Error: " + e.getMessage());
					}
				}
			}
		}
		if (updateCustomer.getIdDetails() != null && !updateCustomer.getIdDetails().isEmpty()) {
			for (IdDetail idDetail : updateCustomer.getIdDetails()) {
				if (idDetail.getBackPictureFile() != null && !idDetail.getBackPictureFile().isEmpty()) {
					String contentType = idDetail.getBackPictureFile().getContentType();

					if (contentType == null || !contentType.startsWith("image/")) {
						throw new IllegalArgumentException("Only image files are allowed (JPEG, PNG, etc.).");
					}
					try {
						idDetail.setBackBase64Data(idDetail.getBackPictureFile().getBytes());
						idDetail.setBackContentType(contentType);
					} catch (Exception e) {

						return ResponseEntity.badRequest().body("Error: " + e.getMessage());
					}
				}
			}
		}
		try {
			if (updateCustomer.getProfPictureFile() != null && !updateCustomer.getProfPictureFile().isEmpty()) {
				String contentType = updateCustomer.getProfPictureFile().getContentType();

				
				if (contentType == null || !contentType.startsWith("image/")) {
					throw new IllegalArgumentException("Only image files are allowed (JPEG, PNG, etc.).");
				}

			
				updateCustomer.setProfBase64Data(updateCustomer.getProfPictureFile().getBytes());
				updateCustomer.setProfContentType(contentType);
			}
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("Error: " + e.getMessage());
		}
		try {
			String status = customerService.updateCustomer(ecrn, updateCustomer, servletRequest);
			if (status.startsWith("Customer updated successfully")) {
				return ResponseEntity.ok(status);
			} else {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(status);
			}
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("An error occurred while updating the customer: " + e.getMessage());
		}
	}

//	@GetMapping("/image/{id}")
//	@ResponseBody
//	public ResponseEntity<byte[]> getImage(@PathVariable Long id) {
//	    Customer customer = customerService.getById(id).orElseThrow();
//	    byte[] imageData = customer.getProfBase64Data(); // Ensure this is the raw byte array, not base64
//	    HttpHeaders headers = new HttpHeaders();
//	    headers.setContentType(MediaType.IMAGE_JPEG); // Change to MediaType.IMAGE_PNG if it's a PNG image
//	    return new ResponseEntity<>(imageData, headers, HttpStatus.OK);
//	}
	@GetMapping("/image/{id}")
	@ResponseBody
	public byte[] getImage(@PathVariable Long id) {
		Customer customer = customerService.getById(id).orElseThrow();
		return customer.getProfBase64Data();
	}


	@GetMapping("/id-detail/{customerId}")
	public ResponseEntity<List<IdDetail>> getIdDetails2(@PathVariable Long customerId) {
		List<IdDetail> idDetailsList = customerService.getIdDetailsByCustomerId(customerId);
		Collections.reverse(idDetailsList);

		return ResponseEntity.ok(idDetailsList);
	}
	@GetMapping("/emailId")
	public ResponseEntity<Map<String, String>> verifyEmail(@RequestParam("emailId") String emailId) {
		Map<String, String> response = new HashMap<>();
		boolean emailIdExist = customerService.verifyEmailId(emailId);

		if (emailIdExist) {
			response.put("message", "emailId already exists Please Change!.");
		}

		return ResponseEntity.ok(response);
	}
	
	@PostMapping("/id-details")
	public ResponseEntity<String> createIdDetails(@RequestParam("ecrn") String ecrn, @ModelAttribute IdDetail idDetail) {
		try {
			if (idDetail.getFrontPictureFile() != null && !idDetail.getFrontPictureFile().isEmpty()) {
				String contentType = idDetail.getFrontPictureFile().getContentType();

			
				if (contentType == null || !contentType.startsWith("image/")) {
					throw new IllegalArgumentException("Only image files are allowed (JPEG, PNG, etc.).");
				}
				idDetail.setFrontBase64Data(idDetail.getFrontPictureFile().getBytes());
				idDetail.setFrontContentType(contentType);
			}
		} catch (Exception e) {
			
			return ResponseEntity.badRequest().body("Error: " + e.getMessage());
		}
	 try {
		if (idDetail.getBackPictureFile() != null && !idDetail.getBackPictureFile().isEmpty()) {
			String contentType = idDetail.getBackPictureFile().getContentType();

		
			if (contentType == null || !contentType.startsWith("image/")) {
				throw new IllegalArgumentException("Only image files are allowed (JPEG, PNG, etc.).");
			}
			idDetail.setBackBase64Data(idDetail.getBackPictureFile().getBytes());
			idDetail.setBackContentType(contentType);
		}
	} catch (Exception e) {
		return ResponseEntity.badRequest().body("Error: " + e.getMessage());
	}
	    Optional<Customer> customerOpt = customerService.getByEcrn(ecrn);
	    
	    if (customerOpt.isPresent()) {
	        Customer customer = customerOpt.get();
	        idDetail.setCustomerId(customer.getId());
	        idDetailsService.saveIdDetails(idDetail); 
	        
	        return ResponseEntity.status(HttpStatus.CREATED).body("ID Details saved successfully.");
	    } else {
	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Customer not found with ECRN: " + ecrn);
	    }
	}

}
