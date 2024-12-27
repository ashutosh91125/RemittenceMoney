package com.llm.staff.service.impl;

import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
import com.llm.staff.service.StaffDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffDetailsServiceImpl implements StaffDetailsService {

    @Autowired
    private StaffDetailsRepository staffDetailsRepository;

    @Override
    public void createStaff(StaffDetails staffDetails) {
        staffDetailsRepository.save(staffDetails);
    }

    @Override
    public List<StaffDetails> getAllStaff() {
        return staffDetailsRepository.findAll();
    }

}
