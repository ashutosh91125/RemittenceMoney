package com.llm.common.controller;
import com.llm.UserIdentity.service.CustomUserDetailsService;
import com.llm.common.model.record.LoginRecord;
import com.llm.config.JwtTokenUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class JwtController {

    private final AuthenticationManager authenticationManager;
    private final JwtTokenUtil jwtTokenUtil;

    @PostMapping("/token")
    public ResponseEntity<Map<String, Object>> login(@RequestParam String username, @RequestParam String password) {
        try {
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(username, password));

            String jwtToken = jwtTokenUtil.generateToken(username);
            Date expirationTime = jwtTokenUtil.getExpirationDateFromToken(jwtToken);

            // Calculate remaining time in seconds
            long remainingTimeInSeconds = (expirationTime.getTime() - System.currentTimeMillis()) / 1000;

            Map<String, Object> response = Map.of(
                    "token", jwtToken,
                    "expiresIn", remainingTimeInSeconds
            );

            return ResponseEntity.ok(response);
        } catch (AuthenticationException ex) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("error", "Invalid credentials"));
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("error", "An unexpected error occurred"));
        }
    }
}
