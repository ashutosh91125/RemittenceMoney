package com.llm.beneficiary.repository;

import com.llm.beneficiary.model.BeneficiaryDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BeneficiaryDetailsRepository extends JpaRepository<BeneficiaryDetails,Long> {

    List<BeneficiaryDetails> findByEcrn(String ecrn);
}
