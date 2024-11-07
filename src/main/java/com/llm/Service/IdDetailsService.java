package com.llm.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.IdDetail;
import com.llm.repositories.IdDetailRepository;

@Service
public class IdDetailsService {
	@Autowired
	private IdDetailRepository idDetailRepository;

	public IdDetail getIdDetailsById(Long id) {
		return idDetailRepository.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Id Details not found found by if" + id));
	}
}
