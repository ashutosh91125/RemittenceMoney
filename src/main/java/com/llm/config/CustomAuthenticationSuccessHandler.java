package com.llm.config;

import com.llm.UserIdentity.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Collection;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        User user = (User) authentication.getPrincipal();
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

        boolean isPasswordExpired = user.getPasswordExpiryDate() != null && user.getPasswordExpiryDate().isBefore(LocalDate.now());

        String fetchRole = String.valueOf(user.getRole());
        fetchRole = fetchRole.replace("_"," ");

        request.getSession().setAttribute("roleName", fetchRole);
        request.getSession().setAttribute("loggedInUser", user.getAdminName());

        if (user.isFirstLogin()) {
            response.sendRedirect("/change-password?message=Password change required");
        } else if (isPasswordExpired) {
            response.sendRedirect("/change-password?message=Password expired");
        } else if (authorities.stream().anyMatch(role -> role.getAuthority().startsWith("ROLE_STAFF"))) {
                response.sendRedirect("/select-branch");
        }else {
            response.sendRedirect("/welcome");
        }



    }
}
