package com.llm.customer.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

import com.llm.branch.model.BranchDetails;
import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.common.service.EnumEntityService;
import com.llm.customer.model.Customer;
import com.llm.customer.repository.CustomerRepository;
import com.llm.iddetail.model.IdDetail;
import com.llm.model.response.ResponseDTO;
import com.llm.staff.repository.StaffDetailsRepository;

import jakarta.transaction.Transactional;

@Service
public class CustomerService {

	private static final Logger loger = LoggerFactory.getLogger(CustomerService.class);

	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private StaffDetailsRepository staffDetailsRepository;

	@Autowired
	private BranchDetailsRepository branchDetailsRepository;

	@Autowired
	private CustomerCreationService customerCreationService;

	@Autowired
	private EnumEntityService enumEntityService;

	@Transactional
	public Map<String, Object> createCustomer(Customer customer, HttpServletRequest servletRequest) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		String selectedBranch = (String) servletRequest.getSession().getAttribute("selectedBranch");

		var byUsername = staffDetailsRepository.findByUsername(username);
		Optional<BranchDetails> branch = branchDetailsRepository.findById(Long.valueOf(selectedBranch));

		String country = enumEntityService.getEnumValueDescriptionByKeyAndValueId("country", byUsername.get().getCountry());

		String formattedCountry = country.substring(0, 1).toUpperCase() + country.substring(1).toLowerCase();

		customer.setChannel(branch.get().getCdpChannel());
		customer.setAgentLocationId(formattedCountry);
//		if (Objects.equals(customer.getCountryOfBirth(), "MY")) {
//			customer.setPlaceOfBirth(
//					(customer.getPlaceOfBirth().substring(0, customer.getPlaceOfBirth().length() - 4)).trim());
//		}
		// customer.setAgentLocationId("India");

		ZoneId mytZone = ZoneId.of("Asia/Kuala_Lumpur");
		String phone = "";
		phone +=  customer.getPhoneCode().trim().toString() + customer.getPrimaryMobileNumber().trim().toString();

		Map<String, Object> customerData = new HashMap<>();
		customerData.put("channel", customer.getChannel());
		customerData.put("agent_location_id", customer.getAgentLocationId());
		customerData.put("salutation", customer.getSalutation());
		customerData.put("first_name", customer.getFirstName());
		customerData.put("middle_name", customer.getMiddleName());
		customerData.put("last_name", customer.getLastName());
		customerData.put("preferred_name", customer.getPreferredName());
		customerData.put("mothers_maiden_name", customer.getMothersMaidenName());
		customerData.put("nationality", customer.getNationality());
		customerData.put("second_nationality", customer.getSecondNationality());
		customerData.put("native_region", customer.getNativeRegion());
//		customerData.put("date_of_birth", "1993-12-21");
		if (customer.getDateOfBirth().isEmpty()) {
			customerData.put("date_of_birth", null);
		} else {
			customerData.put("date_of_birth", customer.getDateOfBirth());
		}
		customerData.put("country_of_birth", customer.getCountryOfBirth());
		if (Objects.equals(customer.getCountryOfBirth(), "MY")) {
			
					String placeOfBirth = (customer.getPlaceOfBirth().substring(0, customer.getPlaceOfBirth().length() - 4)).trim();
					customerData.put("place_of_birth", placeOfBirth);
		}
		
		
		customerData.put("resident_type_id", customer.getResidentTypeId());
		customerData.put("country_of_residence", customer.getCountryOfResidence());
		customerData.put("gender", customer.getGender());
		customerData.put("primary_mobile_number", phone);
		customerData.put("secondary_mobile_number", customer.getSecondaryMobileNumber());
		customerData.put("phone_number", customer.getPhoneNumber());
		customerData.put("email_id", customer.getEmailId());
//		customerData.put("occupation_id", customer.getOccupationId());
		if (customer.getOccupationId() != null) {
			customerData.put("occupation_id", customer.getOccupationId());
		} else {
			customerData.put("occupation_id", null);
		}
		if (customer.getPoliticalExposedPerson() != null || customer.getPoliticalExposedPerson() != false) {
			customer.setPoliticalExposedPerson(true);
			customerData.put("political_exposed_person", customer.getPoliticalExposedPerson());
		} else {
			customer.setPoliticalExposedPerson(false);
			customerData.put("political_exposed_person", customer.getPoliticalExposedPerson());
		}

// Mapping Address List
		List<Map<String, Object>> addressListData = new ArrayList<>();
		if (customer != null) {
			for (int i = 0; i <= 1; i++) {
				Map<String, Object> addressData = new HashMap<>();

				if (i == 0) {
					addressData.put("address_type_id", "1");
					addressData.put("building_name", customer.getBuildingName());
					addressData.put("street_name", customer.getStreetName());
					addressData.put("landmark", customer.getLandmark());
					addressData.put("city", customer.getCity());
					addressData.put("district", customer.getDistrict());
					addressData.put("state", customer.getState());
					addressData.put("country", customer.getCountry());
					addressData.put("zip", customer.getZip());
//					addressData.put("po_box", customer.getZip());
					addressData.put("mobile_number", customer.getPhoneNumber());
					addressListData.add(addressData);
				} else {
					addressData.put("address_type_id", "2");
					addressData.put("building_name", customer.getParBuildingName());
					addressData.put("street_name", customer.getParStreetName());
					addressData.put("landmark", customer.getParLandmark());
					addressData.put("city", customer.getParCity());
					addressData.put("district", customer.getParDistrict());
					addressData.put("state", customer.getParState());
					addressData.put("country", customer.getParCountry());
					addressData.put("zip", customer.getParZip());
//					addressData.put("po_box", customer.getParPoBox());
					addressData.put("mobile_number", customer.getPhoneNumber());
					addressListData.add(addressData);
				}
			}
		}
		customerData.put("address_list", addressListData);

		// Mapping Additional Documents
		List<Map<String, Object>> additionalDocsData = new ArrayList<>();
		if (false) {
			// for (Document doc : customer.getAdditionalDocs()) {
			Map<String, Object> docData = new HashMap<>();
			docData.put("document_id", customer.getDocumentId());
			docData.put("base64_data", customer.getDocbase64Data());
			docData.put("content_type", customer.getDocContentType());
			additionalDocsData.add(docData);
		}
		customerData.put("additional_docs", additionalDocsData);

