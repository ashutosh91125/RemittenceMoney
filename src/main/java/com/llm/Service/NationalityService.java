package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Nationality;
import com.llm.repositories.NationalityRepositories;

@Service
public class NationalityService {
	@Autowired
	private NationalityRepositories nationalityRepositories;

	public List<Nationality> getAllNationality() {
		return nationalityRepositories.findAll();
	}

}
