package com.llm.config;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {

        String errorMessage = exception.getMessage();

        if (errorMessage.contains("First login")) {
            response.sendRedirect("/change-password?message=First login: Please change your password.");
        } else if (errorMessage.contains("Password expired")) {
            response.sendRedirect("/change-password?message=Password expired: Please change your password.");
        } else {
            response.sendRedirect("/login?error=true");
        }
    }
}
