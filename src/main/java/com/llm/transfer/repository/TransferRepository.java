package com.llm.transfer.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.transfer.model.Transfer;

public interface TransferRepository extends JpaRepository<Transfer, Long> {
	
	Optional<Transfer> findTransactionByTransactionReferenceNumber(String transactionReferenceNumber);

}
