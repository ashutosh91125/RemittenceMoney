package com.llm.beneficiary.service;

import com.llm.beneficiary.model.BeneficiaryDetails;

import java.util.List;


public interface BeneficiaryService {

    public BeneficiaryDetails saveBeneficiary(BeneficiaryDetails beneficiaryDetails);

    public BeneficiaryDetails getBeneficiaryById(Long id);

    public List<BeneficiaryDetails> getBeneficiariesByEcrn(String ecrn);

    public List<BeneficiaryDetails> getAllBeneficiaries();

    public BeneficiaryDetails updateBeneficiary(Long id, BeneficiaryDetails beneficiaryDetails);

    public void deleteBeneficiary(Long id);
}
