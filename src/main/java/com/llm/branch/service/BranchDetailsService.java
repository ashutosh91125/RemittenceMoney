package com.llm.branch.service;

import java.util.List;
import java.util.Optional;

import com.llm.branch.model.BranchDetails;
import com.llm.branch.projection.BranchProjection;

public interface BranchDetailsService {

    void createBranch(BranchDetails branchDetails);

    List<BranchDetails> getAllBranches();

    List<BranchProjection> getAllBranchesByProjection();
    
    Optional<BranchDetails> getById(Long id);
}
