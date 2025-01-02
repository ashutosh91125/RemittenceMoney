package com.llm.config;

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

import java.util.Optional;

public class CustomAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

    @Autowired
    private StaffDetailsRepository staffDetailsRepository;

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException {
        // Extract parameters from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String branch = request.getParameter("branch");

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
