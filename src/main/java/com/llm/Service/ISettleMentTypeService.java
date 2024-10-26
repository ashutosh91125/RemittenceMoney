package com.llm.Service;

import java.util.List;

import com.llm.model.SettelementType;

public interface ISettleMentTypeService {
	public List<SettelementType> fetchAllSettleMentsType();

	public SettelementType findBySettleMentsId(Integer SettelementId);

}
