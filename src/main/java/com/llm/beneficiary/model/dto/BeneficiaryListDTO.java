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
}
