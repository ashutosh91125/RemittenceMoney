package com.llm.staff.service.impl;

import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
import com.llm.staff.service.StaffDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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

    @Override
    public List<StaffDetails> getAllStaffByAgent(String agent) {
        return staffDetailsRepository.findByAgent(agent);
    }

    @Override
    public List<StaffDetails> getAllStaffByCountry(String county) {
        return staffDetailsRepository.findByCountry(county);
    }

    @Override
	public Optional<StaffDetails> getById(Long id) {
		return staffDetailsRepository.findById(id);
	}

}
