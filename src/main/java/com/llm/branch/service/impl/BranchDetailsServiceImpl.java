package com.llm.branch.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.branch.model.BranchDetails;
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
    public List<BranchProjection> getAllBranchesByProjection() {
        return branchDetailsRepository.findAllProjectedBy();
    }

    @Override
    public Optional<BranchDetails> getById(Long id) {
        return branchDetailsRepository.findById(id);
    }

	

}