		// Mapping ID Details
		List<Map<String, Object>> idDetailsData = new ArrayList<>();
		for (IdDetail idDetail : customer.getIdDetails()) {
			Map<String, Object> idData = new HashMap<>();

			if (customer.getResidentTypeId() == 101) {
				idDetail.setIssuedOn((LocalDate.now(mytZone)).toString());
				idDetail.setDateOfExpiry((LocalDate.now(mytZone).plusYears(2)).toString());

				String issued = idDetail.getIssuedOn().trim();
				issued = issued.substring(0, 10);

				String doe = idDetail.getDateOfExpiry().trim();
				doe = doe.substring(0, 10);

				idDetail.setIdType(28);
				idDetail.setIssuedCountry("MY");
				idDetail.setIssuedBy("MYKD");
				idDetail.setIssuedAt("Malaysia");
				idDetail.setActiveStatus(true);
				idDetail.setDefaultStatus(true);


				idData.put("id_type", idDetail.getIdType());

				idData.put("id_number", idDetail.getIdNumber());
				idData.put("name_as_per_id", idDetail.getNameAsPerId());

				idData.put("issued_country", idDetail.getIssuedCountry());
				idData.put("issued_by", idDetail.getIssuedBy());
				idData.put("issued_at", idDetail.getIssuedAt());

				idData.put("issued_on", issued);
				idData.put("date_of_expiry", doe);

				idData.put("active_status", idDetail.getActiveStatus());
				idData.put("default_status", idDetail.getDefaultStatus());

				Map<String, Object> idFrontData = new HashMap<>();
				idFrontData.put("base64_data", idDetail.getFrontBase64Data());
				idFrontData.put("content_type", idDetail.getFrontContentType());
				idData.put("id_front", idFrontData);

				Map<String, Object> idBackData = new HashMap<>();
				idBackData.put("base64_data", idDetail.getBackBase64Data());
				idBackData.put("content_type", idDetail.getBackContentType());
				idData.put("id_back", idBackData);

				idDetailsData.add(idData);

			} else if (customer.getResidentTypeId() == 100) {
				idDetail.setActiveStatus(true);
				idDetail.setDefaultStatus(true);

				for (IdDetail idDetail1 : customer.getIdDetails()) {
					idData.put("id_type", idDetail1.getIdType());
				}

				idData.put("id_number", idDetail.getIdNumber());
				idData.put("visa_number", idDetail.getVisaNumber());
				if (idDetail.getVisaExpiryDate().isEmpty()) {
					idData.put("visa_expiry_date", null);
				} else {
					idData.put("visa_expiry_date", idDetail.getVisaExpiryDate());
				}
				idData.put("name_as_per_id", idDetail.getNameAsPerId());
				idData.put("issued_country", idDetail.getIssuedCountry());
				idData.put("issued_by", idDetail.getIssuedBy());
				idData.put("issued_at", idDetail.getIssuedAt());
				if (idDetail.getIssuedOn().isEmpty()) {
					idData.put("issued_on", null);
				} else {
					idData.put("issued_on", idDetail.getIssuedOn());
				}
				if (idDetail.getDateOfExpiry().isEmpty()) {
					idData.put("date_of_expiry", null);
				} else {
					idData.put("date_of_expiry", idDetail.getDateOfExpiry());
				}

				idData.put("active_status", idDetail.getActiveStatus());
				idData.put("default_status", idDetail.getDefaultStatus());

				Map<String, Object> idFrontData = new HashMap<>();
				idFrontData.put("base64_data", idDetail.getFrontBase64Data());
				idFrontData.put("content_type", idDetail.getFrontContentType());
				idData.put("id_front", idFrontData);

				Map<String, Object> idBackData = new HashMap<>();
				idBackData.put("base64_data", idDetail.getBackBase64Data());
				idBackData.put("content_type", idDetail.getBackContentType());
				idData.put("id_back", idBackData);

				idDetailsData.add(idData);

			}
		}
		customerData.put("id_details", idDetailsData);
		if (customer.getIncomeType() != null) {

			customer.setCustomerTypeId(1);
			customer.setPepCategory(1);

			Map<String, Object> classificationData = new HashMap<>();
			classificationData.put("customer_type_id", customer.getCustomerTypeId());
			classificationData.put("income_type", customer.getIncomeType());
			classificationData.put("annual_income_range_id", customer.getAnnualIncomeRangeId());
			classificationData.put("annual_income_currency_code", customer.getAnnualIncomeCurrencyCode());
			classificationData.put("txn_vol_month", customer.getTxnVolMonth());
			classificationData.put("txn_count_month", customer.getTxnCountMonth());
			classificationData.put("employer_name", customer.getEmployerName());
			classificationData.put("employer_address", customer.getEmployerAddress());
			classificationData.put("employer_phone", customer.getEmployerPhone());
			classificationData.put("profession_category", customer.getProfessionCategory());
			classificationData.put("first_language", customer.getFirstLanguage());
			classificationData.put("marital_status", customer.getMaritalStatus());

			classificationData.put("risk_rating_id", customer.getRiskRatingId());
			classificationData.put("dnfbp", false);
			classificationData.put("dpms", false);
			classificationData.put("tax_registration_number", customer.getTaxRegistrationNumber());
			classificationData.put("txn_issued_country", "MY");
			classificationData.put("show_remarks_on_txn", customer.getShowRemarksOnTxn());
			if (customer.getShowRemarksOnTxn()) {
				classificationData.put("customer_remarks", customer.getCustomerRemarks());
			}

				Map<String, Object> profilePhotoData = new HashMap<>();
				profilePhotoData.put("base64_data", customer.getProfBase64Data());
				profilePhotoData.put("content_type", customer.getProfContentType());
				classificationData.put("profile_photo", profilePhotoData);
			if (false) {

				List<Map<String, Object>> socialLinksData = new ArrayList<>();
				Map<String, Object> socialLinkData = new HashMap<>();
				socialLinkData.put("social_links_id", customer.getSocialLinksId());
				socialLinkData.put("text_field", customer.getTextField());
				socialLinksData.add(socialLinkData);
				classificationData.put("social_links", socialLinksData);
			}

			customerData.put("customer_classification", classificationData);
		}

