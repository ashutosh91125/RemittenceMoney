package com.llm.controller;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.llm.Service.IAdminService;
import com.llm.Service.ICountryService;
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import com.llm.dto.AdminDto;
import com.llm.model.Admin;
import com.llm.model.AdminWithoutProfile;

@Controller
@SessionAttributes({ "adminDTO" })
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private IAdminService adminService;

	@Autowired
	private EnumEntityService enumEntityService;

	@GetMapping("/admin")
	public String showAdminForm(Model model) {
		model.addAttribute("adminDTO", new AdminDto());
		try {
			Optional<EnumEntity> countryEntity = enumEntityService.getEnumEntityByKey("country");
			countryEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of());
		}
		return "adminregister";
	}

	@PostMapping("/admin")
	public String processAdminDetails(@ModelAttribute("adminDTO") AdminDto adminDTO, MultipartFile profileImagePath,
			Model model) {
		try {
			byte[] profile = profileImagePath.getBytes();
			Admin admin = new Admin();
			admin.setAdminName(adminDTO.getAdminName());
			admin.setConfirmPassword(adminDTO.getConfirmPassword());
			admin.setPassword(adminDTO.getPassword());
			admin.setEmail(adminDTO.getEmail());
			admin.setPhone(adminDTO.getPhone());
			admin.setUserName(adminDTO.getUserName());
			admin.setProfileImage(profile);
			admin.setCountries(adminDTO.getCountries());
			admin.setSatus(adminDTO.getSatus());
			adminService.addAdmins(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	@GetMapping("/adminlist")
	public String getAdminList(Model model) {
		List<Admin> adminList = adminService.getAllAdmins();
		Collections.reverse(adminList);
		model.addAttribute("adminList", adminList);
		return "adminlist";

	}

	@GetMapping("/adminlogin")
	public String showLoginForm(Model model) {
		model.addAttribute("adminDTO", new AdminDto());
		return "adminlogin";
	}

	@PostMapping("/adminlogin")
	public String loginAdmin(@ModelAttribute("adminDTO") AdminDto adminDTO, Model model) {
		try {
			Optional<AdminWithoutProfile> adminOpt = adminService.findAdminByEmailAndPassword(adminDTO.getEmail(),
					adminDTO.getPassword());

			if (adminOpt.isPresent()) {
				model.addAttribute("loggedInAdmin", adminOpt.get());
				return "adminlist";
			} else {
				model.addAttribute("loginError", "Invalid email or password");
				return "adminlogin";
			}
		} catch (Exception e) {
			logger.error("Error occurred during admin login", e);
			model.addAttribute("loginError", "An error occurred. Please try again.");
			return "adminlogin";
		}
	}

}
