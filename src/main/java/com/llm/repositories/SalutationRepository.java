package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.Salutation;

public interface SalutationRepository extends JpaRepository<Salutation, Integer> {

}
