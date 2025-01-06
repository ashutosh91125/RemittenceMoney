package com.llm.config;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import java.time.LocalDate;
import java.util.Optional;

public class CustomAuthenticationProvider extends DaoAuthenticationProvider {

    @Autowired
    private UserRepository userRepository;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();

        Optional<User> fetchUser = userRepository.findByUsername(username);
        if (fetchUser.isPresent()) {
            User user = fetchUser.get();

            if (user.isFirstLogin()) {
                throw new BadCredentialsException("First login: Password change required.");
            }

            if (user.getPasswordExpiryDate() != null && user.getPasswordExpiryDate().isBefore(LocalDate.now())) {
                throw new BadCredentialsException("Password expired: Password change required.");
            }
        } else {
            throw new BadCredentialsException("Invalid username or password.");
        }

        return super.authenticate(authentication);
    }
}
