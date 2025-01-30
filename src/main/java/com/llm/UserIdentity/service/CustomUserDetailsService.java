package com.llm.UserIdentity.service;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    private final BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Optional<User> user = userRepository.findByUsername(username);

        if(user.isEmpty()){
            throw new UsernameNotFoundException("Could not found the user");
        }
        return user.get();
    }

    public Page<User> getUserByRolePageable(Role role, Pageable pageable) {
        return userRepository.findByRole(role, pageable);
    }

    public List<User> getUserByRole(Role role) {
        return userRepository.findByRole(role);
    }

    // Method to get the count of users with a specific role
    public long getUserCountByRole(Role role) {
        return userRepository.countByRole(role);
    }
    
    public Optional<User> getById(Long id){
    	return userRepository.findById(id);
    }

    public String updatePassword(String oldPassword, String newPassword, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Optional<User> userOpt = userRepository.findByUsername(username);

        if (userOpt.isPresent()) {
            User user = userOpt.get();

            // Verify old password
            if (!bCryptPasswordEncoder.matches(oldPassword, user.getPassword())) {
                model.addAttribute("message", "Old password is incorrect.");
                return "update-password";
            }

            // Check if the new password was used in the last three passwords
            if (user.getPasswordHistory() != null) {
                for (String oldPass : user.getPasswordHistory()) {
                    if (bCryptPasswordEncoder.matches(newPassword, oldPass)) {
                        model.addAttribute("message", "You cannot reuse the last three passwords.");
                        return "update-password";
                    }
                }
            }

            // Encode and update password
            String encodedPassword = bCryptPasswordEncoder.encode(newPassword);
            user.setPassword(encodedPassword);

            // Maintain password history (limit to last three)
            if (user.getPasswordHistory() == null) {
                user.setPasswordHistory(new ArrayList<>());
            }
            user.getPasswordHistory().add(encodedPassword);
            if (user.getPasswordHistory().size() > 3) {
                user.getPasswordHistory().remove(0);
            }

            user.setPasswordExpiryDate(LocalDate.now().plusDays(30));
            userRepository.save(user);

            model.addAttribute("success", "Password changed successfully.");
            return "redirect:/welcome";
        }

        model.addAttribute("message", "User not found.");
        return "update-password";
    }
}
