package com.llm.staff.repository;

import com.llm.staff.model.StaffDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StaffDetailsRepository extends JpaRepository<StaffDetails, Long> {

    Optional<StaffDetails> findByUsername(String username);
}
