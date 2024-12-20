package com.llm.beneficiary.service.impl;

import com.llm.beneficiary.model.BeneficiaryDetails;
import com.llm.beneficiary.repository.BeneficiaryDetailsRepository;
import com.llm.beneficiary.service.BeneficiaryService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BeneficiaryServiceImpl implements BeneficiaryService {
    @Autowired
    private final BeneficiaryDetailsRepository beneficiaryRepository;

    public BeneficiaryDetails saveBeneficiary(BeneficiaryDetails beneficiaryDetails) {
        return beneficiaryRepository.save(beneficiaryDetails);
    }

    public BeneficiaryDetails getBeneficiaryById(Long id) {
        return beneficiaryRepository.findById(id).orElseThrow(() -> new RuntimeException("Beneficiary not found with ID: " + id));
    }

    public List<BeneficiaryDetails> getBeneficiariesByEcrn(String ecrn) {
        return beneficiaryRepository.findByEcrn(ecrn);
    }

    public List<BeneficiaryDetails> getAllBeneficiaries() {
        return beneficiaryRepository.findAll();
    }

    public BeneficiaryDetails updateBeneficiary(Long id, BeneficiaryDetails beneficiaryDetails) {
        BeneficiaryDetails existingBeneficiary = getBeneficiaryById(id);
        beneficiaryDetails.setId(existingBeneficiary.getId());
        return beneficiaryRepository.save(beneficiaryDetails);
    }

    public void deleteBeneficiary(Long id) {
        BeneficiaryDetails existingBeneficiary = getBeneficiaryById(id);
        beneficiaryRepository.delete(existingBeneficiary);
    }

}
