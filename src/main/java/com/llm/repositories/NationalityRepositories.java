package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.Nationality;

public interface NationalityRepositories extends JpaRepository<Nationality, Integer> {

}
