package com.llm.luluStaff.controller;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.UserIdentity.service.CustomUserDetailsService;
import com.llm.admin.model.Admin;
import com.llm.common.model.EnumEntity;
import com.llm.common.service.EnumEntityService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@AllArgsConstructor
@Slf4j
public class LuluStaffController {

    private final UserRepository userRepository;
    private final CustomUserDetailsService customUserDetailsService;
    private final EnumEntityService enumEntityService;

    @GetMapping("/lulu-staff-register")
    public String register(Model model) {
        try {
            Optional<EnumEntity> countryEntity = enumEntityService.getEnumEntityByKey("country");
            countryEntity.ifPresent(entity -> model.addAttribute("countryList", entity.getValues()));

        } catch (Exception e) {
            model.addAttribute("countryList", List.of());
        }
        return "lulu-staff-register";
    }

    // Handle Signup Form Submission
    @PostMapping("/lulu-staff-register")
    public String handleSignup(@RequestParam String adminName, @RequestParam String userName, @RequestParam String email, @RequestParam String password, @RequestParam String phoneNumber, @RequestParam String country) {
        User user = new User();
        user.setEmail(email);
        user.setPassword(new BCryptPasswordEncoder().encode(password));
        user.setAdminName(adminName);
        user.setUsername(userName);
        user.setCountry(country);
        user.setPhoneNumber(phoneNumber);
        user.setRole(Role.STAFF_ALL);
        user.setApproved(true);
        user.setFirstLogin(true);
        userRepository.save(user);
        return "redirect:/lulu-staff-list";
    }

    @GetMapping("/lulu-staff-update")
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
        return "lulu-staff-update";
    }

    @PutMapping("/lulu-staff-update")
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

    @GetMapping("/lulu-staff-list")
    public String getAdminList(Model model) {
        List<User> luluStaffList = customUserDetailsService.getUserByRole(Role.STAFF_ALL);
        Collections.reverse(luluStaffList);
        model.addAttribute("luluStaffList", luluStaffList);
        return "lulu-staff-list";

    }

    @GetMapping("/lulu-staff-detail")
    public String handleSignup(@RequestParam("id") Long id,  Model model) {
        Optional<User> admin = customUserDetailsService.getById(id);
        model.addAttribute("country", enumEntityService.getEnumValueDescriptionByKeyAndValueId("country", admin.get().getCountry()));
        model.addAttribute("user",admin);
        return "lulu-staff-details";
    }
}
