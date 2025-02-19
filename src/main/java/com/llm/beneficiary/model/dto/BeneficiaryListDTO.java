package com.llm.beneficiary.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BeneficiaryListDTO {

   
	private Long id;
    private String ecrn;
    private String fullName;
    private String beneficiaryAccountNo;
    private String beneficiaryBank;
    private Boolean status;
    private String beneficiaryDeliveryOption;
	private String payOutCountry;
	private String currencies;
    
   
    
    
}
