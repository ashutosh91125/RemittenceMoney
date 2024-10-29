package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Salutation;
import com.llm.repositories.SalutationRepository;

@Service
public class SalutationServiceImpl {
	@Autowired
	private SalutationRepository salutationRepository;

	public List<Salutation> findAllRecords() {
		return salutationRepository.findAll();
	}

}
