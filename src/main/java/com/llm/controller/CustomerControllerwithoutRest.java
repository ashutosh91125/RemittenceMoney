package com.llm.controller;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String createUser(@ModelAttribute Customer customer) {

//		if (!frontBase64Data.isEmpty()) {
//			String base64Image = Base64.getEncoder().encodeToString(frontBase64Data.getBytes());
//			customer.setFrontBase64Data(base64Image);
//			customer.setFrontContentType(frontBase64Data.getContentType());
//		}
//
//		if (!backBase64Data.isEmpty()) {
//			String base64Image = Base64.getEncoder().encodeToString(backBase64Data.getBytes());
//			customer.setBackBase64Data(base64Image);
//			customer.setBackContentType(backBase64Data.getContentType());
//		}

		String status = customerService.createCustomer(customer);
		logger.info(customer.toString());
		return "redirect:/customer-list"; // Redirect to home after creating a user
	}

	@GetMapping("/customerdetails")
	public String getDetailsEcrn(@RequestParam("ecrn") String ecrn, Model model) {
		try {
			Optional<Customer> customer = customerService.getByEcrn(ecrn);
			if (customer.isPresent()) {
				model.addAttribute("customer", customer.get()); // Use the actual Customer object
				model.addAttribute("nationality",enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",customer.get().getNationality()));
			} else {
				model.addAttribute("error", "Customer details not found.");
			}
		} catch (Exception e) {
			logger.error("Error fetching customer details for ECRN: " + ecrn, e);
			model.addAttribute("error", "An error occurred while retrieving customer details.");
		}
		return "customeronboardeditview"; // The view to show the details and edit
	}

}
