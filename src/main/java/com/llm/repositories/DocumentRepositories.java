package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import com.llm.model.Document;
@Service
public interface DocumentRepositories extends JpaRepository<Document, Long> {

}
