package com.llm.iddetail.model;

import jakarta.persistence.*;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "id_detail")
@Data
public class IdDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

//    @JsonProperty("id_type")
	@Column(name = "id_type")
	private Integer idType;

//    @JsonProperty("id_number")
	@Column(name = "id_number")
	private String idNumber;

//    @JsonProperty("visa_number")
	@Column(name = "visa_number")
	private String visaNumber;

//    @JsonProperty("visa_expiry_date")
	@Column(name = "visa_expiry_date")
	private String visaExpiryDate;

//    @JsonProperty("name_as_per_id")
	@Column(name = "name_as_per_id", length = 255)
	private String nameAsPerId;

//    @JsonProperty("issued_country")
	@Column(name = "issued_country", length = 2)
	private String issuedCountry;

//    @JsonProperty("issued_by")
	@Column(name = "issued_by", length = 255)
	private String issuedBy;

//    @JsonProperty("issued_at")
	@Column(name = "issued_at", length = 255)
	private String issuedAt;

//    @JsonProperty("issued_on")
	@Column(name = "issued_on")
	private String issuedOn;

//    @JsonProperty("date_of_expiry")
	@Column(name = "date_of_expiry")
	private String dateOfExpiry;


	@Column(name = "default_status")
	private Boolean defaultStatus;


	@Column(name = "active_status")
	private Boolean activeStatus;

	@Column(name = "visaType")
	private String visaType;
	@Lob
	@Basic(fetch = FetchType.EAGER)
	private byte[] frontBase64Data;
	@Transient
	private MultipartFile frontPictureFile;
	private String frontContentType;

	@Lob
	@Basic(fetch = FetchType.EAGER)
	private byte[] backBase64Data;
	@Transient
	private MultipartFile backPictureFile;
	private String BackContentType;
	@Column(name="customer_id")
	private Long customerId;


}
