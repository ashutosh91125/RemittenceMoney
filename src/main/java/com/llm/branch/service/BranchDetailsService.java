package com.llm.branch.service;

import java.util.List;
import java.util.Optional;

import com.llm.UserIdentity.model.User;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.model.dto.BranchDTO;

public interface BranchDetailsService {

    void createBranch(BranchDetails branchDetails);

    List<BranchDetails> getAllBranches();

    List<BranchDetails> getAllBranchesByCountry(String country);

    List<BranchDTO> getAllBranchDTOByAgent(String agent);

    Optional<BranchDetails> getById(Long id);

	List<BranchDetails> getAllBranchesByAgent(String agent);

	boolean updateBranch(Long branchId, BranchDetails branchDetails, User user, String username);
}
