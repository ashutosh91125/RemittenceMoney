package com.llm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.llm.UserIdentity.service.CustomUserDetailsService;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class MyConfig {

    @Autowired
    private final CustomUserDetailsService userDetailsService;

//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//                .authorizeHttpRequests(authz -> authz
//                        .requestMatchers("/login", "/signup", "/static/**").permitAll()
//                        .anyRequest().authenticated())
//                .formLogin(form -> form
//                        .loginPage("/login")
//                        .permitAll())
//                .logout(LogoutConfigurer::permitAll)
//                .csrf(AbstractHttpConfigurer::disable);  // Disable CSRF for simplicity (you may want to enable it in production)
//
//        return http.build();
//    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authz -> authz
//                        .requestMatchers("/login","/adminlogin", "/adminregister", "/signup", "/static/**","/WEB-INF/views/**").permitAll()
                        .requestMatchers("/login", "/token", "/api/v1/raas/**","/api/v1/banks/**", "/api/enumEntities/**","/caas/api/v2/customer/verify-mobile" ,"/api/v1/transfer/**","/api/v1/agent/**", "/static/**", "/assets/**" ,"/WEB-INF/views/**").permitAll()
                        .requestMatchers("/css/**", "/js/**", "/images/**", "/vendors/**", "/scss/**").permitAll()
                        .requestMatchers("/adminList").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/agentList").hasAnyAuthority("ROLE_ADMIN","ROLE_SUB_ADMIN")
                        .requestMatchers("/customerList","/subAgentList").hasAnyAuthority("ROLE_ADMIN","ROLE_SUB_ADMIN","ROLE_AGENT")
                        .anyRequest().authenticated())
                .formLogin(form -> form
                        .loginPage("/login") // Maps to your `login.jsp`
                        .loginProcessingUrl("/perform_login") // Where Spring processes login
                        .defaultSuccessUrl("/welcome", true) // Redirect after success
                        .failureUrl("/login?error=true") // Redirect after failure
                        .permitAll())
                .logout(LogoutConfigurer::permitAll)
                .csrf(AbstractHttpConfigurer::disable); // Disable CSRF for simplicity

        return http.build();
    }


    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
