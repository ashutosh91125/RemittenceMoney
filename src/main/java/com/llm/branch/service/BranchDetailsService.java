package com.llm.branch.service;

import java.util.List;
import java.util.Optional;

import com.llm.UserIdentity.model.User;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.model.dto.BranchDTO;
import com.llm.branch.projection.BranchProjection;

public interface BranchDetailsService {

    void createBranch(BranchDetails branchDetails);

    List<BranchDetails> getAllBranches();

    List<BranchDetails> getAllBranchesByBranchLocationId(String branchLocationId);

    List<BranchDetails> getAllBranchesByCountry(String country);

    List<BranchProjection> getAllBranchesProjectionByCountry(String country);

    List<BranchProjection> getAllBranchesProjectionByAgent(String agent);

    List<BranchDTO> getAllBranchDTOByBranchLocationId(String branchLocationId, boolean status);

    Optional<BranchDetails> getById(Long id);

	List<BranchDetails> getAllBranchesByAgent(String agent);

	boolean updateBranch(Long branchId, BranchDetails branchDetails, User user, String username);


	List<BranchProjection> getBranchByProjection();
}
