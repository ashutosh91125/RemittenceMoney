package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.IncomeType;
import com.llm.repositories.IncomeTypeRepository;

@Service
public class IncomeTypeServiceImpl {
	@Autowired
	private IncomeTypeRepository incomeTypeRepository;

	public IncomeType getIncomeIncomeByType(Long incomeType) {
		return incomeTypeRepository.findByIncomeType(incomeType);
	}

	public List<IncomeType> getAllIncomeType() {
		return incomeTypeRepository.findAll();
	}

}
