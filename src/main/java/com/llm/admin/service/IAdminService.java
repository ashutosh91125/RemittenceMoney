package com.llm.admin.service;

import java.util.List;
import java.util.Optional;

import com.llm.admin.model.Admin;
import com.llm.model.AdminWithoutProfile;

public interface IAdminService {

	public Admin addAdmins(Admin admin);

	public Admin getByName(String adminName);

	public List<Admin> getAllAdmins();
	
	
	Optional<AdminWithoutProfile> findAdminByEmailAndPassword(String email, String password);


}
