package com.llm.config;

import com.llm.UserIdentity.service.CustomUserDetailsService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class MyConfig {

    private final CustomUserDetailsService userDetailsService;

    public MyConfig(CustomUserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, AuthenticationManager authenticationManager) throws Exception {
        CustomAuthenticationFilter customAuthenticationFilter = new CustomAuthenticationFilter();
        customAuthenticationFilter.setAuthenticationManager(authenticationManager);

        http
                .csrf(AbstractHttpConfigurer::disable)
                .exceptionHandling(exception -> exception
                        .authenticationEntryPoint(new CustomAuthenticationEntryPoint()))
                .authorizeHttpRequests(authz -> authz
                        .requestMatchers("/login", "/change-password", "/staff-login", "/token", "/api/v1/raas/**", "/api/v1/banks/**",
                                "/api/enumEntities/**", "/caas/api/v2/customer/verify-mobile", "/api/v1/transfer/**",
                                "/api/v1/agent/**", "/api/v1/beneficiaries/**", "/static/**", "/assets/**", "/WEB-INF/views/**")
                        .permitAll()
                        .requestMatchers("/css/**", "/js/**", "/images/**", "/vendors/**", "/scss/**").permitAll()
                        .requestMatchers("/adminList").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/agentList").hasAnyAuthority("ROLE_ADMIN", "ROLE_SUB_ADMIN")
                        .requestMatchers("/customerList", "/subAgentList").hasAnyAuthority("ROLE_ADMIN", "ROLE_SUB_ADMIN", "ROLE_AGENT", "ROLE_STAFF")
                        .anyRequest().authenticated())
                .addFilterAt(customAuthenticationFilter, UsernamePasswordAuthenticationFilter.class)
                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/perform_login")
                        .defaultSuccessUrl("/welcome", true)
                        .failureUrl("/login?error=true")
                        .permitAll())
                .logout(LogoutConfigurer::permitAll);

        return http.build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        CustomAuthenticationProvider provider = new CustomAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder());
        return provider;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
