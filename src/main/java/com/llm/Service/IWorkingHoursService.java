package com.llm.Service;

import java.util.List;

import com.llm.model.WorkingHours;

public interface IWorkingHoursService {
	public List<WorkingHours> getAllWorkingHours();
	public WorkingHours findByWorkingHoursId(Long id);
}
