package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.IdTypes;
import com.llm.repositories.IdTypesRepositories;

@Service
public class IdTypesService {
	@Autowired
	private IdTypesRepositories idTypesRepositories;

	public List<IdTypes> getAllIdTypes() {
		return idTypesRepositories.findAll();
	}

}
