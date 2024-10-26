package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.WorkingHours;

public interface WorkingHoursRepository extends JpaRepository<WorkingHours, Long> {

}
