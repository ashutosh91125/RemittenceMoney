package com.llm.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;

import com.llm.UserIdentity.repository.UserRepository;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.common.service.EnumEntityService;
import com.llm.model.response.ResponseDTO;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
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

import com.llm.model.Customer;
import com.llm.repositories.CustomerRepository;

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
	public String createCustomer(Customer customer) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String username = authentication.getName();

		var byUsername = staffDetailsRepository.findByUsername(username);
		Optional<BranchDetails> branch = branchDetailsRepository.findById(byUsername.get().getBranches());

		String country = enumEntityService.getEnumValueDescriptionByKeyAndValueId("country", byUsername.get().getCountry());

		String formattedCountry = country.substring(0, 1).toUpperCase() + country.substring(1).toLowerCase();

		customer.setChannel(branch.get().getCdpChannel());
		customer.setAgentLocationId(formattedCountry);
		if (Objects.equals(customer.getCountryOfBirth(), "MY")) {
			customer.setPlaceOfBirth(
					(customer.getPlaceOfBirth().substring(0, customer.getPlaceOfBirth().length() - 4)).trim());
		}
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
		customerData.put("place_of_birth", customer.getPlaceOfBirth());
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
//			}
		}
		customerData.put("additional_docs", additionalDocsData);

// Mapping ID Details
		List<Map<String, Object>> idDetailsData = new ArrayList<>();
		if (!customer.getIdNumber().isEmpty()) {
//			for (IdDetail idDetail : customer.getIdDetails()) {
			Map<String, Object> idData = new HashMap<>();

			if (customer.getResidentTypeId() == 101) {
				customer.setIssuedOn((LocalDate.now(mytZone)).toString());
				customer.setDateOfExpiry((LocalDate.now(mytZone).plusYears(2)).toString());
//				customer.setIssuedOn("2024-11-26");
//				customer.setDateOfExpiry("2026-11-26");

				String issued = customer.getIssuedOn().trim();
				issued = issued.substring(0, 10);

				String doe = customer.getDateOfExpiry().trim();
				doe = doe.substring(0, 10);

				customer.setIdType(28);
				customer.setIssuedCountry("MY");
				customer.setIssuedBy("MYKD");
				customer.setIssuedAt("Malaysia");
				customer.setActiveStatus(true);

				idData.put("id_type", customer.getIdType());

				idData.put("id_number", customer.getIdNumber());
				idData.put("name_as_per_id", customer.getNameAsPerId());

				idData.put("issued_country", customer.getIssuedCountry());
				idData.put("issued_by", customer.getIssuedBy());
				idData.put("issued_at", customer.getIssuedAt());

//				customerData.put("issued_on", customer.getIssuedOn());
//				customerData.put("date_of_expiry", customer.getDateOfExpiry());

				idData.put("issued_on", issued);
				idData.put("date_of_expiry", doe);

				idData.put("active_status", customer.getActiveStatus());

				Map<String, Object> idFrontData = new HashMap<>();
				idFrontData.put("base64_data", customer.getFrontBase64Data());
				idFrontData.put("content_type", customer.getFrontContentType());
				idData.put("id_front", idFrontData);

				Map<String, Object> idBackData = new HashMap<>();
				idBackData.put("base64_data", customer.getBackBase64Data());
				idBackData.put("content_type", customer.getBackContentType());
				idData.put("id_back", idBackData);

				loger.info("======customer.getResidentTypeId()===" + idData);
				idDetailsData.add(idData);

			} else if (customer.getResidentTypeId() == 100) {

				customer.setIdType(2);
				customer.setActiveStatus(true);

				idData.put("id_type", customer.getIdType());
				idData.put("id_number", customer.getIdNumber());
				idData.put("visa_number", customer.getVisaNumber());
				if (customer.getVisaExpiryDate().isEmpty()) {
					customerData.put("visa_expiry_date", null);
				} else {
					customerData.put("visa_expiry_date", customer.getVisaExpiryDate());
				}
//				idData.put("visa_expiry_date", customer.getVisaExpiryDate());
//				idData.put("visa_expiry_date", "2025-12-12");
				idData.put("name_as_per_id", customer.getNameAsPerId());
				idData.put("issued_country", customer.getIssuedCountry());
				idData.put("issued_by", customer.getIssuedBy());
				idData.put("issued_at", customer.getIssuedAt());
				if (customer.getIssuedOn().isEmpty()) {
					customerData.put("issued_on", null);
				} else {
					customerData.put("issued_on", customer.getIssuedOn());
				}
//				idData.put("issued_on", "2024-06-12");
				if (customer.getDateOfExpiry().isEmpty()) {
					customerData.put("date_of_expiry", null);
				} else {
					customerData.put("date_of_expiry", customer.getDateOfExpiry());
				}
//				idData.put("date_of_expiry", "2025-12-12");
//				idData.put("date_of_expiry", customer.getDateOfExpiry());
				idData.put("active_status", customer.getActiveStatus());

				Map<String, Object> idFrontData = new HashMap<>();
				idFrontData.put("base64_data", customer.getFrontBase64Data());
				idFrontData.put("content_type", customer.getFrontContentType());
				idData.put("id_front", idFrontData);

				Map<String, Object> idBackData = new HashMap<>();
				idBackData.put("base64_data", customer.getBackBase64Data());
				idBackData.put("content_type", customer.getBackContentType());
				idData.put("id_back", idBackData);

				idDetailsData.add(idData);

			}

		}
		customerData.put("id_details", idDetailsData);

		// Mapping Customer Classification
