package com.llm.branch.repository;

import com.llm.branch.model.BranchDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BranchDetailsRepository extends JpaRepository<BranchDetails, Long> {
}
