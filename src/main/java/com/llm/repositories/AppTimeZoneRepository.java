package com.llm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.llm.model.AppTimeZone;

public interface AppTimeZoneRepository extends JpaRepository<AppTimeZone , Integer> {
	public AppTimeZone findByZone(String zone);

}
