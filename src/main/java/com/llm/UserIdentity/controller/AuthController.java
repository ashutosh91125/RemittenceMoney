package com.llm.UserIdentity.controller;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.dto.SignUp;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.UserIdentity.service.CustomUserDetailsService;
import com.llm.admin.model.Admin;

import com.llm.branch.repository.BranchDetailsRepository;
import com.llm.repositories.CustomerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
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
    public String changePassword(@RequestParam String username, @RequestParam String newPassword, Model model) {
        Optional<User> userOpt = userRepository.findByUsername(username);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            user.setPassword(new BCryptPasswordEncoder().encode(newPassword));
            user.setFirstLogin(false);
            user.setPasswordExpiryDate(LocalDate.now().plusDays(31));
            userRepository.save(user);
            model.addAttribute("success", "Password changed successfully.");
            return "adminlogin";
        }
        model.addAttribute("error", "User not found.");
        return "change-password";
    }
}

