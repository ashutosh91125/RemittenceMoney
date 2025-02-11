package com.llm.customer.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.llm.common.enums.Gender;
import com.llm.common.model.EnumEntity;
import com.llm.common.model.EnumValue;
import com.llm.common.service.EnumEntityService;
import com.llm.customer.model.Customer;
import com.llm.customer.service.CustomerService;
import com.llm.iddetail.model.IdDetail;

import jakarta.servlet.http.HttpServletRequest;

@Controller
//@SessionAttributes({ "custDTO" })
public class CustomerControllerwithoutRest {
	private static final Logger logger = LoggerFactory.getLogger(CustomerControllerwithoutRest.class);

	@Autowired
	private CustomerService customerService;

	@Autowired
	private EnumEntityService enumEntityService;

	@GetMapping("/customer")
	public String onboardCustomer1(@RequestParam(value = "ecrn", required = false) String ecrn, Model model) {
//		Customer customer = new Customer();
		Customer customer;
		if (ecrn != null && !ecrn.isEmpty()) {
			customer = customerService.getByEcrn(ecrn).orElseGet(() -> new Customer());
			logger.info("BirthPlace======="+customer.getPlaceOfBirth());
			if (customer == null) {
				customer = new Customer();
			}
		} else {
			customer = new Customer();
		}

		if (!model.containsAttribute("customerList")) {
			model.addAttribute("customerList", new ArrayList<Customer>());
		}
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
		try {
			Optional<EnumEntity> nativeRegionEntity = enumEntityService.getEnumEntityByKey("state");
			nativeRegionEntity.ifPresent(entity -> model.addAttribute("nativeRegionList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error Native Region List: ", e);
			model.addAttribute("native Region List", List.of()); // or set a default list if needed
		}
		try {
			Optional<EnumEntity> placeofBirthEntity = enumEntityService.getEnumEntityByKey("state");
			placeofBirthEntity.ifPresent(entity -> model.addAttribute("placeOfBirthList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error  Place Of Birth List: ", e);
			model.addAttribute("Place Of Birth List", List.of()); // or set a default list if needed
		}
		try {
			Optional<EnumEntity> placeofBirthEntity = enumEntityService.getEnumEntityByKey("state");
			placeofBirthEntity.ifPresent(entity -> model.addAttribute("stateList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error State List: ", e);
			model.addAttribute("State List", List.of()); // or set a default list if needed
		}
//		model.addAttribute("nativeRegion", enumEntityService.getEnumValueDescriptionByKeyAndFilters("state",
//				customer.get().getNationality(), String.valueOf(customer.get().getNativeRegion())));
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
	public ResponseEntity<?> createUser(@ModelAttribute Customer customer, HttpServletRequest httpServletRequest) throws JsonProcessingException {
		Map<String, String> errorResponse = new HashMap<>();

		if (customer.getIdDetails() != null && !customer.getIdDetails().isEmpty()) {
			for (IdDetail idDetail : customer.getIdDetails()) {
				if (idDetail.getFrontPictureFile() != null && !idDetail.getFrontPictureFile().isEmpty()) {
					String contentType = idDetail.getFrontPictureFile().getContentType();

					if (contentType == null || !contentType.startsWith("image/")) {
						errorResponse.put("error", "Only image files are allowed (JPEG, PNG, etc.).");
						return ResponseEntity.badRequest().body(errorResponse);
					}
					try {
						idDetail.setFrontBase64Data(idDetail.getFrontPictureFile().getBytes());
						idDetail.setFrontContentType(contentType);
					} catch (Exception e) {
						errorResponse.put("error", "Error processing front picture: " + e.getMessage());
						return ResponseEntity.badRequest().body(errorResponse);
					}
				}
			}
		}

		if (customer.getIdDetails() != null && !customer.getIdDetails().isEmpty()) {
			for (IdDetail idDetail : customer.getIdDetails()) {
				if (idDetail.getBackPictureFile() != null && !idDetail.getBackPictureFile().isEmpty()) {
					String contentType = idDetail.getBackPictureFile().getContentType();

					if (contentType == null || !contentType.startsWith("image/")) {
						errorResponse.put("error", "Only image files are allowed (JPEG, PNG, etc.).");
						return ResponseEntity.badRequest().body(errorResponse);
					}
					try {
						idDetail.setBackBase64Data(idDetail.getBackPictureFile().getBytes());
						idDetail.setBackContentType(contentType);
					} catch (Exception e) {
						errorResponse.put("error", "Error processing back picture: " + e.getMessage());
						return ResponseEntity.badRequest().body(errorResponse);
					}
				}
			}
		}

		try {
			if (customer.getProfPictureFile() != null && !customer.getProfPictureFile().isEmpty()) {
				String contentType = customer.getProfPictureFile().getContentType();

				if (contentType == null || !contentType.startsWith("image/")) {
					errorResponse.put("error", "Only image files are allowed (JPEG, PNG, etc.).");
					return ResponseEntity.badRequest().body(errorResponse);
				}

				customer.setProfBase64Data(customer.getProfPictureFile().getBytes());
				customer.setProfContentType(contentType);
			}
		} catch (Exception e) {
			errorResponse.put("error", "Error processing profile picture: " + e.getMessage());
			return ResponseEntity.badRequest().body(errorResponse);
		}

		try {
			Map<String, Object> serviceResponse = customerService.createCustomer(customer, httpServletRequest);

			if (serviceResponse.containsKey("status") && "failed".equals(serviceResponse.get("status")) || serviceResponse.containsKey("status") && "failure".equals(serviceResponse.get("status"))) {
				return ResponseEntity.badRequest().body(serviceResponse);
			}

			return ResponseEntity.ok(serviceResponse);
		} catch (Exception e) {
			errorResponse.put("error", "An unexpected error occurred: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorResponse);
		}
	}

	@GetMapping("/customerdetails")
	public String getDetailsEcrn(@RequestParam("ecrn") String ecrn, Model model) {
		try {
			Optional<Customer> customer = customerService.getByEcrn(ecrn);
			if (customer.isPresent()) {
				model.addAttribute("customer", customer.get());
				model.addAttribute("idDetails",customer.get().getIdDetails());
				model.addAttribute("residentType", getResidentTypeDescription(customer.get().getResidentTypeId()));
				model.addAttribute("maritalStatus", getMaritalStatusDescription(customer.get().getMaritalStatus()));
				model.addAttribute("nationality", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getNationality()));
				model.addAttribute("secondNationality", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country", customer.get().getSecondNationality()));
				model.addAttribute("countryOfBirth", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getCountryOfBirth()));
				model.addAttribute("countryOfResidence", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country", customer.get().getCountryOfResidence()));
				model.addAttribute("occupationId", enumEntityService.getEnumValueDescriptionByKeyAndValueId("occupationId", String.valueOf(customer.get().getOccupationId())));
//				model.addAttribute("issuedCountry", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getIssuedCountry()));
				model.addAttribute("annualIncomeRangeId", enumEntityService.getEnumValueDescriptionByKeyAndValueId("annualIncomeRange", String.valueOf(customer.get().getAnnualIncomeRangeId())));
				model.addAttribute("riskRatingId", enumEntityService.getEnumValueDescriptionByKeyAndValueId("riskRatingId", String.valueOf(customer.get().getRiskRatingId())));
				model.addAttribute("incomeType", enumEntityService.getEnumValueDescriptionByKeyAndValueId("incomeType",String.valueOf(customer.get().getIncomeType())));
				model.addAttribute("professionCategory", enumEntityService.getEnumValueDescriptionByKeyAndValueId("professionCategory", customer.get().getProfessionCategory()));
				model.addAttribute("txnVolMonth", enumEntityService.getEnumValueDescriptionByKeyAndValueId("transactionVolumeMonth", String.valueOf(customer.get().getTxnVolMonth())));
				model.addAttribute("txnCountMonth", enumEntityService.getEnumValueDescriptionByKeyAndValueId("transactionCountMonth", String.valueOf(customer.get().getTxnCountMonth())));
				model.addAttribute("country", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getCountry()));
				model.addAttribute("parCountry", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getParCountry()));
				model.addAttribute("nativeRegion", enumEntityService.getEnumValueDescriptionByKeyAndFilters("state",
						customer.get().getNationality(), String.valueOf(customer.get().getNativeRegion())));;
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

		if (residentTypeId == null) {
			return "Unknown";
		}

		return residentTypeId == 101 ? "Resident" : "Non-Resident";
	}

	private String getMaritalStatusDescription(Integer maritalStatusId) {

		if (maritalStatusId == null) {
			return "Unknown";
		}

		return maritalStatusId == 1 ? "Married" : "Unmarried";
	}

	
	@GetMapping("/searchCustomers")
	public String searchCustomers(@RequestParam("criteria") String criteria, @RequestParam("query") String query,
			RedirectAttributes redirectAttributes) {
		try {
			// Use the searchByCriteria method from the service
			List<Customer> customers = customerService.searchByCriteria(criteria, query);
			redirectAttributes.addFlashAttribute("customerList", customers);
			if(!customers.isEmpty()) {
				redirectAttributes.addFlashAttribute("showBlank", false);
			}else {
			redirectAttributes.addFlashAttribute("showBlank", true);
			}
		} catch (Exception e) {
			logger.error(e.toString());
//			model.addAttribute("error", "Error occurred while searching: " + e.getMessage());
		}
		return "redirect:/customer";
	}
	@GetMapping("/updateCustomer")
	public String onboardCustomer2(@RequestParam("ecrn") String ecrn, Model model) {
		Optional<Customer> optionalCustomer = customerService.getByEcrn(ecrn);
		if (optionalCustomer.isPresent()) {
	        Customer customer = optionalCustomer.get(); // Get the actual Customer object
	        if (customer.getNationality() != null) {
	            List<EnumValue> nativeRegionList = enumEntityService.getDataByDependent(customer.getNationality());
	            model.addAttribute("nativeRegionList", nativeRegionList);
	        } else {
	        	Optional<EnumEntity> nativeRegionEntity = enumEntityService.getEnumEntityByKey("state");
				nativeRegionEntity.ifPresent(entity -> model.addAttribute("nativeRegionList", entity.getValues()));
	        }
	        if (customer.getCountryOfBirth() != null) {
	            List<EnumValue> placeOfBirthList = enumEntityService.getDataByDependent(customer.getCountryOfBirth());
	            model.addAttribute("placeOfBirthList", placeOfBirthList);
	        } else {
	        	Optional<EnumEntity> placeofBirthEntity = enumEntityService.getEnumEntityByKey("state");
	        	placeofBirthEntity.ifPresent(entity -> model.addAttribute("placeOfBirthList", entity.getValues()));
	        }
	        
	        if (customer.getCountry() != null) {
	            List<EnumValue> stateList = enumEntityService.getDataByDependent(customer.getCountry());
	            model.addAttribute("stateList", stateList);
	        } else {
	        	Optional<EnumEntity> stateEntity = enumEntityService.getEnumEntityByKey("state");
	        	stateEntity.ifPresent(entity -> model.addAttribute("stateList", entity.getValues()));
	        }
	        if (customer.getCountry() != null) {
	            List<EnumValue> stateList = enumEntityService.getDataByDependent(customer.getParCountry());
	            model.addAttribute("stateList", stateList);
	        } else {
	        	Optional<EnumEntity> stateEntity = enumEntityService.getEnumEntityByKey("state");
	        	stateEntity.ifPresent(entity -> model.addAttribute("stateList", entity.getValues()));
	        }
	     
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
		   model.addAttribute("customer", customer);
	    }
		return "customeronboardupdate";
	}
}
