package com.llm.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Data;

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

//    @JsonProperty("default_status")
	@Column(name = "default_status")
	private Boolean defaultStatus;

//    @JsonProperty("active_status")
	@Column(name = "active_status")
	private Boolean activeStatus;

//    @JsonProperty("id_front")
	@JsonManagedReference
	@OneToOne(mappedBy = "idDetail", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private IdFront idFront;

//    @JsonProperty("id_back")
	@JsonManagedReference
	@OneToOne(mappedBy = "idDetail", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private IdBack idBack;

	// Back Reference to Customer
	@JsonBackReference
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "customer_id", nullable = false) // Ensures this is mapped to the Customer table
	private Customer customer;
}
