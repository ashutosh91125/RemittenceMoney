package com.llm.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException {
        String errorMessage = authException.getMessage();

        if (errorMessage.contains("First login")) {
            response.sendRedirect("/change-password?message=First login: Please change your password.");
        } else if (errorMessage.contains("Password expired")) {
            response.sendRedirect("/change-password?message=Password expired: Please change your password.");
        } else {
            response.sendRedirect("/login?error=true");
        }
    }
}
