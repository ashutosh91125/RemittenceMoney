package com.llm.config;

import com.llm.UserIdentity.service.CustomUserDetailsService;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

@Configuration
@AllArgsConstructor
@EnableRedisHttpSession
public class MyConfig {

    private final CustomUserDetailsService userDetailsService;
    private final CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
    private final CustomAuthenticationFailureHandler customAuthenticationFailureHandler;
    private final JwtAuthenticationFilter jwtAuthenticationFilter;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, AuthenticationManager authenticationManager) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable)
                .exceptionHandling(exception -> exception
                        .authenticationEntryPoint(new CustomAuthenticationEntryPoint()))
                .authorizeHttpRequests(authz -> authz
                        .requestMatchers("/login", "/api/auth/token", "/staff-login", "/api/v1/raas/**", "/api/v1/banks/**","/caas/api/v2/iddetail/**",
                                "/caas/api/v2/customer/**", "/api/v1/transfer/**","/api/v1/staff/**","/api/enumEntities/**",
                                "/api/v1/agent/**", "/api/v1/beneficiaries/**", "/static/**", "/assets/**", "/WEB-INF/views/**")
                        .permitAll()
                        .requestMatchers("/css/**", "/js/**", "/images/**", "/vendors/**", "/scss/**").permitAll()
                        .requestMatchers("/adminList").hasAuthority("ROLE_ADMIN")
                        .requestMatchers("/agentList").hasAnyAuthority("ROLE_ADMIN", "ROLE_SUB_ADMIN")
                        .requestMatchers("/customerList", "/subAgentList").hasAnyAuthority("ROLE_ADMIN", "ROLE_SUB_ADMIN", "ROLE_AGENT", "ROLE_STAFF")
                        .anyRequest().authenticated())
                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/perform_login")
                        .successHandler(customAuthenticationSuccessHandler)
                        .failureHandler(customAuthenticationFailureHandler)
                        .permitAll())
                .logout(LogoutConfigurer::permitAll)
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class)
                .sessionManagement(session -> session
                        .invalidSessionUrl("/login")
                        .maximumSessions(1)  // Maximum 1 session per user
                        .expiredUrl("/login?error=Session Ended")
                        .maxSessionsPreventsLogin(false));

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
