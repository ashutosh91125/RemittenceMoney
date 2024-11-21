package com.llm.Service;

import java.util.List;
import java.util.Optional;

import com.llm.model.Admin;
import com.llm.model.AdminWithoutProfile;
import com.llm.model.Customer;

public interface IAdminService {
	public String createAdmins(Admin admin);

	public Admin getByName(String adminName);

	public List<Admin> getAllAdmins();
	
	
	Optional<AdminWithoutProfile> findAdminByEmailAndPassword(String email, String password);


}
