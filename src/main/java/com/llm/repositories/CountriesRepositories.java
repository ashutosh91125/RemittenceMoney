package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.Country;

public interface CountriesRepositories extends JpaRepository<Country, Integer> {
	

}
