package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.Currency;

public interface CurrencyRepository  extends JpaRepository<Currency, Integer>{

}
