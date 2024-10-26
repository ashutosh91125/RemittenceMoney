package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.SettlementMode;
import com.llm.repositories.SettelMentModeRepositories;

@Service
public class SettleMentModeServiceImpl implements ISetteleMentModeService {
	@Autowired
	private SettelMentModeRepositories settelMentModeRepositories;

	@Override
	public List<SettlementMode> fetchSettlementMode() {
		return settelMentModeRepositories.findAll();
	}

	@Override
	public SettlementMode findBysettelementIdId(Integer settelementId) {
		return settelMentModeRepositories.findById(settelementId)
				.orElseThrow(() -> new IllegalArgumentException("settelementId not found"));
	}

}
