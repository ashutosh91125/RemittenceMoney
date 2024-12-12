package com.llm.raas.repository;

import com.llm.raas.model.Branch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BranchRepository extends JpaRepository<Branch, String> {

    boolean existsByBankIdAndBranchId(String bankId, String branchId);
}
