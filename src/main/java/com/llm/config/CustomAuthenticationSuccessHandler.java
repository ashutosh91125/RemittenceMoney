package com.llm.config;

import com.llm.UserIdentity.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDate;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        User user = (User) authentication.getPrincipal();

        boolean isPasswordExpired = user.getPasswordExpiryDate() != null && user.getPasswordExpiryDate().isBefore(LocalDate.now());

        if (user.isFirstLogin()) {
            response.sendRedirect("/change-password?message=Password change required");
        } else if (isPasswordExpired) {
            response.sendRedirect("/change-password?message=Password expired");
        } else {
            response.sendRedirect("/welcome");
        }
    }
}
