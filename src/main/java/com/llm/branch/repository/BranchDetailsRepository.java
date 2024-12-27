package com.llm.branch.repository;

import com.llm.agent.projection.AgentProjection;
import com.llm.branch.model.BranchDetails;
import com.llm.branch.projection.BranchProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BranchDetailsRepository extends JpaRepository<BranchDetails, Long> {
    List<BranchProjection> findAllProjectedBy();
}
