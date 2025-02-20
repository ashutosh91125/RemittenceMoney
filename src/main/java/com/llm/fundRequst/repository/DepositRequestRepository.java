package com.llm.fundRequst.repository;


import com.llm.fundRequst.model.DepositRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DepositRequestRepository extends JpaRepository<DepositRequest, Long> {
    boolean existsByReferenceNumber(String referenceNumber);

    List<DepositRequest> findByCreatedByUsername(String createdByUsername);
}

