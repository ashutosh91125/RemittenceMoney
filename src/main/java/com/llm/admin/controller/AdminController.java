package com.llm.admin.controller;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.service.CustomUserDetailsService;
import com.llm.admin.model.Admin;
import com.llm.admin.service.IAdminService;
import com.llm.agent.model.Agent;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import com.llm.model.AdminWithoutProfile;

@Controller
@SessionAttributes({ "adminDTO" })
@RequiredArgsConstructor
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private IAdminService adminService;

	@Autowired
	private EnumEntityService enumEntityService;

	@Autowired
	private CustomUserDetailsService customUserDetailsService;

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
		List<User> subAdminList = customUserDetailsService.getUserByRole(Role.SUB_ADMIN);
		Collections.reverse(subAdminList);
		model.addAttribute("subAdminList", subAdminList);
		return "adminlist";

	}


//	@GetMapping("/admin-detail")
//	public String getAgentDetails(@RequestParam("id") Long id, Model model) {
//		Optional<User> userOptional = customUserDetailsService.getById(id);
//
//		if (userOptional.isPresent()) {
//			User user = userOptional.get();
//
//			// Create and populate the Admin object with the user's data
//			Admin admin = new Admin();
//			admin.setAdminName(user.getAdminName()); // Assuming `getFullName` is a method in `User`
//			admin.setUserName(user.getUsername()); // Map the username
//			admin.setPhone(Long.valueOf(user.getPhoneNumber())); // Map the phone number
//			admin.setEmail(user.getEmail());
//			admin.setPassword(user.getPassword());
//			admin.setCountries(enumEntityService.getEnumValueDescriptionByKeyAndValueId("country", user.getCountry()));
//			model.addAttribute("admin", admin);
//			model.addAttribute("id", id);
//		}
//		return "admin-details";
//	}

	
}
