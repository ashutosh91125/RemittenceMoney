package com.llm.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.llm.Service.IAdminService;
import com.llm.Service.ICountryService;
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import com.llm.dto.AdminDto;
import com.llm.model.Admin;
import com.llm.model.AdminWithoutProfile;

@Controller
//@SessionAttributes({ "adminDTO" })
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private IAdminService adminService;
	@Autowired
	private ICountryService countryService;
	@Autowired
	private EnumEntityService enumEntityService;

	@GetMapping("/admin")
	public String showAdminForm(Model model) {
		model.addAttribute("adminDTO", new AdminDto());
//		model.addAttribute("countrieslist", countryService.fetchCountries());
		try {
			Optional<EnumEntity> countryEntity = enumEntityService.getEnumEntityByKey("country");
			countryEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			logger.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of()); // or set a default list if needed
		}
		return "adminregister";
	}

	@PostMapping("/admin")
	public String createAdmin(@ModelAttribute("adminDTO") AdminDto adminDto,
	                          @RequestParam("profileImagePath") MultipartFile profileImagePath,
	                          RedirectAttributes redirectAttributes) throws IOException {
	    byte[] profile = profileImagePath.getBytes();

	   
	    Admin admin = new Admin();
	    admin.setAdminName(adminDto.getAdminName());
	    admin.setConfirmPassword(adminDto.getConfirmPassword());
	    admin.setEmail(adminDto.getEmail());
	    admin.setPassword(adminDto.getPassword());
	    admin.setPhone(adminDto.getPhone());
	    admin.setProfileImage(profile);
	    admin.setSatus(adminDto.getSatus());
	    admin.setUserName(adminDto.getUserName());
	    admin.setCountries(adminDto.getCountries());

	    
	    String status = adminService.createAdmins(admin).trim();

	    // Extract status_code and message from the status string
	    String statusCodeString = extractFieldValue(status, "status_code=");
	    String message = extractFieldValue(status, "message=");

	    try {
	        int statusCode = Integer.parseInt(statusCodeString.trim());
	        if (statusCode == 200) {
	            // Add success message
	            redirectAttributes.addFlashAttribute("successMessage", "Admin created successfully!");
	            return "redirect:/adminlist"; // Redirect to admin list page
	        }
	        // Add error message for non-200 status codes
	        redirectAttributes.addFlashAttribute("errorMessage", "Error: " + message);
	        return "redirect:/adminregister"; // Redirect back to form page
	    } catch (NumberFormatException e) {
	        logger.error("Invalid status code: " + statusCodeString, e);
	        // Add general error message
	        redirectAttributes.addFlashAttribute("errorMessage", "Error: Invalid response format");
	        return "redirect:/adminregister"; // Redirect back to form page
	    }
	}

	// Helper method to extract the value of a field in the format `key=value`
	private String extractFieldValue(String input, String field) {
		int startIndex = input.indexOf(field) + field.length();
		int endIndex = input.indexOf(",", startIndex);
		if (endIndex == -1) {
			endIndex = input.indexOf("}", startIndex); // Handle the case where it's the last field
		}

		if (startIndex != -1 && endIndex != -1) {
			String value = input.substring(startIndex, endIndex).trim();
			// Remove any surrounding quotes if present
			if (value.startsWith("\"") && value.endsWith("\"")) {
				value = value.substring(1, value.length() - 1);
			}
			return value;
		}
		return ""; // Return empty string if field is not found
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
		model.addAttribute("countrieslist", countryService.fetchCountries());
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
