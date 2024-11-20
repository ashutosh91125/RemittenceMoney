package com.llm.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

import com.llm.model.Customer;
import com.llm.repositories.CustomerRepository;

import jakarta.transaction.Transactional;

@Service
public class CustomerService {

    private static final Logger looger = LoggerFactory.getLogger(CustomerService.class);

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerCreationService customerCreationService;

    @Transactional
    public String createCustomer(Customer customer) {
        customer.setChannel("WEB");
        customer.setAgentLocationId("Malaysia");
        //customer.setAgentLocationId("India");

        ZoneId mytZone = ZoneId.of("Asia/Kuala_Lumpur");


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
        customerData.put("primary_mobile_number", customer.getPrimaryMobileNumber());
        customerData.put("secondary_mobile_number", customer.getSecondaryMobileNumber());
        customerData.put("phone_number", customer.getPhoneNumber());
        customerData.put("email_id", customer.getEmailId());
        customerData.put("occupation_id", customer.getOccupationId());

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
            //for (Document doc : customer.getAdditionalDocs()) {
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
                customer.setIssuedOn((LocalDate.now()).toString());
                customer.setDateOfExpiry((LocalDate.now().plusYears(2)).toString());

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

				if (customer.getIssuedOn().isEmpty()) {
					customerData.put("issued_on", null);
				} else {
					customerData.put("issued_on", customer.getIssuedOn());
				}

				if (customer.getDateOfExpiry().isEmpty()) {
					customerData.put("date_of_expiry", null);
				} else {
					customerData.put("date_of_expiry", customer.getDateOfExpiry());
				}
//                idData.put("issued_on", "2024-11-19");
//                idData.put("date_of_expiry", "2026-11-19");

                idData.put("active_status", customer.getActiveStatus());

//				Map<String, Object> idFrontData = new HashMap<>();
//				idFrontData.put("base64_data", customer.getFrontBase64Data());
//				idFrontData.put("content_type", customer.getFrontContentType());
//				idData.put("id_front", idFrontData);
//
//
//				Map<String, Object> idBackData = new HashMap<>();
//				idBackData.put("base64_data", customer.getBackBase64Data());
//				idBackData.put("content_type", customer.getBackContentType());
//				idData.put("id_back", idBackData);
                looger.info("======customer.getResidentTypeId()===" + idData);
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
//			classificationData.put("employer_name", customer.getEmployerName());
//			classificationData.put("employer_address", customer.getEmployerAddress());
//			classificationData.put("employer_phone", customer.getEmployerPhone());
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

        looger.info(customerData.toString());
        try {
            ResponseEntity<Map<String, Object>> response = customerCreationService.createCustomer(customerData);
            Map<String, Object> responseBody = response.getBody();
            if (response.getStatusCode() == HttpStatus.OK) {

                Map<String, Object> dataMap = (Map<String, Object>) responseBody.get("data");
                if (dataMap != null) {
                    String ecrn = (String) dataMap.get("ecrn");
                    if (ecrn != null) {
                        customer.setEcrn(ecrn);
                    }
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
        Customer customer = customerRepository.findByEcrn(ecrn);

        if (customer.getDateOfBirth().isEmpty()) {
            customer.setDateOfBirth("");
        }

        // Ensure we don't go out of bounds if the string is shorter than 10 characters
        customer.setDateOfBirth(customer.getDateOfBirth().length() <= 10 ? customer.getDateOfBirth() : customer.getDateOfBirth().substring(0, 10));
        return Optional.of(customer);
    }

//	public List<Customer> searchByCriteria(String criteria, String query) {
//		return switch (criteria) {
//		case "Customer Number:" -> customerRepository.findByEcrnContaining(query);
//		case "Mobile Number:" -> customerRepository.findByPrimaryMobileNumberContaining(query);
//		case "Email Id:" -> customerRepository.findByEmailIdContaining(query);
//		case "ID No:" -> customerRepository.findByIdDetails_IdNumberContaining(query);
//		case "Customer Name:" -> customerRepository.findByFirstNameContainingOrLastNameContaining(query, query);
//		default -> List.of(); // Empty list if no criteria matches
//		};
//	}

    public Page<Customer> getCustomers(Pageable pageable) {
        return customerRepository.findAll(pageable);
    }

    public List<Customer> getAllCustomer() {
        return customerRepository.findAll();
    }
}
