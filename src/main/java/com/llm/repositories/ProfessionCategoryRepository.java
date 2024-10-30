package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.ProfessionCategory;

public interface ProfessionCategoryRepository extends JpaRepository<ProfessionCategory, Integer> {

	ProfessionCategory findById(String id);
}
