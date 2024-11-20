package com.llm.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.llm.Service.CustomerService;
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import com.llm.model.Customer;
import com.llm.model.Gender;

@Controller
//@SessionAttributes({ "custDTO" })
public class CustomerControllerwithoutRest {
	private static final Logger logger = LoggerFactory.getLogger(CustomerControllerwithoutRest.class);

	@Autowired
	private CustomerService customerService;

	@Autowired
	private EnumEntityService enumEntityService;

	@GetMapping("/customer")
	public String onboardCustomer1(Model model) {
		Customer customer = new Customer();

		logger.info("Model attributes before rendering form: " + model.asMap());
//		IdDetail idDetail = new IdDetail();
//		CustomerClassification customerClassification = new CustomerClassification();
//
//		customerClassification.setProfilePhoto(new ProfilePhoto());
//		customerClassification.setSocialLinks(Arrays.asList(new SocialLink()));
//
//		idDetail.setIdFront(new IdFront());
//		idDetail.setIdBack(new IdBack());
//
//		customer.setAddressList(Arrays.asList(new Address(), new Address()));
//		customer.setAdditionalDocs(Arrays.asList(new Document()) );
//		customer.setIdDetails(Arrays.asList(idDetail));
//		customer.setCustomerClassification(customerClassification);

		model.addAttribute("customer", customer); // Ensure custDTO is added here

		try {
			Optional<EnumEntity> salutationEntity = enumEntityService.getEnumEntityByKey("salutation");
			salutationEntity.ifPresent(entity -> model.addAttribute("salutationList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving salutation list: ", e);
			model.addAttribute("salutationList", List.of()); // or set a default list if needed
		}

		try {
			Optional<EnumEntity> countryEntity = enumEntityService.getEnumEntityByKey("country");
			countryEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of()); // or set a default list if needed
		}

		// Repeat the same pattern for other attributes
		try {
			Optional<EnumEntity> currencyEntity = enumEntityService.getEnumEntityByKey("currency");
			currencyEntity.ifPresent(entity -> model.addAttribute("currencyList", entity.getValues()));
		} catch (Exception e) {
			logger.error("Error retrieving currency list: ", e);
			model.addAttribute("currencyList", List.of());
		}

		try {
			Optional<EnumEntity> incomeTypeEntity = enumEntityService.getEnumEntityByKey("incomeType");
			incomeTypeEntity.ifPresent(entity -> model.addAttribute("incomeTypeList", entity.getValues()));
		} catch (Exception e) {
			logger.error("Error retrieving income type list: ", e);
			model.addAttribute("incomeTypeList", List.of());
		}

		try {
			Optional<EnumEntity> professionCategoryEntity = enumEntityService.getEnumEntityByKey("professionCategory");
			professionCategoryEntity
					.ifPresent(entity -> model.addAttribute("professionCategoryList", entity.getValues()));
		} catch (Exception e) {
			logger.error("Error retrieving profession category list: ", e);
			model.addAttribute("professionCategoryList", List.of());
		}

		try {
			Optional<EnumEntity> idTypesEntity = enumEntityService.getEnumEntityByKey("idTypes");
			idTypesEntity.ifPresent(entity -> model.addAttribute("idTypesList", entity.getValues()));
		} catch (Exception e) {
			logger.error("Error retrieving ID types list: ", e);
			model.addAttribute("idTypesList", List.of());
		}

		try {
			Optional<EnumEntity> nationalityEntity = enumEntityService.getEnumEntityByKey("nationality");
			nationalityEntity.ifPresent(entity -> model.addAttribute("nationalityList", entity.getValues()));
		} catch (Exception e) {
			logger.error("Error retrieving nationality list: ", e);
			model.addAttribute("nationalityList", List.of());
		}
		try {
			Optional<EnumEntity> salutationEntity = enumEntityService.getEnumEntityByKey("residentType");
			salutationEntity.ifPresent(entity -> model.addAttribute("residentTypeList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving residentType list: ", e);
			model.addAttribute("residentTypeList", List.of()); // or set a default list if needed
		}
		try {
			Optional<EnumEntity> annualIncomeRangeEntity = enumEntityService.getEnumEntityByKey("annualIncomeRange");
			annualIncomeRangeEntity
					.ifPresent(entity -> model.addAttribute("annualIncomeRangeList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving annual Income Range list: ", e);
			model.addAttribute("annualIncomeRangeList", List.of()); // or set a default list if needed
		}
		try {
			Optional<EnumEntity> transactionCountMonthEntity = enumEntityService
					.getEnumEntityByKey("transactionCountMonth");
			transactionCountMonthEntity
					.ifPresent(entity -> model.addAttribute("transactionCountMonthList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving annual Income Range list: ", e);
			model.addAttribute("transactionCountMonthList", List.of()); // or set a default list if needed
		}
		try {
			Optional<EnumEntity> transactionVolumeMonthEntity = enumEntityService
					.getEnumEntityByKey("transactionVolumeMonth");
			transactionVolumeMonthEntity
					.ifPresent(entity -> model.addAttribute("transactionVolumeMonthList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving transaction Volume Month List: ", e);
			model.addAttribute("transactionVolumeMonthList", List.of()); // or set a default list if needed
		}
		try {
			Optional<EnumEntity> riskRatingIdEntity = enumEntityService.getEnumEntityByKey("riskRatingId");
			riskRatingIdEntity.ifPresent(entity -> model.addAttribute("riskRatingIdList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving riskRatingId list: ", e);
			model.addAttribute("riskRatingIdList", List.of()); // or set a default list if needed
		}
		try {
			Optional<EnumEntity> incomeTypeEntity = enumEntityService.getEnumEntityByKey("incomeType");
			incomeTypeEntity.ifPresent(entity -> model.addAttribute("incomeTypeList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error income Type list: ", e);
			model.addAttribute("incomeTypeList", List.of()); // or set a default list if needed
		}
		try {
			Optional<EnumEntity> professionCategoryEntity = enumEntityService.getEnumEntityByKey("professionCategory");
			professionCategoryEntity
					.ifPresent(entity -> model.addAttribute("professionCategoryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error profession Category list: ", e);
			model.addAttribute("professionCategoryList", List.of()); // or set a default list if needed
		}

		try {
			Optional<EnumEntity> occupationIdEntity = enumEntityService.getEnumEntityByKey("occupationId");
			occupationIdEntity.ifPresent(entity -> model.addAttribute("occupationIdList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error occupation Id list: ", e);
			model.addAttribute("occupationIdList", List.of()); // or set a default list if needed
		}

//		model.addAttribute("salutationList", salutationService.findAllRecords());
//		model.addAttribute("countryList", countryService.fetchCountries());
//		model.addAttribute("currencyList", currencyService.fetchCurrencies());
//		model.addAttribute("incomeTypeList", incomeTypeService.getAllIncomeType());
//		model.addAttribute("professionCategoryList", professionCategoryService.getAllProfessionCategory());
//		model.addAttribute("idTypesList", idTypesService.getAllIdTypes());
//		model.addAttribute("nationalityList", nationalityService.getAllNationality());
		model.addAttribute("genderList", Gender.values());
		return "customeronboard";
	}

	@GetMapping("/customer-list")
	public String getCustomerList(Model model) {
		try {
			List<Customer> customerList = customerService.getAllCustomer();
			Collections.reverse(customerList);
			model.addAttribute("customerList", customerList);
			return "customerlisting";
		} catch (Exception e) {
			logger.error("Error occurred while fetching customer list: " + e);
			return "customerlisting";
		}

	}

	// Handle user creation form submission
	@PostMapping("/createUser")
	@ResponseBody
	public ResponseEntity<?> createUser(@ModelAttribute Customer customer) throws JsonProcessingException {

		String status = customerService.createCustomer(customer);  // Get the status response from the service

		// Remove any leading or trailing whitespaces from the status string
		status = status.trim();
		logger.info("Trimmed Status: " + status);  // Print the status for debugging

		// Check if the status string contains "status_code"
		if (status.contains("status_code")) {

			// Use substring to extract the "status_code" value
			String statusCodeString = extractFieldValue(status, "\"status_code\":");
			int statusCode = Integer.parseInt(statusCodeString.trim());

			// Print out the status code for debugging
			logger.info("Extracted Status Code: " + statusCode);

			// If status code is 200, return success
			if (statusCode == 200) {
				return ResponseEntity.ok("Customer created successfully!");
			}

			// If status code is not 200, extract the message
			String message = extractFieldValue(status, "\"message\":");
			logger.info("Extracted Message: " + message);

			// Return bad request with the error message
			return ResponseEntity.badRequest().body("Error: " + message);
		}

		// If no status_code is found, return a generic error
		return ResponseEntity.badRequest().body("Error: Invalid response format");
	}

	// Helper method to extract the value of a field
	private String extractFieldValue(String json, String field) {
		int startIndex = json.indexOf(field) + field.length();
		int endIndex = json.indexOf(",", startIndex);

		if (endIndex == -1) {
			endIndex = json.indexOf("}", startIndex);  // Handle the case where it's the last field
		}

		if (startIndex != -1 && endIndex != -1) {
			String value = json.substring(startIndex, endIndex).trim();
			// Remove any surrounding quotes if present
			if (value.startsWith("\"") && value.endsWith("\"")) {
				value = value.substring(1, value.length() - 1);
			}
			return value;
		}
		return "";  // Return empty string if field is not found
	}



	@GetMapping("/customerdetails")
	public String getDetailsEcrn(@RequestParam("ecrn") String ecrn, Model model) {
		try {
			Optional<Customer> customer = customerService.getByEcrn(ecrn);
			if (customer.isPresent()) {
				model.addAttribute("customer", customer.get());
				model.addAttribute("residentType", getResidentTypeDescription(customer.get().getResidentTypeId()));
				model.addAttribute("maritalStatus", getMaritalStatusDescription(customer.get().getMaritalStatus()));
				model.addAttribute("nationality", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",
						customer.get().getNationality()));
				model.addAttribute("secondNationality", enumEntityService
						.getEnumValueDescriptionByKeyAndValueId("country", customer.get().getSecondNationality()));
				model.addAttribute("countryOfBirth", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",
						customer.get().getCountryOfBirth()));
				model.addAttribute("countryOfResidence", enumEntityService
						.getEnumValueDescriptionByKeyAndValueId("country", customer.get().getCountryOfResidence()));
				model.addAttribute("occupationId", enumEntityService.getEnumValueDescriptionByKeyAndValueId(
						"occupationId", String.valueOf(customer.get().getOccupationId())));
				model.addAttribute("issuedCountry", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",
						customer.get().getIssuedCountry()));
				model.addAttribute("issuedAt", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",
						customer.get().getIssuedBy()));
				model.addAttribute("annualIncomeRangeId", enumEntityService.getEnumValueDescriptionByKeyAndValueId(
						"annualIncomeRange", String.valueOf(customer.get().getAnnualIncomeRangeId())));
				model.addAttribute("riskRatingId", enumEntityService.getEnumValueDescriptionByKeyAndValueId(
						"riskRatingId", String.valueOf(customer.get().getRiskRatingId())));
				model.addAttribute("incomeType", enumEntityService.getEnumValueDescriptionByKeyAndValueId("incomeType",
						String.valueOf(customer.get().getIncomeType())));
				model.addAttribute("professionCategory", enumEntityService.getEnumValueDescriptionByKeyAndValueId(
						"professionCategory", customer.get().getProfessionCategory()));
				model.addAttribute("txnVolMonth", enumEntityService.getEnumValueDescriptionByKeyAndValueId(
						"transactionVolumeMonth", String.valueOf(customer.get().getTxnVolMonth())));
				model.addAttribute("txnCountMonth", enumEntityService.getEnumValueDescriptionByKeyAndValueId(
						"transactionCountMonth", String.valueOf(customer.get().getTxnCountMonth())));

			} else {
				model.addAttribute("error", "Customer details not found.");
			}
		} catch (Exception e) {
			logger.error("Error fetching customer details for ECRN: " + ecrn, e);
			model.addAttribute("error", "An error occurred while retrieving customer details.");
		}
		return "customeronboardeditview";
	}

	private String getResidentTypeDescription(Long residentTypeId) {
		return residentTypeId != null && residentTypeId == 101 ? "Resident"
				: residentTypeId == 100 ? "Non-Resident" : "Unknown";
	}

	private String getMaritalStatusDescription(Integer maritalStatusId) {
		return maritalStatusId != null && maritalStatusId == 1 ? "Married"
				: maritalStatusId == 2 ? "Unmarried" : "Unknown";
	}

}
