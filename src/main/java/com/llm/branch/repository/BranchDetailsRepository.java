package com.llm.branch.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.llm.agent.projection.AgentProjection;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.projection.BranchProjection;

@Repository
public interface BranchDetailsRepository extends JpaRepository<BranchDetails, Long> {
    
    List<BranchDetails> findByAgent(String agent);

    List<BranchDetails> findByCounty(String country);

    List<BranchProjection> findProjectionsByCounty(String country);

    List<BranchProjection> findProjectionsByAgent(String agent);
    
    List<BranchDetails> findByBranchLocationId(String branchLocationId);

    List<BranchDetails> findByBranchLocationIdAndStatus(String branchLocationId,boolean status);
    
    List<BranchProjection> findAllProjectedBy();

    boolean existsByOutletCode(String outletCode);

    long countByCounty(String country);

    Object countByBranchLocationId(String branchLocationId);

    List<BranchDetails> findByIdIn(List<Long> ids);
}

