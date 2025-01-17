package com.llm.transfer.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.transfer.model.Transfer;

import java.util.List;

public interface TransferRepository extends JpaRepository<Transfer, Long> {

	Optional<Transfer> findTransactionByTransactionReferenceNumber(String transactionReferenceNumber);

    List<Transfer> findByUsername(String username);

    List<Transfer> findByStaffCountry(String staffCountry);

    List<Transfer> findByBranchLocationId(String agentId);
}
