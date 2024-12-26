package com.llm.staff.repository;

import com.llm.staff.model.StaffDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StaffDetailsRepository extends JpaRepository<StaffDetails, Long> {
}
