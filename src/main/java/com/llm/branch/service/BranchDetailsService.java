package com.llm.branch.service;

import com.llm.branch.model.BranchDetails;
import com.llm.branch.projection.BranchProjection;

import java.util.List;

public interface BranchDetailsService {

    void createBranch(BranchDetails branchDetails);

    List<BranchDetails> getAllBranches();

    List<BranchProjection> getAllBranchesByProjection();
}
