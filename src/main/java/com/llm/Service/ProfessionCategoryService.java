package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.ProfessionCategory;
import com.llm.repositories.ProfessionCategoryRepository;

@Service
public class ProfessionCategoryService {
	@Autowired
	private ProfessionCategoryRepository professionCategoryRepository;

	public List<ProfessionCategory> getAllProfessionCategory() {
		return professionCategoryRepository.findAll();
	}

	public ProfessionCategory getProfessionCategoryById(String id) {
		return professionCategoryRepository.findById(id);
	}

}
