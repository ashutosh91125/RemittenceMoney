package com.llm.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Document;
import com.llm.repositories.DocumentRepositories;

@Service
public class DocumentService {
	@Autowired
	private DocumentRepositories documentRepositories;

	public Document getDocumentById(Long id) {
		return documentRepositories.findById(id)
				.orElseThrow(() -> new IllegalArgumentException("document not found By id" + id));

	}

}
