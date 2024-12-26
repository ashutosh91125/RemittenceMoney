package com.llm.branch.service.impl;

import com.llm.branch.model.BranchDetails;
import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.branch.service.BranchDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
