package com.llm.admin.serviceimpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.admin.repositories.AdminRepositories;
import com.llm.admin.service.IAdminService;
import com.llm.model.Admin;
import com.llm.model.AdminWithoutProfile;

@Service
public class AdminServiceImpl implements IAdminService {
	@Autowired
	private AdminRepositories adminRepositories;

	@Override
	public Admin addAdmins(Admin admin) {
		return adminRepositories.save(admin);
	}

	@Override
	public List<Admin> getAllAdmins() {
		return adminRepositories.findAll();
	}

	@Override
	public Admin getByName(String adminName) {

		return adminRepositories.findByAdminName(adminName);
	}

//	@Override
//	public Admin getAdminEmailPassword(String email, String password) {
//
//		return adminRepositories.findAdminByEmailAndPassword(email, password);
//	}

//	@Override
//	public AdminDto findAdminByEmailAndPassword(String email, String password) {
//		Admin admin = adminRepositories.findAdminByEmailAndPassword(email, password);
//		if (admin != null) {
//			return new AdminDto(admin.getAdminId(), admin.getEmail(), admin.getPassword());
//		}
//		return null;
//	}

//	@Override
//	public AdminDto findAdminByEmailAndPassword(String email, String password) {
//		Optional<Admin> adminOptional = adminRepositories.findAdminForLogin(email, password);
//
//		if (adminOptional.isPresent()) {
//			Admin admin = adminOptional.get();
//			// Assuming you have a method to convert Admin to AdminDto
//			return convertToAdminDto(admin);
//		} else {
//			return null;
//		}
//	}

//	private AdminDto convertToAdminDto(Admin admin) {
//		AdminDto adminDto = new AdminDto();
//
//		adminDto.setAdminName(admin.getAdminName());
//		adminDto.setConfirmPassword(admin.getConfirmPassword());
//		adminDto.setPassword(admin.getPassword());
//		adminDto.setEmail(admin.getEmail());
//		adminDto.setPhone(admin.getPhone());
//		adminDto.setUserName(admin.getUserName());
//		adminDto.setCountries(admin.getCountries());
//		return adminDto;
//	}

	@Override
	public Optional<AdminWithoutProfile> findAdminByEmailAndPassword(String email, String password) {
		return adminRepositories.findAdminByEmailAndPassword(email, password);
	}

}
