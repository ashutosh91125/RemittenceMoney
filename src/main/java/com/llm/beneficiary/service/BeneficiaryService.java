package com.llm.beneficiary.service;

import com.llm.beneficiary.model.dto.BeneficiaryListDTO;
import com.llm.beneficiary.model.entity.BeneficiaryDetails;

import java.util.List;


public interface BeneficiaryService {

    BeneficiaryDetails saveBeneficiary(BeneficiaryDetails beneficiaryDetails);

    BeneficiaryDetails getBeneficiaryById(Long id);

    List<BeneficiaryDetails> getBeneficiariesByEcrn(String ecrn);

    List<BeneficiaryListDTO> getBeneficiaryListByEcrn(String ecrn);

    List<BeneficiaryDetails> getAllBeneficiaries();

    BeneficiaryDetails updateBeneficiary(Long id, BeneficiaryDetails beneficiaryDetails);

    void deleteBeneficiary(Long id);

	BeneficiaryDetails getById(Long id);
}
