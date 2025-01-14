package com.llm.staff.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.llm.staff.model.StaffDetails;
import com.llm.staff.projection.StaffDetailsProjection;

@Repository
public interface StaffDetailsRepository extends JpaRepository<StaffDetails, Long> {

    Optional<StaffDetails> findByUsername(String username);

    List<StaffDetails> findByAgent(String agent);

    List<StaffDetails> findByCountry(String county);
    
    List<StaffDetailsProjection> findAllProjectedBy();

    List<StaffDetailsProjection> findProjectionsByCountry(String country);

    List<StaffDetailsProjection> findProjectionsByAgent(String agent);

    boolean existsByAgentAndStaffGroup(String agent, String staffGroup);
}

