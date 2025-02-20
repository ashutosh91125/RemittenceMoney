package com.llm.iddetail.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.iddetail.model.IdDetail;
import com.llm.iddetail.repository.IdDetailRepository;

import jakarta.transaction.Transactional;

@Service
public class IdDetailsService {
	@Autowired
	private IdDetailRepository idDetailRepository;

	public IdDetail getIdDetailsById(Long id) {
		return idDetailRepository.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("Id Details not found found by if" + id));
	}

	public Optional<IdDetail> getById(Long id) {
		return idDetailRepository.findById(id);
	}
	@Transactional
	public IdDetail getByIdNumber(String idNumber) {
		return idDetailRepository.findByIdNumber(idNumber);
	}

	public boolean verifyIdNumber(String idNumber) {
		return idDetailRepository.existsByIdNumber(idNumber);
	}

	public void saveIdDetails(IdDetail idDetail) {
		idDetailRepository.save(idDetail);
		
	}
}