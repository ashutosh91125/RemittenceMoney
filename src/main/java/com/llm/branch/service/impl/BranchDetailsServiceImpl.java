package com.llm.branch.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.llm.UserIdentity.repository.UserRepository;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.UserIdentity.model.User;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.model.dto.BranchDTO;
import com.llm.branch.projection.BranchProjection;
import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.branch.service.BranchDetailsService;

@Service
public class BranchDetailsServiceImpl implements BranchDetailsService {

    @Autowired
    private BranchDetailsRepository branchDetailsRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private StaffDetailsRepository staffDetailsRepository;

    @Override
    public void createBranch(BranchDetails branchDetails) {
        branchDetailsRepository.save(branchDetails);
    }

    @Override
    public List<BranchDetails> getAllBranches(){
        return branchDetailsRepository.findAll();
    }
    
    @Override
    public List<BranchDetails> getAllBranchesByAgent(String agent){
        return branchDetailsRepository.findByAgent(agent);
    }

    @Override
    public List<BranchDetails> getAllBranchesByBranchLocationId(String branchLocationId){
        return branchDetailsRepository.findByBranchLocationId(branchLocationId);
    }

    @Override
    public List<BranchDetails> getAllBranchesByCountry(String country){
        return branchDetailsRepository.findByCounty(country);
    }

    @Override
    public List<BranchProjection> getAllBranchesProjectionByCountry(String country) {
        return branchDetailsRepository.findProjectionsByCounty(country);
    }

    @Override
    public List<BranchProjection> getAllBranchesProjectionByAgent(String agent) {
        return branchDetailsRepository.findProjectionsByAgent(agent);
    }

    @Override
    public List<BranchDTO> getAllBranchDTOByBranchLocationId(String branchLocationId, boolean status) {
        List<BranchDetails> branchDetailsList = branchDetailsRepository.findByBranchLocationIdAndStatus(branchLocationId, status);

        return branchDetailsList.stream()
                .map(branch -> {
                    BranchDTO branchDTO = new BranchDTO();
                    branchDTO.setAgent(branch.getAgent());
                    branchDTO.setId(branch.getId());
                    branchDTO.setBranchName(branch.getBranchName());
                    return branchDTO;
                })
                .collect(Collectors.toList());
    }

    @Override
    public Optional<BranchDetails> getById(Long id) {
        return branchDetailsRepository.findById(id);
    }
    
    @Override
    public boolean updateBranch(Long branchId, BranchDetails branchDetails, User user, String username) {
       
        Optional<BranchDetails> existingBranch = branchDetailsRepository.findById(branchId);
        if (!existingBranch.isPresent()) {
            return false; 
        }
        BranchDetails branch = existingBranch.get();

        branch.setBranchName(branchDetails.getBranchName());
        branch.setAddress1(branchDetails.getAddress1());
        branch.setCounty(user.getCountry()); 
        branch.setModifiedBy(username);
        branch.setModifiedOn(LocalDateTime.now());
        branch.setAddress2(branchDetails.getAddress2());
        branch.setAddress3(branchDetails.getAddress3());
        branch.setAgent(branchDetails.getAgent());
        branch.setCdpChannel(branchDetails.getCdpChannel());
        branch.setRaasChannel(branchDetails.getRaasChannel());
        branch.setBranchChannelId(branchDetails.getBranchChannelId());
        branch.setBranchDisplayName(branchDetails.getBranchDisplayName());
        branch.setBranchMode(branchDetails.getBranchMode());
        branch.setBranchStaffRole(branchDetails.getBranchMode());
        branch.setBranchType(branchDetails.getBranchType());
        branch.setCity(branchDetails.getCity());
        branch.setContactPerson(branchDetails.getContactPerson());
        branch.setEmail(branchDetails.getEmail());
        branch.setLicenceNo(branchDetails.getLicenceNo());
        branch.setMisEmailId(branch.getMisEmailId());
        branch.setMobile(branchDetails.getMobile());
        branch.setPhone(branchDetails.getPhone());
        branch.setRemarks(branchDetails.getRemarks());
        branch.setOutletCode(branchDetails.getOutletCode());
        branch.setState(branchDetails.getState());
        branch.setStatus(branchDetails.isStatus());
        branch.setWorkingHours(branchDetails.getWorkingHours());
        branch.setZip(branchDetails.getZip());
        if (!branchDetails.isStatus()){
            branch.setStatus(false);
        	branch.setDisabledBy(username);
	    	branch.setDisabledOn(LocalDateTime.now());
            List<StaffDetails> staffs = staffDetailsRepository.findByBranchLocationId(branch.getBranchLocationId());

            for (StaffDetails staffDetail : staffs){
                staffDetail.setStatus(false);
                staffDetail.setDisabledOn(LocalDateTime.now());
                staffDetail.setDisabledBy(username);

                staffDetailsRepository.save(staffDetail);
                Optional<User> byUsername = userRepository.findByUsername(staffDetail.getUsername());
                byUsername.get().setApproved(false);
                userRepository.save(byUsername.get());
            }


        } else {
            branch.setStatus(true);
            branch.setDisabledBy("");
            branch.setDisabledOn(null);
        }
        branch.setDisabledBy(username);
        branch.setDisabledOn(LocalDateTime.now());
        branchDetailsRepository.save(branch);

        return true; 
    }

	@Override
	public List<BranchProjection> getBranchByProjection() {
		return branchDetailsRepository.findAllProjectedBy();
	}

}
