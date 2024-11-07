package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.CustomerClassification;

public interface CustomerClassificationRepositories extends JpaRepository<CustomerClassification, Long> {

}