//		CustomerClassification classification = customer.getCustomerClassification();
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
//			classificationData.put("reason_for_acc", customer.getReasonForAcc());
//			classificationData.put("agent_ref_no", customer.getAgentRefNo());
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

			// Mapping Profile Photo if exists
			if (false) {
				Map<String, Object> profilePhotoData = new HashMap<>();
				profilePhotoData.put("base64_data", customer.getProfBase64Data());
				profilePhotoData.put("content_type", customer.getProfContentType());
				classificationData.put("profile_photo", profilePhotoData);
			}

			// Mapping Social Links
			if (false) {

				List<Map<String, Object>> socialLinksData = new ArrayList<>();
//				for (SocialLink socialLink : classification.getSocialLinks()) {
				Map<String, Object> socialLinkData = new HashMap<>();
				socialLinkData.put("social_links_id", customer.getSocialLinksId());
				socialLinkData.put("text_field", customer.getTextField());
				socialLinksData.add(socialLinkData);
				classificationData.put("social_links", socialLinksData);
//				}
			}

			customerData.put("customer_classification", classificationData);
		}

		Customer saveCustomer = new Customer();
		String status = new String();

		loger.info(customerData.toString());
		try {
			ResponseEntity<Map<String, Object>> response = customerCreationService.createCustomer(customerData);
			Map<String, Object> responseBody = response.getBody();
			if (response.getStatusCode() == HttpStatus.OK) {

				Map<String, Object> dataMap = (Map<String, Object>) responseBody.get("data");
				if (dataMap != null) {
					String ecrn = (String) dataMap.get("ecrn");
					String amlScanStatus = (String) dataMap.get("aml_scan_status");
					String customerStatus = (String) dataMap.get("customer_status");
					if (ecrn != null) {
						customer.setEcrn(ecrn);
					}
					if (amlScanStatus != null) {
						customer.setAmlScanStatus(amlScanStatus);
					}
					if (customerStatus != null) {
						customer.setCustomerStatus(customerStatus);
					}
				}

				status = responseBody.toString();
				saveCustomer = customerRepository.save(customer);
				System.out.println("Customer onboarded successfully: " + response.getBody());
			} else {
				System.out.println("Failed to onboard customer: " + response.getStatusCode());
			}
		} catch (HttpClientErrorException e) {
			status = e.getMessage();
			System.out.println("Error occurred: " + e.getMessage());
		}

		return status;
	}

	public Optional<Customer> getByEcrn(String ecrn) {
		Customer customer = customerRepository.findByEcrn(ecrn);
		// Ensure we don't go out of bounds if the string is shorter than 10 characters
		customer.setDateOfBirth(customer.getDateOfBirth().length() <= 10 ? customer.getDateOfBirth()
				: customer.getDateOfBirth().substring(0, 10));
		return Optional.of(customer);
	}

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
		case "Customer Name:" -> customerRepository.findByFirstNameContainingOrLastNameContaining(query, query);
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
}
