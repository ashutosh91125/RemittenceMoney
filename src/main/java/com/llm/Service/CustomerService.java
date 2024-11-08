package com.llm.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

import com.llm.model.Address;
import com.llm.model.Customer;
import com.llm.model.CustomerClassification;
import com.llm.model.Document;
import com.llm.model.IdDetail;
import com.llm.model.SocialLink;
import com.llm.repositories.CustomerRepository;

import jakarta.transaction.Transactional;

@Service
public class CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private CustomerCreationService customerCreationService;

	@Transactional
	public String createCustomer(Customer customer) {

		Map<String, Object> customerData = new HashMap<>();
		customerData.put("channel", customer.getChannel());
		customerData.put("agent_location_id", customer.getAgentLocationId());
		customerData.put("first_name", customer.getFirstName());
		customerData.put("middle_name", customer.getMiddleName());
		customerData.put("last_name", customer.getLastName());
		customerData.put("preferred_name", customer.getPreferredName());
		customerData.put("mothers_maiden_name", customer.getMothersMaidenName());
		customerData.put("nationality", customer.getNationality());
		customerData.put("second_nationality", customer.getSecondNationality());
		customerData.put("native_region", customer.getNativeRegion());
		customerData.put("date_of_birth", customer.getDateOfBirth());
		customerData.put("country_of_birth", customer.getCountryOfBirth());
		customerData.put("place_of_birth", customer.getPlaceOfBirth());
		customerData.put("resident_type_id", customer.getResidentTypeId());
		customerData.put("country_of_residence", customer.getCountryOfResidence());
		customerData.put("gender", customer.getGender());
		customerData.put("primary_mobile_number", customer.getPrimaryMobileNumber());
		customerData.put("secondary_mobile_number", customer.getSecondaryMobileNumber());
		customerData.put("phone_number", customer.getPhoneNumber());
		customerData.put("email_id", customer.getEmailId());
		customerData.put("occupation_id", customer.getOccupationId());

// Mapping Address List
		List<Map<String, Object>> addressListData = new ArrayList<>();
		if (customer.getAddressList() != null) {
			for (Address address : customer.getAddressList()) {
				Map<String, Object> addressData = new HashMap<>();
				addressData.put("address_type_id", address.getAddressTypeId());
				addressData.put("building_name", address.getBuildingName());
				addressData.put("street_name", address.getStreetName());
				addressData.put("landmark", address.getLandmark());
				addressData.put("city", address.getCity());
				addressData.put("district", address.getDistrict());
				addressData.put("state", address.getState());
				addressData.put("country", address.getCountry());
				addressData.put("zip", address.getZip());
				addressData.put("po_box", address.getPoBox());
				addressData.put("mobile_number", address.getMobileNumber());
				addressListData.add(addressData);
			}
		}
		customerData.put("address_list", addressListData);

// Mapping Additional Documents
		List<Map<String, Object>> additionalDocsData = new ArrayList<>();
		if (customer.getAdditionalDocs() != null) {
			for (Document doc : customer.getAdditionalDocs()) {
				Map<String, Object> docData = new HashMap<>();
				docData.put("document_id", doc.getDocument_id());
				docData.put("base64_data", doc.getBase64_data());
				docData.put("content_type", doc.getContent_type());
				additionalDocsData.add(docData);
			}
		}
		customerData.put("additional_docs", additionalDocsData);

// Mapping ID Details
		List<Map<String, Object>> idDetailsData = new ArrayList<>();
		if (customer.getIdDetails() != null) {
			for (IdDetail idDetail : customer.getIdDetails()) {
				Map<String, Object> idData = new HashMap<>();
				idData.put("id_type", idDetail.getIdType());
				idData.put("id_number", idDetail.getIdNumber());
				idData.put("visa_number", idDetail.getVisaNumber());
				idData.put("visa_expiry_date", idDetail.getVisaExpiryDate());
				idData.put("name_as_per_id", idDetail.getNameAsPerId());
				idData.put("issued_country", idDetail.getIssuedCountry());
				idData.put("issued_by", idDetail.getIssuedBy());
				idData.put("issued_at", idDetail.getIssuedAt());
				idData.put("issued_on", idDetail.getIssuedOn());
				idData.put("date_of_expiry", idDetail.getDateOfExpiry());
				idData.put("active_status", idDetail.getActiveStatus());

				if (idDetail.getIdFront() != null) {

					Map<String, Object> idFrontData = new HashMap<>();
					idFrontData.put("base64_data", idDetail.getIdFront().getBase64Data());
					idFrontData.put("content_type", idDetail.getIdFront().getContentType());
					idData.put("id_front", idFrontData);
				}

				if (idDetail.getIdBack() != null) {
					Map<String, Object> idBackData = new HashMap<>();
					idBackData.put("base64_data", idDetail.getIdBack().getBase64Data());
					idBackData.put("content_type", idDetail.getIdBack().getContentType());
					idData.put("id_back", idBackData);
				}

				idDetailsData.add(idData);
			}
		}
		customerData.put("id_details", idDetailsData);

		// Mapping Customer Classification
		CustomerClassification classification = customer.getCustomerClassification();
		if (classification != null) {
			Map<String, Object> classificationData = new HashMap<>();
			classificationData.put("customer_type_id", classification.getCustomerTypeId());
			classificationData.put("income_type", classification.getIncomeType());
			classificationData.put("annual_income_range_id", classification.getAnnualIncomeRangeId());
			classificationData.put("annual_income_currency_code", classification.getAnnualIncomeCurrencyCode());
			classificationData.put("txn_vol_month", classification.getTxnVolMonth());
			classificationData.put("txn_count_month", classification.getTxnCountMonth());
			classificationData.put("employer_name", classification.getEmployerName());
			classificationData.put("employer_address", classification.getEmployerAddress());
			classificationData.put("employer_phone", classification.getEmployerPhone());
			classificationData.put("profession_category", classification.getProfessionCategory());
			classificationData.put("reason_for_acc", classification.getReasonForAcc());
			classificationData.put("agent_ref_no", classification.getAgentRefNo());
			classificationData.put("first_language", classification.getFirstLanguage());
			classificationData.put("marital_status", classification.getMaritalStatus());

			// Mapping Profile Photo if exists
			if (classification.getProfilePhoto() != null) {
				Map<String, Object> profilePhotoData = new HashMap<>();
				profilePhotoData.put("base64_data", classification.getProfilePhoto().getBase64Data());
				profilePhotoData.put("content_type", classification.getProfilePhoto().getContentType());
				classificationData.put("profile_photo", profilePhotoData);
			}

			// Mapping Social Links
			List<Map<String, Object>> socialLinksData = new ArrayList<>();
			if (classification.getSocialLinks() != null) {

				for (SocialLink socialLink : classification.getSocialLinks()) {
					Map<String, Object> socialLinkData = new HashMap<>();
					socialLinkData.put("social_links_id", socialLink.getSocialLinksId());
					socialLinkData.put("text_field", socialLink.getTextField());
					socialLinksData.add(socialLinkData);
				}
			}
			classificationData.put("social_links", socialLinksData);

			customerData.put("customer_classification", classificationData);
		}

		Customer saveCustomer = new Customer();
		String status = new String();

		try {
			ResponseEntity<Map<String, Object>> response = customerCreationService.createCustomer(customerData);
			if (response.getStatusCode() == HttpStatus.OK) {

//                JSONObject jsonResponse = new JSONObject(response.getBody());
//                customer.setEcrn(jsonResponse.getString("ecrn"));
				Map<String, Object> responseBody = response.getBody();
				String ecrn = (String) responseBody.get("ecrn");
				if (ecrn != null) {
					customer.setEcrn(ecrn);
				}

				// Process the response and save to the database if necessary
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

		// Set the customer reference in CustomerClassification (if present)
//  if (savedCustomer.getCustomerClassification() != null) {
//            CustomerClassification classification = savedCustomer.getCustomerClassification();
//            classification.setCustomer(savedCustomer);
//
//            // Handle Social Links under CustomerClassification
//            if (classification.getSocialLinks() != null) {
//                for (SocialLink link : classification.getSocialLinks()) {
//                    link.setCustomerClassification(classification);
//                }
//            }
//        }
//
//
//        // Set customer reference in related Address entities
//        if (savedCustomer.getAddressList() != null) {
//            for (Address address : savedCustomer.getAddressList()) {
//                address.setCustomer(savedCustomer);
//            }
//        }
//
//
//
//        // Set customer reference in related Document entities
// if (savedCustomer.getAdditionalDocs() != null) {
//            for (Document doc : savedCustomer.getAdditionalDocs()) {
//                doc.setCustomer(savedCustomer);
//            }
//        }
//
//        // Set customer reference in related IdDetail entities
//        if (savedCustomer.getIdDetails() != null) {
//            for (IdDetail idDetail : savedCustomer.getIdDetails()) {
//                idDetail.setCustomer(savedCustomer);
//            }
//        }
//
//
//        // Save again to persist all relationships (optional optimization)
//        // Only needed if cascading is not configured correctly in your JPA annotations.
//        return customerRepository.save(savedCustomer);
	}

	public Optional<Customer> getByEcrn(String ecrn) {
		return Optional.ofNullable(customerRepository.findByEcrn(ecrn));
	}

	public List<Customer> searchByCriteria(String criteria, String query) {
		return switch (criteria) {
		case "Customer Number:" -> customerRepository.findByEcrnContaining(query);
		case "Mobile Number:" -> customerRepository.findByPrimaryMobileNumberContaining(query);
		case "Email Id:" -> customerRepository.findByEmailIdContaining(query);
		case "ID No:" -> customerRepository.findByIdDetails_IdNumberContaining(query);
		case "Customer Name:" -> customerRepository.findByFirstNameContainingOrLastNameContaining(query, query);
		default -> List.of(); // Empty list if no criteria matches
		};
	}

	public Page<Customer> getCustomers(Pageable pageable) {
		return customerRepository.findAll(pageable);
	}
}
