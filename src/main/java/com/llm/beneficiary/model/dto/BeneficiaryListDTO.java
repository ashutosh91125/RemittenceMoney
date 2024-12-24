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
    
    public BeneficiaryListDTO(String ecrn, String fullName, String beneficiaryAccountNo, String beneficiaryBank) {
        this.ecrn = ecrn;
        this.fullName = fullName;
        this.beneficiaryAccountNo = beneficiaryAccountNo;
        this.beneficiaryBank = beneficiaryBank;
    }    
    
}
