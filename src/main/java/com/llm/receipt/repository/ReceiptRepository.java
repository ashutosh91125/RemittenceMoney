package com.llm.receipt.repository;

import com.llm.receipt.model.Receipt;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ReceiptRepository extends JpaRepository<Receipt, Long> {

    Receipt findByTransactionRefNumber(String transactionRefNumber);

    boolean existsByTransactionRefNumber(String transactionRefNumber);
}
