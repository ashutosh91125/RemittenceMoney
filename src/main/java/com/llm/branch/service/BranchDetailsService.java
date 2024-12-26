package com.llm.branch.service;

import com.llm.branch.model.BranchDetails;

import java.util.List;

public interface BranchDetailsService {

    void createBranch(BranchDetails branchDetails);

    List<BranchDetails> getAllBranches();
}
