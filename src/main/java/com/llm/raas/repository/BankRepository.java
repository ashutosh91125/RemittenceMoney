package com.llm.raas.repository;

import com.llm.raas.model.Bank;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BankRepository extends JpaRepository<Bank, String> {

    List<Bank> findByCountryCode(String countryCode);
}

