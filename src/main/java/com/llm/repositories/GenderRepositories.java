package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.Gender;

public interface GenderRepositories extends JpaRepository<Gender, Integer> {

}
