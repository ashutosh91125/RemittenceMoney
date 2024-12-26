package com.llm.staff.service.impl;

import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
import com.llm.staff.service.StaffDetailsService;
import org.springframework.stereotype.Service;

@Service
public class StaffDetailsServiceImpl implements StaffDetailsService {

    private StaffDetailsRepository staffDetailsRepository;

    @Override
    public void createStaff(StaffDetails staffDetails) {
        staffDetailsRepository.save(staffDetails);
    }
}
