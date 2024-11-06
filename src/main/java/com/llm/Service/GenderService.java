package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Gender;
import com.llm.repositories.GenderRepositories;

@Service
public class GenderService {
	@Autowired
	private GenderRepositories genderRepositories;

	public List<Gender> getGender() {
		return genderRepositories.findAll();
	}

}
