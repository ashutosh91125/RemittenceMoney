package com.llm.branch.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.llm.branch.model.dto.BranchDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.branch.model.BranchDetails;
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
    public List<BranchDTO> getAllBranchDTOByAgent(String agent) {
        // Fetch the list of BranchDetails from the repository
        List<BranchDetails> branchDetailsList = branchDetailsRepository.findByAgent(agent);

        // Map the list of BranchDetails to BranchDTO
        return branchDetailsList.stream()
                .map(branch -> {
                    BranchDTO branchDTO = new BranchDTO();
                    branchDTO.setAgent(branch.getAgent());
                    branchDTO.setBranchLocationId(branch.getBranchLocationId());
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

	

}
