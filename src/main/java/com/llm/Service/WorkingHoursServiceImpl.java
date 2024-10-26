package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.WorkingHours;
import com.llm.repositories.WorkingHoursRepository;

@Service
public class WorkingHoursServiceImpl implements IWorkingHoursService {
	@Autowired
	private WorkingHoursRepository workingHoursRepository;

	@Override
	public List<WorkingHours> getAllWorkingHours() {
		return workingHoursRepository.findAll();
	}

	@Override
	public WorkingHours findByWorkingHoursId(Long id) {
		return workingHoursRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("id not found" + id));
	}

}
