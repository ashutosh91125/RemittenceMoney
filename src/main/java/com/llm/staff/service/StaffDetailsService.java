package com.llm.staff.service;

import com.llm.staff.model.StaffDetails;

import java.util.List;
import java.util.Optional;

public interface StaffDetailsService {

    void createStaff(StaffDetails staffDetails);

    List<StaffDetails> getAllStaff();

	Optional<StaffDetails> getById(Long id);
}
