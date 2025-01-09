package com.llm.UserIdentity.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.UserIdentity.service.CustomUserDetailsService;
import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import com.llm.repositories.CustomerRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private final AuthenticationManager authenticationManager;

    @Autowired
    private final CustomUserDetailsService customUserDetailsService;

    @Autowired
    private final BranchDetailsRepository branchDetailsRepository;

    @Autowired
    private final CustomerRepository customerRepository;
    
    @Autowired
	private EnumEntityService enumEntityService;

    // Login Page
    @GetMapping("/login")
    public String login() {
        return "adminlogin";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {

//        model.addAttribute("admin", new User());
        try {
            // Authenticate manually (if you want custom behavior)
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(username, password)
            );

            // If authentication is successful, set the authentication context
            SecurityContextHolder.getContext().setAuthentication(authentication);

            return "redirect:/welcome"; // Redirect to a welcome page after successful login
        } catch (Exception e) {
            // If authentication fails, add error to model and return to login page
            model.addAttribute("error", "Invalid username or password");
            return "login";  // Return to the login page with error message
        }
    }

    // Signup Page
    @GetMapping("/signup")
    public String signup() {
        return "adminregister";
    }

    // Handle Signup Form Submission
    @PostMapping("/signup")
    public String handleSignup(@RequestParam String adminName, @RequestParam String userName,@RequestParam String email, @RequestParam String password, @RequestParam String phoneNumber, @RequestParam String country) {
        User user = new User();
        user.setEmail(email);
        user.setPassword(new BCryptPasswordEncoder().encode(password));
        user.setAdminName(adminName);
        user.setUsername(userName);
        user.setCountry(country); 
        user.setPhoneNumber(phoneNumber);
        user.setRole(Role.SUB_ADMIN);
        user.setApproved(true);
        user.setFirstLogin(true);
        userRepository.save(user);
        return "redirect:/adminlist";
    }

    // Welcome Page (accessible only for logged-in users)
    @GetMapping("/welcome")
    public String welcome(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        model.addAttribute("username", userDetails.getUsername());
        model.addAttribute("subAdminCount", customUserDetailsService.getUserCountByRole(Role.SUB_ADMIN));
        model.addAttribute("agentCount", customUserDetailsService.getUserCountByRole(Role.AGENT));
        model.addAttribute("customerCount", customerRepository.count());
        model.addAttribute("branchCount", branchDetailsRepository.count());
        return "superadmindasbord";
    }

    @GetMapping("/change-password")
    public String changePasswordPage(@RequestParam(required = false) String message, Model model) {
        model.addAttribute("message", message);
        return "change-password";
    }

    @PostMapping("/change-password")
    public String changePassword(@RequestParam String newPassword, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<User> userOpt = userRepository.findByUsername(username);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

            // Check if the new password matches any of the last three passwords
            if (user.getPasswordHistory() != null) {
                for (String oldPassword : user.getPasswordHistory()) {
                    if (passwordEncoder.matches(newPassword, oldPassword)) {
                        model.addAttribute("message", "You cannot reuse the last three passwords.");
                        return "change-password";
                    }
                }
            }

            // Update the password and add it to the history
            String encodedPassword = passwordEncoder.encode(newPassword);
            user.setPassword(encodedPassword);
            if (user.getPasswordHistory() == null) {
                user.setPasswordHistory(new ArrayList<>());
            }
            user.getPasswordHistory().add(encodedPassword);

            // Ensure only the last three passwords are kept
            if (user.getPasswordHistory().size() > 3) {
                user.getPasswordHistory().remove(0);
            }

            user.setFirstLogin(false);
            user.setPasswordExpiryDate(LocalDate.now().plusDays(30)); // Example expiry date
            userRepository.save(user);

            model.addAttribute("success", "Password changed successfully.");
            return "redirect:/welcome";
        }
        model.addAttribute("error", "User not found.");
        return "change-password";
    }
    
    
    @GetMapping("/admin-detail")
	public String handleSignup(@RequestParam("id") Long id,  Model model) {
		Optional<User> admin = customUserDetailsService.getById(id);
		model.addAttribute("country", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country", admin.get().getCountry()));
		model.addAttribute("user",admin);
		return "admin-details";
	}
	
	@GetMapping("/admin-update-form")
	public String getUserUpdateForm(@RequestParam("id") Long id, Model model) {
		Optional<User> userOptional = customUserDetailsService.getById(id);
		try {
			Optional<EnumEntity> countryEntity = enumEntityService.getEnumEntityByKey("country");
			countryEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

		} catch (Exception e) {
			log.error("Error retrieving country list: ", e);
			model.addAttribute("countryList", List.of());
		}
		if (userOptional.isPresent()) {
			model.addAttribute("user", userOptional.get());
		} 
		return "admin-view-update";
	}
	
		@PutMapping("/admin-update")
		public ResponseEntity<?> updateUser(
	        @RequestParam("id") Long id, 
	        @RequestBody User updatedUserDetails) {
	    try {
	        Optional<User> userOptional = customUserDetailsService.getById(id);
	        
	        if (userOptional.isEmpty()) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND)
	                    .body("User with ID " + id + " not found.");
	        }

	        User existingUser = userOptional.get();
	        // Update the fields of the existing user with the provided details
	        existingUser.setAdminName(updatedUserDetails.getAdminName());
	        existingUser.setEmail(updatedUserDetails.getEmail());
	        existingUser.setUsername(updatedUserDetails.getUsername());
	        existingUser.setCountry(updatedUserDetails.getCountry());
	        existingUser.setPhoneNumber(updatedUserDetails.getPhoneNumber());
	        userRepository.save(existingUser);

	        return ResponseEntity.ok("User updated successfully.");
	    } catch (Exception e) {
	        log.error("Error updating user with ID " + id + ": ", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                .body("Error updating user. Please try again.");
	    }
	}

	
}

