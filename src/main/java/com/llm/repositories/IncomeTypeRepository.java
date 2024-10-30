package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.IncomeType;

public interface IncomeTypeRepository extends JpaRepository<IncomeType, Integer> {
	IncomeType findByIncomeType(Long incomeType);

}
