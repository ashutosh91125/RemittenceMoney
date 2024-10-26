package com.llm.Service;

import java.util.List;

import com.llm.model.AppTimeZone;

public interface IAppTimeZoneService {
	public List<AppTimeZone> getAllTimeZones();
	public AppTimeZone findByZoneID(Integer timeZoneId); 
	public AppTimeZone findByZone(String zoneType);

}
