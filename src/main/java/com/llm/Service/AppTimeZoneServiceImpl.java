package com.llm.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.AppTimeZone;
import com.llm.repositories.AppTimeZoneRepository;

@Service
public class AppTimeZoneServiceImpl implements IAppTimeZoneService {
	@Autowired
	private AppTimeZoneRepository timeZoneRepository;

	@Override
	public List<AppTimeZone> getAllTimeZones() {
		return timeZoneRepository.findAll();
	}

	@Override
	public AppTimeZone findByZoneID(Integer timeZoneId) {
		return timeZoneRepository.findById(timeZoneId)
				.orElseThrow(() -> new IllegalArgumentException("zone not available: " + timeZoneId));
	}

	@Override
	public AppTimeZone findByZone(String zoneType) {
		return timeZoneRepository.findByZone(zoneType);
	}
}