		loger.info(customerData.toString());
		try {
			ResponseEntity<Map<String, Object>> response = customerCreationService.createCustomer(customerData);
			Map<String, Object> responseBody = response.getBody();

			if (response.getStatusCode() == HttpStatus.OK && responseBody != null) {
				Map<String, Object> dataMap = (Map<String, Object>) responseBody.get("data");

				if (dataMap != null) {
					customer.setEcrn((String) dataMap.get("ecrn"));
					customer.setAmlScanStatus((String) dataMap.get("aml_scan_status"));
					customer.setCustomerStatus((String) dataMap.get("customer_status"));
				}

				customerRepository.save(customer);
				loger.info("Customer onboarded successfully: " + responseBody);
			} else {
				loger.error("Failed to onboard customer: " + response.getStatusCode());
			}

			return responseBody;
		} catch (HttpClientErrorException e) {
			loger.error("Error occurred: " + e.getMessage());

			// Extract response body from the exception
			String responseBody = e.getResponseBodyAsString();

			try {
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> errorResponse = objectMapper.readValue(responseBody, Map.class);

				// Check if status code is 406 and error_code is 45013
				if (e.getStatusCode() == HttpStatus.NOT_ACCEPTABLE && errorResponse.containsKey("error_code")) {
					int errorCode = (int) errorResponse.get("error_code");

					if (errorCode == 45013) {
						String message = (String) errorResponse.get("message");
						String ecrn = extractCustomerId(message); // Extract the customer ID

						customer.setEcrn(ecrn);
						customer.setAmlScanStatus("Under Investigation");
						customer.setCustomerStatus("ACTIVE");

						customerRepository.save(customer);
						loger.info("Customer saved with status 'ACTIVE' and AML status 'Under Investigation': " + errorResponse);
					}
				}

				return errorResponse;
			} catch (JsonProcessingException jsonEx) {
				loger.error("Error parsing error response: " + jsonEx.getMessage());
			}

			// If JSON parsing fails, return a generic error response
			Map<String, Object> genericError = new HashMap<>();
			genericError.put("status", "failed");
			genericError.put("message", "An unexpected error occurred.");
			return genericError;
		}
	}

	private String extractCustomerId(String message) {
		if (message != null) {
			String[] words = message.split(" ");
			for (String word : words) {
				if (word.matches("\\d+")) { // Check if word is a number
					return word;
				}
			}
		}
		return null;
	}

	@Transactional
	public Optional<Customer> getByEcrn(String ecrn) {
		Customer customer = customerRepository.findByEcrn(ecrn);
//		if (customer != null && customer.getProfBase64Data() != null) {
//	        // Access the LOB field within the transaction
//	        byte[] profilePicture = customer.getProfBase64Data();
//	    }
		// Ensure we don't go out of bounds if the string is shorter than 10 characters
		customer.setDateOfBirth(customer.getDateOfBirth().length() <= 10 ? customer.getDateOfBirth()
				: customer.getDateOfBirth().substring(0, 10));
		return Optional.of(customer);
	}
	@Transactional
	public List<Customer> searchByCriteria(String criteria, String query) {
		query.trim().replaceAll("[^0-9]", "");
		if (query.trim().isBlank()) {
			return List.of();
		}
		return switch (criteria) {
		case "Customer Number:" -> customerRepository.findByEcrnContaining(query);
		case "Mobile Number:" -> customerRepository.findByPrimaryMobileNumberContaining(query);
		case "Email Id:" -> customerRepository.findByEmailIdContaining(query);
		case "ID Number:" -> customerRepository.findByIdNumberContaining(query);
		case "Customer Name:" -> customerRepository.findByFirstNameContainingIgnoreCaseOrLastNameContainingIgnoreCase(query, query);
		default -> List.of(); // Empty list if no criteria matches
		};
	}

	public Page<Customer> getCustomers(Pageable pageable) {
		return customerRepository.findAll(pageable);
	}

	public List<Customer> getAllCustomer() {
		return customerRepository.findAll();
	}

	public boolean verifyPrimaryMobileNumber(String primaryMobileNumber) {
		return customerRepository.existsByPrimaryMobileNumber(primaryMobileNumber);
	}

	/**
	 * Update the customer's AML scan status and customer status based on the provided ECRN.
	 *
	 * @param ecrn           The unique ECRN of the customer.
	 * @param amlScanStatus  The new AML scan status.
	 * @param customerStatus The new customer status.
	 * @return ResponseDTO indicating success or failure.
	 */
	public ResponseDTO updateCustomerStatus(String ecrn, String amlScanStatus, String customerStatus) {
		try {
			// Fetch the customer by ECRN
			Customer customer = customerRepository.findByEcrn(ecrn);

			if (customer == null) {
				return new ResponseDTO(HttpStatus.NOT_FOUND.value(), "failed", "Customer not found", null);
			}

			// Update the fields
			customer.setAmlScanStatus(amlScanStatus);
			customer.setCustomerStatus(customerStatus);

			// Save the updated customer
			customerRepository.save(customer);

			return new ResponseDTO(HttpStatus.OK.value(), "success", "Customer status updated successfully", null);
		} catch (Exception ex) {
			// Handle exceptions and return appropriate error response
			return new ResponseDTO(HttpStatus.INTERNAL_SERVER_ERROR.value(), "failed", "An error occurred while updating customer status", ex.getMessage());
		}
	}
	@Transactional
	public String updateCustomer(String ecrn, Customer updateCustomer, HttpServletRequest servletRequest) {
		Customer existingCustomer = customerRepository.findByEcrn(ecrn);
		Customer saveCustomer = null;
		String status = "";

		try {
			Map<String, Object> customerMap = convertCustomerToMap(existingCustomer, updateCustomer, servletRequest);
//			Map<String, Object> customerMap = convertCustomerToMap(existingCustomer);
			loger.info("customerMap=========" + customerMap);
			ResponseEntity<Map<String, Object>> response = customerCreationService.createCustomer(customerMap);
			loger.info("response=========" + response.getBody());
			Map<String, Object> responseBody = response.getBody();
			if (response.getStatusCode() == HttpStatus.OK && responseBody != null) {
				Map<String, Object> dataMap = (Map<String, Object>) responseBody.get("data");
				if (dataMap != null) {
					String ecrnResponse = (String) dataMap.get("ecrn");
					if(ecrnResponse != null)
						updateCustomer = updateCustomerMap(existingCustomer,updateCustomer);
					saveCustomer = customerRepository.save(updateCustomer);
				}
				status = "Customer updated successfully: " + saveCustomer.getEcrn();
			} else {
				status = "Failed to update customer. Status: " + response.getStatusCode();
			}
		} catch (HttpClientErrorException e) {
			status = "Error occurred: " + e.getMessage();
			System.out.println("Error occurred: " + e.getMessage());
		}

		return status;
	}

