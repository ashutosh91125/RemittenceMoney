package com.llm.iddetail.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class IdDetailDto {
	
	private Long id;

	private Integer idType;

	private String idNumber;
	
	private String issuedBy;
	
	private String issuedOn;
	
	private String dateOfExpiry;
	
	private String issuedCountry;
	
	private String visaNumber;

	private String visaExpiryDate;

	private String visaType;
	
	private Boolean activeStatus;

	


}
