package com.llm.customer.model;

import com.llm.iddetail.model.IdDetail;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.llm.common.enums.Gender;

import java.util.List;

@Data
@Entity
@Table(name = "customer")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "channel", length = 20, nullable = false)
	private String channel;

	@Column(name = "agent_location_id", nullable = false)
	private String agentLocationId;

	@Column(name = "salutation", length = 3)
	private String salutation;

	@Column(name = "first_name", length = 100, nullable = false)
	private String firstName;

	@Column(name = "middle_name", length = 60)
	private String middleName;

	@Column(name = "last_name", length = 60, nullable = false)
	private String lastName;

	@Column(name = "preferred_name", length = 255)
	private String preferredName;

	@Column(name = "nationality", length = 2, nullable = false)
	private String nationality;

	@Column(name = "second_nationality", length = 2)
	private String secondNationality;

	@Column(name = "native_region")
	private Integer nativeRegion;

	@Column(name = "date_of_birth")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String dateOfBirth;

	@Column(name = "country_of_birth", length = 2, nullable = false)
	private String countryOfBirth;

	@Column(name = "place_of_birth", length = 40)
	private String placeOfBirth;

	@Column(name = "resident_type_id")
	private Long residentTypeId;

	@Column(name = "country_of_residence", length = 2, nullable = false)
	private String countryOfResidence;

	@Enumerated(EnumType.STRING)
	@Column(name = "gender", length = 12, nullable = false)
	private Gender gender;

	@Column(name = "mothers_maiden_name", length = 255)
	private String mothersMaidenName;

	@Column(name = "primary_mobile_number", length = 20, nullable = false, unique = true)
	private String primaryMobileNumber;

	@Column(name = "secondary_mobile_number", length = 20)
	private String secondaryMobileNumber;

	@Column(name = "email_id", length = 255, nullable = false, unique = true)
	private String emailId;

	@Column(name = "phone_number", length = 20)
	private String phoneNumber;

	@Column(name = "occupation_id")
	private Long occupationId;

	@Column(name = "political_exposed_person")
	private Boolean politicalExposedPerson;

	@Column(name = "updated_by", length = 50)
	private String updatedBy;

	@Column(name = "ecrn", length=16)
	private String ecrn;

	@Column(name = "address_type_id")
	private String addressTypeId;

	@Column(name = "building_name", length = 255)
	private String buildingName;

	@Column(name = "street_name", length = 255)
	private String streetName;

	@Column(name = "landmark", length = 255)
	private String landmark;

	@Column(name = "city", length = 60)
	private String city;

	@Column(name = "district", length = 255)
	private String district;

	@Column(name = "state", length = 255)
	private String state;

	@Column(name = "country", length = 3)
	private String country;

	@Column(name = "zip")
	private String zip;

	@Column(name = "po_box")
	private String poBox;

	@Column(name = "mobile_number", length = 20)
	private String mobileNumber;

	// Permanent Address
	@Column(name = "parAddressTypeId")
	private String parAddressTypeId;

	@Column(name = "parBuildingName", length = 255)
	private String parBuildingName;

	@Column(name = "parStreetName", length = 255)
	private String parStreetName;

	@Column(name = "parLandmark", length = 255)
	private String parLandmark;

	@Column(name = "parCity", length = 60)
	private String parCity;

	@Column(name = "parDistrict", length = 255)
	private String parDistrict;

	@Column(name = "parState", length = 255)
	private String parState;

	@Column(name = "parCountry", length = 3)
	private String parCountry;

	@Column(name = "parZip")
	private String parZip;

	@Column(name = "parPoBox")
	private String parPoBox;

	@Column(name = "parMobileNumber", length = 20)
	private String parMobileNumber;

	// Additional Document
	private String documentId;
	@Column(columnDefinition = "TEXT")
	private String docbase64Data;
	private String docContentType;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
	@JoinColumn(name = "customer_id")
	private List<IdDetail> idDetails;

//	@Lob
//	private byte[] frontBase64Data;
//	@Transient
//	private MultipartFile frontPictureFile;
//	private String frontContentType;
//
//	@Lob
//	private byte[] backBase64Data;
//	@Transient
//	private MultipartFile backPictureFile;
//	private String BackContentType;

	// classification
	@Column(name = "customerTypeId")
	private Integer customerTypeId;
	
	@Column(name = "annualIncomeRangeId")
	private Integer annualIncomeRangeId;
	
	@Column(name = "annualIncomeCurrencyCode", length = 30)
	private String annualIncomeCurrencyCode;
	
	@Column(name = "socialSecurityNumber", length = 30)
	private String socialSecurityNumber;
	
	@Column(name = "taxRegistrationNumber")
	private Long taxRegistrationNumber;
	
	@Column(name = "txnIssuedCountry", length = 2)
	private String txnIssuedCountry;
	
	@Column(name = "employerName", length = 30)
	private String employerName;
	
	@Column(name = "employerAddress", length = 30)
	private String employerAddress;
	
	@Column(name = "employerPhone", length = 20)
	private String employerPhone;
	
	@Column(name = "employerEstablishmentId", length = 30)
	private String employerEstablishmentId;
	
	@Column(name = "riskRatingId")
	private Integer riskRatingId;
	
	@Column(name = "pepCategory")
	private Integer pepCategory;
	
	@Column(name = "personalMohreId", length = 30)
	private String personalMohreId;
	
	@Column(name = "incomeType", length = 30)
	private Integer incomeType;
	
	@Column(name = "professionCategory", length = 30)
	private String professionCategory;
	
	@Column(name = "reasonForAcc", length = 30)
	private String reasonForAcc;
	
	@Column(name = "txnVolMonth", length = 30)
	private Integer txnVolMonth;
	
	@Column(name = "txnCountMonth", length = 30)
	private Integer txnCountMonth;
	
	@Column(name = "showRemarksOnTxn", length = 30)
	private Boolean showRemarksOnTxn;
	
	@Column(name = "customerRemarks", length = 30)
	private String customerRemarks;
	
	@Column(name = "agentRefNo", length = 30)
	private String agentRefNo;
	
	@Column(name = "firstLanguage", length = 30)
	private String firstLanguage;
	
	@Column(name = "maritalStatus", length = 30)
	private Integer maritalStatus;
	
	@Column(name = "dnfbp", length = 30)
	private Boolean dnfbp;
	
	@Column(name = "dpms", length = 30)
	private Boolean dpms;
	
	@Column(name = "profileCategory", length = 30)
	private Integer profileCategory;

	// SocialLink
	@Column(name = "socialLinksId", length = 30)
	private Integer socialLinksId;
	@Column(name = "textField", length = 30)
	private String textField;

	// Profile Photo
	@Transient
	private MultipartFile profPictureFile;
	@Lob
	@Basic(fetch = FetchType.EAGER)
	private byte[] profBase64Data;

	private String profContentType;

	private Boolean isValid;
	private String phoneCode;

	@Column(length = 20)
	private String customerStatus;

	@Column(length = 20)
	private String amlScanStatus;

	@Column(length = 20)
	private String idStatus;


}
