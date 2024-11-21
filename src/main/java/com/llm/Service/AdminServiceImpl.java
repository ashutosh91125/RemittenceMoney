package com.llm.Service;

import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.llm.model.Admin;
import com.llm.model.AdminWithoutProfile;
import com.llm.repositories.AdminRepositories;

@Service
public class AdminServiceImpl implements IAdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	@Autowired
	private AdminRepositories adminRepositories;

	@Override
	public String createAdmins(Admin admin) {
		try {
			// Save admin to the database
			adminRepositories.save(admin);

			// Return success response
			return "status_code=200&message=Admin  successfully";
		} catch (Exception e) {
			logger.error("Error while saving admin: ", e);

			// Return failure response
			return "status_code=500&message=Error while  admin: " + e.getMessage();
		}
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
//		List<Country> validCountries = admin.getCountries();
//		adminDto.setCountries(validCountries);
//
//		return adminDto;
//	}

	@Override
	public Optional<AdminWithoutProfile> findAdminByEmailAndPassword(String email, String password) {
		return adminRepositories.findAdminByEmailAndPassword(email, password);
	}

}
