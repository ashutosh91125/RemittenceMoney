package com.llm.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.CustomerClassification;
import com.llm.repositories.CustomerClassificationRepositories;

@Service
public class CustomerClassificationService {
	@Autowired
	private CustomerClassificationRepositories customerClassificationRepositories;

	public CustomerClassification getCustomerClassificationById(Long id) {
		return customerClassificationRepositories.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("CustomerClassification not found by given id" + id));
	}

}
