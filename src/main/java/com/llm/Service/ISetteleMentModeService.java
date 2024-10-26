package com.llm.Service;

import java.util.List;

import com.llm.model.SettlementMode;

public interface ISetteleMentModeService {
	public List<SettlementMode> fetchSettlementMode();

	public SettlementMode findBysettelementIdId(Integer settelementId);

}
