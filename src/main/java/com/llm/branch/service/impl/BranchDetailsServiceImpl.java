package com.llm.branch.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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
    public List<BranchDTO> getAllBranchDTOByAgent(String agent) {
        // Fetch the list of BranchDetails from the repository
        List<BranchDetails> branchDetailsList = branchDetailsRepository.findByAgent(agent);

        // Map the list of BranchDetails to BranchDTO
        return branchDetailsList.stream()
                .map(branch -> {
                    BranchDTO branchDTO = new BranchDTO();
                    branchDTO.setAgent(branch.getAgent());
                    branchDTO.setId(branch.getId());
                    branchDTO.setBranchName(branch.getBranchName());
                    // Set other fields from BranchDetails to BranchDTO
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
        branch.setBranchLocationId(branchDetails.getBranchLocationId());
        branch.setBranchMode(branchDetails.getBranchMode());
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
