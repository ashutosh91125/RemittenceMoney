package com.llm.raas.repository;

import com.llm.raas.model.Branch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BranchRepository extends JpaRepository<Branch, String> {

    boolean existsByBankIdAndBranchId(String bankId, String branchId);

    List<Branch> findByBankId(String bankId);


    Branch findByRoutingCode(String routingCode);
}
