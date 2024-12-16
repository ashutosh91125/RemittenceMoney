package com.llm.transfer.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.transfer.model.Transfer;

public interface TransferRepository extends JpaRepository<Transfer, Integer> {

}
