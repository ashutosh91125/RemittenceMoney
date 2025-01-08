package com.llm.staff.service;

import com.llm.staff.model.StaffDetails;

import java.util.List;
import java.util.Optional;

public interface StaffDetailsService {

    void createStaff(StaffDetails staffDetails);

    List<StaffDetails> getAllStaff();

    List<StaffDetails> getAllStaffByAgent(String agent);

    List<StaffDetails> getAllStaffByCountry(String county);

    Optional<StaffDetails> getById(Long id);

	void updateStaff(Long id, StaffDetails updatedDetails, String username);
}
