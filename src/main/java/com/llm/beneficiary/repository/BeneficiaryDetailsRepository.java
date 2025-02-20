package com.llm.beneficiary.repository;

import com.llm.beneficiary.model.entity.BeneficiaryDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BeneficiaryDetailsRepository extends JpaRepository<BeneficiaryDetails,Long> {

    List<BeneficiaryDetails> findByEcrn(String ecrn);

    Optional<BeneficiaryDetails> findByBeneficiaryAccountNo(String beneficiaryAccountNo);
}
