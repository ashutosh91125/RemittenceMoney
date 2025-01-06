package com.llm.config;

import com.llm.UserIdentity.model.User;
import com.llm.UserIdentity.repository.UserRepository;
import com.llm.staff.model.StaffDetails;
import com.llm.staff.repository.StaffDetailsRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.time.LocalDate;
import java.util.Optional;

public class CustomAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

    @Autowired
    private StaffDetailsRepository staffDetailsRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException {
        // Extract parameters from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String branch = request.getParameter("branch");

        Optional<User> fetchUser = userRepository.findByUsername(username);

        if (fetchUser.isEmpty()) {
            throw new BadCredentialsException("Invalid username or password");
        }

        if (fetchUser.get().isFirstLogin()) {
            throw new BadCredentialsException("First login: Password change required.");
        }

        if (fetchUser.get().getPasswordExpiryDate() != null && fetchUser.get().getPasswordExpiryDate().isBefore(LocalDate.now())) {
            throw new BadCredentialsException("Password expired: Password change required.");
        }

        // Create authentication token
        UsernamePasswordAuthenticationToken authRequest =
                new UsernamePasswordAuthenticationToken(username, password);

        if(!branch.isEmpty()) {
            // Validate user and branch
            Optional<StaffDetails> staffDetailsOpt = staffDetailsRepository.findByUsername(username);
            if (staffDetailsOpt.isEmpty()) {
                throw new BadCredentialsException("Invalid username or password");
            }

            if (!staffDetailsOpt.get().getBranches().contains(branch)) {
                throw new BadCredentialsException("Branch not found");
            }

            // Set additional details
            authRequest.setDetails(branch);
        }

        // Authenticate the user
        return this.getAuthenticationManager().authenticate(authRequest);
    }
}
