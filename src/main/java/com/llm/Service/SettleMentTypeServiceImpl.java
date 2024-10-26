package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.SettelementType;
import com.llm.repositories.SettleMentTypeRepositories;

@Service
public class SettleMentTypeServiceImpl implements ISettleMentTypeService {
	@Autowired
	private SettleMentTypeRepositories settleMentTypeRepositories;

	@Override
	public List<SettelementType> fetchAllSettleMentsType() {
		return settleMentTypeRepositories.findAll();
	}

	@Override
	public SettelementType findBySettleMentsId(Integer SettelementId) {
		return settleMentTypeRepositories.findById(SettelementId)
				.orElseThrow(() -> new IllegalArgumentException("SettelementId not found"));
	}

}
