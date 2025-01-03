package com.llm.branch.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.llm.branch.model.BranchDetails;
import com.llm.branch.projection.BranchProjection;

@Repository
public interface BranchDetailsRepository extends JpaRepository<BranchDetails, Long> {
    
    List<BranchDetails> findByAgent(String agent);

    List<BranchDetails> findByCounty(String country);
}

