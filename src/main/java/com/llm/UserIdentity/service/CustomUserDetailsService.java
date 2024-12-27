package com.llm.UserIdentity.service;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.model.enums.Role;
import com.llm.UserIdentity.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

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
}
