package com.llm.staff.service;

import com.llm.staff.model.StaffDetails;

import java.util.List;

public interface StaffDetailsService {

    void createStaff(StaffDetails staffDetails);

    List<StaffDetails> getAllStaff();
}