//	private Map<String, Object> convertCustomerToMap(Customer customer) {
//		ObjectMapper objectMapper = new ObjectMapper();
//		return objectMapper.convertValue(customer, new TypeReference<Map<String, Object>>() {});
//	}

	private Map<String, Object> convertCustomerToMap(Customer existingCustomer, Customer updateCustomer, HttpServletRequest servletRequest) {

		Map<String, Object> result = new HashMap<>();

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();
		String selectedBranch = (String) servletRequest.getSession().getAttribute("selectedBranch");

		var byUsername = staffDetailsRepository.findByUsername(username);
		Optional<BranchDetails> branch = branchDetailsRepository.findById(Long.valueOf(selectedBranch));

		String country = enumEntityService.getEnumValueDescriptionByKeyAndValueId("country",
				byUsername.get().getCountry());

		String formattedCountry = country.substring(0, 1).toUpperCase() + country.substring(1).toLowerCase();
		ZoneId mytZone = ZoneId.of("Asia/Kuala_Lumpur");
		updateCustomer.setChannel(branch.get().getCdpChannel());
		updateCustomer.setAgentLocationId(formattedCountry);
		result.put("agent_location_id", updateCustomer.getAgentLocationId() != null ? updateCustomer.getAgentLocationId() : existingCustomer.getAgentLocationId());
		result.put("channel", updateCustomer.getChannel()!= null ? updateCustomer.getChannel(): existingCustomer.getChannel());
		result.put("ecrn", updateCustomer.getEcrn() != null ? updateCustomer.getEcrn() : existingCustomer.getEcrn());
		result.put("first_name", updateCustomer.getFirstName() != null ? updateCustomer.getFirstName() : existingCustomer.getFirstName());
		result.put("middle_name", updateCustomer.getMiddleName() != null ? updateCustomer.getMiddleName() : existingCustomer.getMiddleName());
		result.put("last_name", updateCustomer.getLastName() != null ? updateCustomer.getLastName() : existingCustomer.getLastName());
		result.put("nationality", updateCustomer.getNationality() != null ? updateCustomer.getNationality() : existingCustomer.getNationality());
		result.put("second_nationality", updateCustomer.getSecondNationality() != null ? updateCustomer.getSecondNationality() : existingCustomer.getSecondNationality());
		result.put("native_region", updateCustomer.getNativeRegion() != null ? updateCustomer.getNativeRegion() : existingCustomer.getNativeRegion());
		result.put("date_of_birth", updateCustomer.getDateOfBirth() != null ? updateCustomer.getDateOfBirth() : existingCustomer.getDateOfBirth());  // Ensure this is formatted properly
		result.put("country_of_birth", updateCustomer.getCountryOfBirth() != null ? updateCustomer.getCountryOfBirth() : existingCustomer.getCountryOfBirth());
		result.put("place_of_birth", updateCustomer.getPlaceOfBirth() != null ? updateCustomer.getPlaceOfBirth() : existingCustomer.getPlaceOfBirth());
		result.put("resident_type_id", updateCustomer.getResidentTypeId() != null ? updateCustomer.getResidentTypeId() : existingCustomer.getResidentTypeId());
		result.put("country_of_residence", updateCustomer.getCountryOfResidence() != null ? updateCustomer.getCountryOfResidence() : existingCustomer.getCountryOfResidence());
		result.put("gender", updateCustomer.getGender() != null ? updateCustomer.getGender() : existingCustomer.getGender());
		result.put("primary_mobile_number", updateCustomer.getPrimaryMobileNumber() != null ? updateCustomer.getPrimaryMobileNumber() : existingCustomer.getPrimaryMobileNumber());
		result.put("email_id", updateCustomer.getEmailId() != null ? updateCustomer.getEmailId() : existingCustomer.getEmailId());
		result.put("occupation_id", updateCustomer.getOccupationId() != null ? updateCustomer.getOccupationId() : existingCustomer.getOccupationId());
		result.put("political_exposed_person", updateCustomer.getPoliticalExposedPerson() != null ? updateCustomer.getPoliticalExposedPerson() : existingCustomer.getPoliticalExposedPerson());

		List<Map<String, Object>> addressListData = new ArrayList<>();
		for (int i = 0; i <= 1; i++) {
			Map<String, Object> addressData = new HashMap<>();
			if (i == 0) {
				addressData.put("address_type_id", "1");
				addressData.put("building_name", updateCustomer.getBuildingName() != null ? updateCustomer.getBuildingName() : existingCustomer.getBuildingName());
				addressData.put("street_name", updateCustomer.getStreetName() != null ? updateCustomer.getStreetName() : existingCustomer.getStreetName());
				addressData.put("landmark", updateCustomer.getLandmark() != null ? updateCustomer.getLandmark() : existingCustomer.getLandmark());
				addressData.put("city", updateCustomer.getCity() != null ? updateCustomer.getCity() : existingCustomer.getCity());
				addressData.put("district", updateCustomer.getDistrict() != null ? updateCustomer.getDistrict() : existingCustomer.getDistrict());
				addressData.put("state", updateCustomer.getState() != null ? updateCustomer.getState() : existingCustomer.getState());
				addressData.put("country", updateCustomer.getCountry() != null ? updateCustomer.getCountry() : existingCustomer.getCountry());
				addressData.put("zip", updateCustomer.getZip() != null ? updateCustomer.getZip() : existingCustomer.getZip());
				addressData.put("mobile_number", updateCustomer.getPhoneNumber() != null ? updateCustomer.getPhoneNumber() : existingCustomer.getPhoneNumber());
				addressListData.add(addressData);
			} else {
				addressData.put("address_type_id", "2");
				addressData.put("building_name", updateCustomer.getParBuildingName() != null ? updateCustomer.getParBuildingName() : existingCustomer.getParBuildingName());
				addressData.put("street_name", updateCustomer.getParStreetName() != null ? updateCustomer.getParStreetName() : existingCustomer.getParStreetName());
				addressData.put("landmark", updateCustomer.getParLandmark() != null ? updateCustomer.getParLandmark() : existingCustomer.getParLandmark());
				addressData.put("city", updateCustomer.getParCity() != null ? updateCustomer.getParCity() : existingCustomer.getParCity());
				addressData.put("district", updateCustomer.getParDistrict() != null ? updateCustomer.getParDistrict() : existingCustomer.getParDistrict());
				addressData.put("state", updateCustomer.getParState() != null ? updateCustomer.getParState() : existingCustomer.getParState());
				addressData.put("country", updateCustomer.getParCountry() != null ? updateCustomer.getParCountry() : existingCustomer.getParCountry());
				addressData.put("zip", updateCustomer.getParZip() != null ? updateCustomer.getParZip() : existingCustomer.getParZip());
				addressData.put("mobile_number", updateCustomer.getPhoneNumber() != null ? updateCustomer.getPhoneNumber() : existingCustomer.getPhoneNumber());
				addressListData.add(addressData);
			}
		}
		result.put("address_list", addressListData);

		// ID Details: merge existing and updated details
		List<Map<String, Object>> idDetails = new ArrayList<>();
		List<IdDetail> existingIdDetails = existingCustomer.getIdDetails();
		List<IdDetail> updatedIdDetails = updateCustomer.getIdDetails();

		// Combine existing and updated ID details
//	    for (int i = 0; i < Math.max(existingIdDetails.size(), updatedIdDetails.size()); i++) {
//	        IdDetail existingIdDetail = i < existingIdDetails.size() ? existingIdDetails.get(i) : null;
//	        IdDetail updatedIdDetail = i < updatedIdDetails.size() ? updatedIdDetails.get(i) : null;

		int maxSize = Math.max(existingIdDetails.size(), updatedIdDetails.size()) - 1;
		IdDetail existingIdDetail = maxSize < existingIdDetails.size() ? existingIdDetails.get(maxSize) : null;
		IdDetail updatedIdDetail = maxSize < updatedIdDetails.size() ? updatedIdDetails.get(maxSize) : null;

		Map<String, Object> idMap = new HashMap<>();
		if(updateCustomer.getResidentTypeId() == 101) {
			updatedIdDetail.setIssuedOn((LocalDate.now(mytZone)).toString());
			updatedIdDetail.setDateOfExpiry((LocalDate.now(mytZone).plusYears(2)).toString());

			String issued = updatedIdDetail.getIssuedOn().trim();
			issued = issued.substring(0, 10);

			String doe = updatedIdDetail.getDateOfExpiry().trim();
			doe = doe.substring(0, 10);

			updatedIdDetail.setIdType(28);
			updatedIdDetail.setIssuedCountry("MY");
			updatedIdDetail.setIssuedBy("MYKD");
			updatedIdDetail.setIssuedAt("Malaysia");
//			updatedIdDetail.setActiveStatus(true);
//			updatedIdDetail.setDefaultStatus(true);

			idMap.put("id_type", updatedIdDetail.getIdType());

			idMap.put("id_number", updatedIdDetail.getIdNumber());
			idMap.put("name_as_per_id", updatedIdDetail.getNameAsPerId());

			idMap.put("issued_country", updatedIdDetail.getIssuedCountry());
			idMap.put("issued_by", updatedIdDetail.getIssuedBy());
			idMap.put("issued_at", updatedIdDetail.getIssuedAt());

			idMap.put("issued_on", issued);
			idMap.put("date_of_expiry", doe);

			idMap.put("active_status", updatedIdDetail.getActiveStatus());
			idMap.put("default_status", updatedIdDetail.getDefaultStatus());
			Map<String, Object> idFrontData = new HashMap<>();
			idFrontData.put("base64_data", updatedIdDetail.getFrontBase64Data());
			idFrontData.put("content_type", updatedIdDetail.getFrontContentType());
			idMap.put("id_front", idFrontData);

			Map<String, Object> idBackData = new HashMap<>();
			idMap.put("base64_data", updatedIdDetail.getBackBase64Data());
			idMap.put("content_type", updatedIdDetail.getBackContentType());
			idMap.put("id_back", idBackData);
		}else if(updateCustomer.getResidentTypeId() == 100) {
//			updatedIdDetail.setActiveStatus(true);
//			updatedIdDetail.setDefaultStatus(true);
			idMap.put("active_status", updatedIdDetail != null && updatedIdDetail.getActiveStatus() != null ? updatedIdDetail.getActiveStatus() : existingIdDetail != null ? existingIdDetail.getActiveStatus() : null );
			idMap.put("default_status",updatedIdDetail != null && updatedIdDetail.getDefaultStatus() != null ? updatedIdDetail.getDefaultStatus() : existingIdDetail != null ? existingIdDetail.getDefaultStatus() : null);
			idMap.put("id_type", updatedIdDetail != null && updatedIdDetail.getIdType() != null ? updatedIdDetail.getIdType() : existingIdDetail != null ? existingIdDetail.getIdType() : null);
			idMap.put("id_number", updatedIdDetail != null && updatedIdDetail.getIdNumber() != null ? updatedIdDetail.getIdNumber() : existingIdDetail != null ? existingIdDetail.getIdNumber() : null);

			if (updatedIdDetail.getVisaExpiryDate() != null && updatedIdDetail.getVisaExpiryDate().isEmpty()) {
				idMap.put("visa_expiry_date", null);
			} else {
				idMap.put("visa_expiry_date", updatedIdDetail != null && updatedIdDetail.getVisaExpiryDate() != null ? updatedIdDetail.getVisaExpiryDate() : existingIdDetail != null ? existingIdDetail.getVisaExpiryDate() : null);
			}

			idMap.put("name_as_per_id", updatedIdDetail != null && updatedIdDetail.getNameAsPerId() != null ? updatedIdDetail.getNameAsPerId() : existingIdDetail != null ? existingIdDetail.getNameAsPerId() : null);
			idMap.put("issued_country", updatedIdDetail != null && updatedIdDetail.getIssuedCountry() != null ? updatedIdDetail.getIssuedCountry() : existingIdDetail != null ? existingIdDetail.getIssuedCountry() : null);
			idMap.put("issued_by", updatedIdDetail != null && updatedIdDetail.getIssuedBy() != null ? updatedIdDetail.getIssuedBy() : existingIdDetail != null ? existingIdDetail.getIssuedBy() : null);
			idMap.put("issued_at", updatedIdDetail != null && updatedIdDetail.getIssuedAt() != null ? updatedIdDetail.getIssuedAt() : existingIdDetail != null ? existingIdDetail.getIssuedAt() : null);
			if (updatedIdDetail.getIssuedOn() != null && updatedIdDetail.getIssuedOn().isEmpty()) {
				idMap.put("issued_on", null);
			}else {
				idMap.put("issued_on", updatedIdDetail != null && updatedIdDetail.getIssuedOn() != null ? updatedIdDetail.getIssuedOn() : existingIdDetail != null ? existingIdDetail.getIssuedOn() : null);

			}
			if (updatedIdDetail.getDateOfExpiry() != null && updatedIdDetail.getDateOfExpiry().isEmpty()) {
				idMap.put("date_of_expiry", null);
			} else {
				idMap.put("date_of_expiry", updatedIdDetail != null && updatedIdDetail.getDateOfExpiry() != null ? updatedIdDetail.getDateOfExpiry() : existingIdDetail != null ? existingIdDetail.getDateOfExpiry() : null);
			}
//	        }
			idDetails.add(idMap);
		}
		result.put("id_details", idDetails);
		Map<String, Object> classificationMap = new HashMap<>();
		classificationMap.put("customer_type_id", updateCustomer.getCustomerTypeId() != null ? updateCustomer.getCustomerTypeId() : existingCustomer.getCustomerTypeId());
		classificationMap.put("income_type",updateCustomer.getIncomeType() != null ? updateCustomer.getIncomeType() : existingCustomer.getIncomeType());
		classificationMap.put("annual_income_range_id",updateCustomer.getAnnualIncomeRangeId() != null ? updateCustomer.getAnnualIncomeRangeId() : existingCustomer.getAnnualIncomeRangeId());
		classificationMap.put("annual_income_currency_code", updateCustomer.getAnnualIncomeCurrencyCode() != null ? updateCustomer.getAnnualIncomeCurrencyCode(): existingCustomer.getAnnualIncomeCurrencyCode());
		classificationMap.put("txn_vol_month",  updateCustomer.getTxnVolMonth() != null ? updateCustomer.getTxnVolMonth() : existingCustomer.getTxnVolMonth());
		classificationMap.put("txn_count_month", updateCustomer.getTxnCountMonth() != null ? updateCustomer.getTxnCountMonth() : existingCustomer.getTxnCountMonth());
		classificationMap.put("employer_name",  updateCustomer.getEmployerName() != null ? updateCustomer.getEmployerName(): existingCustomer.getEmployerName());
		classificationMap.put("employer_address", updateCustomer.getEmployerAddress() != null ? updateCustomer.getEmployerAddress() : existingCustomer.getEmployerAddress());
		classificationMap.put("employer_phone", updateCustomer.getEmployerPhone() != null ? updateCustomer.getEmployerPhone(): existingCustomer.getEmployerPhone());
		classificationMap.put("profession_category", updateCustomer.getProfessionCategory() != null ? updateCustomer.getProfessionCategory(): existingCustomer.getProfessionCategory());
		classificationMap.put("first_language",  updateCustomer.getFirstLanguage() != null ? updateCustomer.getFirstLanguage(): existingCustomer.getFirstLanguage());
		classificationMap.put("marital_status",  updateCustomer.getMaritalStatus() != null ? updateCustomer.getMaritalStatus(): existingCustomer.getMaritalStatus());
		classificationMap.put("risk_rating_id", updateCustomer.getRiskRatingId() != null ? updateCustomer.getRiskRatingId(): existingCustomer.getRiskRatingId());
		classificationMap.put("dnfbp",updateCustomer.getDnfbp() != null ? updateCustomer.getDnfbp(): existingCustomer.getDnfbp());
		classificationMap.put("dpms",  updateCustomer.getDpms() != null ? updateCustomer.getDpms(): existingCustomer.getDpms());
		classificationMap.put("tax_registration_number", updateCustomer.getTaxRegistrationNumber() != null ? updateCustomer.getTaxRegistrationNumber(): existingCustomer.getTaxRegistrationNumber());
		classificationMap.put("txn_issued_country", updateCustomer.getTxnIssuedCountry() != null ? updateCustomer.getTxnIssuedCountry(): existingCustomer.getTxnIssuedCountry());
		classificationMap.put("show_remarks_on_txn", updateCustomer.getShowRemarksOnTxn() != null ? updateCustomer.getShowRemarksOnTxn(): existingCustomer.getShowRemarksOnTxn());
		classificationMap.put("customer_remarks",  updateCustomer.getCustomerRemarks() != null ? updateCustomer.getCustomerRemarks(): existingCustomer.getCustomerRemarks());

		Map<String, Object> profilePhotoData = new HashMap<>();
		classificationMap.put("base64_data", updateCustomer.getProfBase64Data());
		classificationMap.put("content_type", updateCustomer.getProfContentType());
		classificationMap.put("profile_photo", profilePhotoData);
		result.put("customer_classification", classificationMap);

		return result;
	}
	public Customer updateCustomerMap(Customer existingCustomer, Customer updateCustomer) {
		if (updateCustomer.getChannel() != null) existingCustomer.setChannel(updateCustomer.getChannel());
		if (updateCustomer.getAgentLocationId() != null) existingCustomer.setAgentLocationId(updateCustomer.getAgentLocationId());
		if (updateCustomer.getSalutation() != null) existingCustomer.setSalutation(updateCustomer.getSalutation());
		if (updateCustomer.getFirstName() != null) existingCustomer.setFirstName(updateCustomer.getFirstName());
		if (updateCustomer.getMiddleName() != null) existingCustomer.setMiddleName(updateCustomer.getMiddleName());
		if (updateCustomer.getLastName() != null) existingCustomer.setLastName(updateCustomer.getLastName());
		if (updateCustomer.getPreferredName() != null) existingCustomer.setPreferredName(updateCustomer.getPreferredName());
		if (updateCustomer.getNationality() != null) existingCustomer.setNationality(updateCustomer.getNationality());
		if (updateCustomer.getSecondNationality() != null) existingCustomer.setSecondNationality(updateCustomer.getSecondNationality());
		if (updateCustomer.getNativeRegion() != null) existingCustomer.setNativeRegion(updateCustomer.getNativeRegion());
		if (updateCustomer.getDateOfBirth() != null) existingCustomer.setDateOfBirth(updateCustomer.getDateOfBirth());
		if (updateCustomer.getCountryOfBirth() != null) existingCustomer.setCountryOfBirth(updateCustomer.getCountryOfBirth());
		if (updateCustomer.getPlaceOfBirth() != null) existingCustomer.setPlaceOfBirth(updateCustomer.getPlaceOfBirth());
		if (updateCustomer.getResidentTypeId() != null) existingCustomer.setResidentTypeId(updateCustomer.getResidentTypeId());
		if (updateCustomer.getCountryOfResidence() != null) existingCustomer.setCountryOfResidence(updateCustomer.getCountryOfResidence());
		if (updateCustomer.getPhoneCode() != null) existingCustomer.setPhoneCode(updateCustomer.getPhoneCode());
		if (updateCustomer.getGender() != null) existingCustomer.setGender(updateCustomer.getGender());
		if (updateCustomer.getMothersMaidenName() != null) existingCustomer.setMothersMaidenName(updateCustomer.getMothersMaidenName());
		if (updateCustomer.getPrimaryMobileNumber() != null) existingCustomer.setPrimaryMobileNumber(updateCustomer.getPrimaryMobileNumber());
		if (updateCustomer.getSecondaryMobileNumber() != null) existingCustomer.setSecondaryMobileNumber(updateCustomer.getSecondaryMobileNumber());
		if (updateCustomer.getEmailId() != null) existingCustomer.setEmailId(updateCustomer.getEmailId());
		if (updateCustomer.getPhoneNumber() != null) existingCustomer.setPhoneNumber(updateCustomer.getPhoneNumber());
		if (updateCustomer.getOccupationId() != null) existingCustomer.setOccupationId(updateCustomer.getOccupationId());
		if (updateCustomer.getPoliticalExposedPerson() != null) existingCustomer.setPoliticalExposedPerson(updateCustomer.getPoliticalExposedPerson());
		if (updateCustomer.getUpdatedBy() != null) existingCustomer.setUpdatedBy(updateCustomer.getUpdatedBy());
		if (updateCustomer.getEcrn() != null) existingCustomer.setEcrn(updateCustomer.getEcrn());

		// Address fields
		if (updateCustomer.getBuildingName() != null) existingCustomer.setBuildingName(updateCustomer.getBuildingName());
		if (updateCustomer.getStreetName() != null) existingCustomer.setStreetName(updateCustomer.getStreetName());
		if (updateCustomer.getLandmark() != null) existingCustomer.setLandmark(updateCustomer.getLandmark());
		if (updateCustomer.getCity() != null) existingCustomer.setCity(updateCustomer.getCity());
		if (updateCustomer.getDistrict() != null) existingCustomer.setDistrict(updateCustomer.getDistrict());
		if (updateCustomer.getState() != null) existingCustomer.setState(updateCustomer.getState());
		if (updateCustomer.getCountry() != null) existingCustomer.setCountry(updateCustomer.getCountry());
		if (updateCustomer.getZip() != null) existingCustomer.setZip(updateCustomer.getZip());
		if (updateCustomer.getPoBox() != null) existingCustomer.setPoBox(updateCustomer.getPoBox());
		if (updateCustomer.getMobileNumber() != null) existingCustomer.setMobileNumber(updateCustomer.getMobileNumber());
		
		if (updateCustomer.getParBuildingName() != null) existingCustomer.setParBuildingName(updateCustomer.getParBuildingName());
		if (updateCustomer.getParStreetName() != null) existingCustomer.setParStreetName(updateCustomer.getParStreetName());
		if (updateCustomer.getParLandmark() != null) existingCustomer.setParLandmark(updateCustomer.getParLandmark());
		if (updateCustomer.getParCity() != null) existingCustomer.setParCity(updateCustomer.getParCity());
		if (updateCustomer.getParDistrict() != null) existingCustomer.setParDistrict(updateCustomer.getParDistrict());
		if (updateCustomer.getParState() != null) existingCustomer.setParState(updateCustomer.getParState());
		if (updateCustomer.getParCountry() != null) existingCustomer.setParCountry(updateCustomer.getParCountry());
		if (updateCustomer.getParZip() != null) existingCustomer.setParZip(updateCustomer.getParZip());
		if (updateCustomer.getParPoBox() != null) existingCustomer.setParPoBox(updateCustomer.getParPoBox());
		if (updateCustomer.getParMobileNumber() != null) existingCustomer.setParMobileNumber(updateCustomer.getParMobileNumber());

		// ID details update (if non-empty list)
//		if (updateCustomer.getIdDetails() != null && !updateCustomer.getIdDetails().isEmpty()) {
//			existingCustomer.getIdDetails().clear();
//			existingCustomer.getIdDetails().addAll(updateCustomer.getIdDetails());
//		}
		if (updateCustomer.getIdDetails() != null && !updateCustomer.getIdDetails().isEmpty()) {
			 List<IdDetail> existingIdDetails = existingCustomer.getIdDetails();
			 
			 for (int i = 0; i < updateCustomer.getIdDetails().size(); i++) {
				 IdDetail updatedIdDetail = updateCustomer.getIdDetails().get(i);
				 if (i >= existingIdDetails.size()) {
			            existingIdDetails.add(updatedIdDetail);
			        }
				 else {
			            IdDetail existingIdDetail = existingIdDetails.get(i);
			            if (updatedIdDetail.getId() != null) existingIdDetail.setId(updatedIdDetail.getId());
			            if (updatedIdDetail.getIdType() != null) existingIdDetail.setIdType(updatedIdDetail.getIdType());
			            if (updatedIdDetail.getIdNumber() != null) existingIdDetail.setIdNumber(updatedIdDetail.getIdNumber());
			            if (updatedIdDetail.getNameAsPerId() != null) existingIdDetail.setNameAsPerId(updatedIdDetail.getNameAsPerId());
			            
			            if (updatedIdDetail.getIssuedAt() != null) existingIdDetail.setIssuedAt(updatedIdDetail.getIssuedAt());
			            if (updatedIdDetail.getIssuedOn() != null) existingIdDetail.setIssuedOn(updatedIdDetail.getIssuedOn());
			            if (updatedIdDetail.getIssuedAt() != null) existingIdDetail.setIssuedAt(updatedIdDetail.getIssuedAt());
			            if (updatedIdDetail.getIssuedBy() != null) existingIdDetail.setIssuedBy(updatedIdDetail.getIssuedBy());
			            if (updatedIdDetail.getIssuedCountry() != null) existingIdDetail.setIssuedCountry(updatedIdDetail.getIssuedCountry());
			            
			            if (updatedIdDetail.getVisaExpiryDate() != null) existingIdDetail.setVisaExpiryDate(updatedIdDetail.getVisaExpiryDate());
			            if (updatedIdDetail.getVisaNumber() != null) existingIdDetail.setVisaNumber(updatedIdDetail.getVisaNumber());
			            if (updatedIdDetail.getVisaType() != null) existingIdDetail.setVisaType(updatedIdDetail.getVisaType());
			            if (updatedIdDetail.getDateOfExpiry() != null) existingIdDetail.setDateOfExpiry(updatedIdDetail.getDateOfExpiry());
			            
			            if (updatedIdDetail.getFrontBase64Data() != null) existingIdDetail.setFrontBase64Data(updatedIdDetail.getFrontBase64Data());
			            if (updatedIdDetail.getFrontPictureFile() != null) existingIdDetail.setFrontPictureFile(updatedIdDetail.getFrontPictureFile());
			            if (updatedIdDetail.getFrontContentType() != null) existingIdDetail.setFrontContentType(updatedIdDetail.getFrontContentType());
			           
			            if (updatedIdDetail.getBackBase64Data() != null) existingIdDetail.setBackBase64Data(updatedIdDetail.getBackBase64Data());
			            if (updatedIdDetail.getBackPictureFile() != null) existingIdDetail.setBackPictureFile(updatedIdDetail.getBackPictureFile());
			            if (updatedIdDetail.getBackContentType() != null) existingIdDetail.setBackContentType(updatedIdDetail.getBackContentType());
			           
			            if (updatedIdDetail.getActiveStatus() != null) existingIdDetail.setActiveStatus(updatedIdDetail.getActiveStatus());
			            if (updatedIdDetail.getDefaultStatus() != null) existingIdDetail.setDefaultStatus(updatedIdDetail.getDefaultStatus());
			        }
			 }
		}

		// Fields to update based on additional conditional checks
		if (updateCustomer.getCustomerTypeId() != null) existingCustomer.setCustomerTypeId(updateCustomer.getCustomerTypeId());
		if (updateCustomer.getIncomeType() != null) existingCustomer.setIncomeType(updateCustomer.getIncomeType());
		if (updateCustomer.getAnnualIncomeRangeId() != null) existingCustomer.setAnnualIncomeRangeId(updateCustomer.getAnnualIncomeRangeId());
		if (updateCustomer.getAnnualIncomeCurrencyCode() != null) existingCustomer.setAnnualIncomeCurrencyCode(updateCustomer.getAnnualIncomeCurrencyCode());
		if (updateCustomer.getTxnVolMonth() != null) existingCustomer.setTxnVolMonth(updateCustomer.getTxnVolMonth());
		if (updateCustomer.getTxnCountMonth() != null) existingCustomer.setTxnCountMonth(updateCustomer.getTxnCountMonth());
		if (updateCustomer.getEmployerName() != null) existingCustomer.setEmployerName(updateCustomer.getEmployerName());
		if (updateCustomer.getEmployerAddress() != null) existingCustomer.setEmployerAddress(updateCustomer.getEmployerAddress());
		if (updateCustomer.getEmployerPhone() != null) existingCustomer.setEmployerPhone(updateCustomer.getEmployerPhone());
		if (updateCustomer.getProfessionCategory() != null) existingCustomer.setProfessionCategory(updateCustomer.getProfessionCategory());
		if (updateCustomer.getFirstLanguage() != null) existingCustomer.setFirstLanguage(updateCustomer.getFirstLanguage());
		if (updateCustomer.getMaritalStatus() != null) existingCustomer.setMaritalStatus(updateCustomer.getMaritalStatus());
		if (updateCustomer.getRiskRatingId() != null) existingCustomer.setRiskRatingId(updateCustomer.getRiskRatingId());
		if (updateCustomer.getTaxRegistrationNumber() != null) existingCustomer.setTaxRegistrationNumber(updateCustomer.getTaxRegistrationNumber());
		if (updateCustomer.getShowRemarksOnTxn() != null) existingCustomer.setShowRemarksOnTxn(updateCustomer.getShowRemarksOnTxn());
		if (updateCustomer.getCustomerRemarks() != null) existingCustomer.setCustomerRemarks(updateCustomer.getCustomerRemarks());
		if(updateCustomer.getProfBase64Data() !=null) existingCustomer.setProfBase64Data(updateCustomer.getProfBase64Data());
		return existingCustomer;
	}
	
	public Optional<Customer> getById(Long id) {
	    return customerRepository.findById(id);
	}
	
	@Transactional
	public List<IdDetail> getIdDetailsByCustomerId(Long customerId) {
	    return customerRepository.findById(customerId)
	            .map(Customer::getIdDetails)
	            .orElse(Collections.emptyList());
	}

	public boolean verifyEmailId(String emailId) {
		return customerRepository.existsByEmailId(emailId);
	}
	
}
