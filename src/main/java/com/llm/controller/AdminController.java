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
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
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
		model.addAttribute("admin", new Admin());
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
	public String processAdminDetails(@ModelAttribute("admin") Admin admin, MultipartFile profileImagePath,
			Model model) {
		try {
			if (profileImagePath != null && !profileImagePath.isEmpty()) {
				admin.setProfileImage(profileImagePath.getBytes());
			}
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
		try {
			Optional<EnumEntity> countriesEntity = enumEntityService.getEnumEntityByKey("country");
			countriesEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of());
		}
		model.addAttribute("adminDTO", new Admin());
		return "adminlogin";
	}

	@PostMapping("/adminlogin")
	public String loginAdmin(@ModelAttribute("admin") Admin admin, Model model) {
		try {
			Optional<AdminWithoutProfile> adminOpt = adminService.findAdminByEmailAndPassword(admin.getEmail(),
					admin.getPassword());

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
