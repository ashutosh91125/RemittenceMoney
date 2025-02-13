package com.llm.fundRequst.repository;


import com.llm.fundRequst.model.DepositRequest;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepositRequestRepository extends JpaRepository<DepositRequest, Long> {
    boolean existsByReferenceNumber(Long referenceNumber);
}

