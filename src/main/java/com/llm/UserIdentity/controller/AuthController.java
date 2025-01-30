package com.llm.UserIdentity.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.llm.branch.model.BranchDetails;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
    private StaffDetailsRepository staffDetailsRepository;

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
    public String login(@RequestParam(name = "error",required = false) String error,Model model) {
        model.addAttribute("error", error);
        return "adminlogin";
    }

    @GetMapping("/select-branch")
    public String staffBranchSelection() {
        return "staff-branch-selection";
    }

    @PostMapping("/select-branch")
    public String selectBranch(@RequestParam String branch, HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Optional<User> userOpt = userRepository.findByUsername(username);
        Optional<StaffDetails> staffDetailsOpt = staffDetailsRepository.findByUsername(username);

        if (userOpt.isPresent() && staffDetailsOpt.isPresent()) {
            StaffDetails staffDetails = staffDetailsOpt.get();

            if (staffDetails.getBranches().contains(Long.valueOf(branch))) {
                Optional<BranchDetails> fetchedBranchOpt = branchDetailsRepository.findById(Long.valueOf(branch));

                if (fetchedBranchOpt.isPresent()) {
                    BranchDetails fetchedBranch = fetchedBranchOpt.get();

                    try {
                        // Get new role for authentication (without saving to DB)
                        Role newRole = Role.valueOf(fetchedBranch.getBranchStaffRole());

                        // Update the user's authentication role in SecurityContext
//                        updateUserAuthentication(authentication, newRole, request, response);
                        request.getSession().setAttribute("role", newRole.name());
                        request.getSession().setAttribute("selectedBranch", branch);
                    } catch (IllegalArgumentException e) {
                        return logoutAndRedirect(request, response, "Invalid role");
                    }

                    return "redirect:/welcome";
                } else {
                    return logoutAndRedirect(request, response, "Branch not found");
                }
            } else {
                return logoutAndRedirect(request, response, "Unauthorized branch");
            }
        }

        return logoutAndRedirect(request, response, "User not found");
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {

//        model.addAttribute("admin", new User());
        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(username, password)
            );
            SecurityContextHolder.getContext().setAuthentication(authentication);

            return "redirect:/welcome";
        } catch (Exception e) {
            model.addAttribute("error", "Invalid username or password");
            return "login";
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
    public String changePasswordPage(@RequestParam(name = "message",required = false) String message, Model model) {
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

            String encodedPassword = passwordEncoder.encode(newPassword);
            user.setPassword(encodedPassword);
            if (user.getPasswordHistory() == null) {
                user.setPasswordHistory(new ArrayList<>());
            }
            user.getPasswordHistory().add(encodedPassword);

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

    @GetMapping("/update-password")
    public String updatePasswordPage(@RequestParam(name = "message",required = false) String message, Model model) {
        model.addAttribute("message", message);
        return "update-password";
    }

    @PostMapping("/update-password")
    public String changePassword(@RequestParam String oldPassword,
                                 @RequestParam String newPassword,
                                 Model model) {
        return customUserDetailsService.updatePassword(oldPassword, newPassword, model);
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

//    private void updateUserAuthentication(Authentication authentication, Role newRole, HttpServletRequest request, HttpServletResponse response) {
//        // Get existing user details
//        Object principal = authentication.getPrincipal();
//
//        List<GrantedAuthority> updatedAuthorities = List.of(new SimpleGrantedAuthority(newRole.name()));
//
//        Authentication newAuth = new UsernamePasswordAuthenticationToken(
//                principal,
//                authentication.getCredentials(),
//                updatedAuthorities
//        );
//
//        // Update security context
//        SecurityContextHolder.getContext().setAuthentication(newAuth);
//
//        request.getSession().setAttribute("role", newRole.name());
//
//        System.out.println("Updated authentication role to: " + newRole.name());
//    }

    private String logoutAndRedirect(HttpServletRequest request, HttpServletResponse response, String errorMessage) {
        // Invalidate the session
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Clear authentication from SecurityContext
        SecurityContextHolder.clearContext();

        // Remove authentication cookie (JSESSIONID)
        Cookie cookie = new Cookie("JSESSIONID", null);
        cookie.setHttpOnly(true);
        cookie.setSecure(true);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        System.out.println("User logged out due to error: " + errorMessage);

        // Redirect to login page with error message
        return "redirect:/login?error=" + errorMessage;
    }



}

