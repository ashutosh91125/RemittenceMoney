package com.llm.config;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
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
        Authentication result = super.authenticate(authentication);

        String username = authentication.getName();
        Optional<User> userOpt = userRepository.findByUsername(username);

        userOpt.ifPresent(user -> {
            user.setForcePasswordChange(user.isFirstLogin() ||
                    (user.getPasswordExpiryDate() != null && user.getPasswordExpiryDate().isBefore(LocalDate.now())));
        });

        return result;
    }
}
