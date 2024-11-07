//package com.llm.config;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.Customizer;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.web.SecurityFilterChain;
//
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig  {
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//                .authorizeHttpRequests(authorizeRequests ->
//                        authorizeRequests.requestMatchers("/getAccessToken").permitAll()
//                        		.requestMatchers("/adminlogin").permitAll()
//                                .requestMatchers("/admin**/**").permitAll()
//                                .requestMatchers("/caas-lcm/api/v1/CAAS/onBoarding/customer").authenticated() // protect onboarding endpoint
//                                .requestMatchers("/caas/api/v2/customer/**").authenticated() // Secure this endpoint
//                                .requestMatchers("/caas/api/v2/customer/validate").authenticated() // Protect this endpoint
//                                .anyRequest().authenticated()
//                )
//                .oauth2ResourceServer(oauth2ResourceServer ->
//                        oauth2ResourceServer.jwt(Customizer.withDefaults())
//                )
//                .formLogin(formLogin -> formLogin
//                        .loginPage("/adminlogin") // Custom login page if needed
//                        .permitAll()
//                    )
//        ;
//        return http.build();
//    }
//    
//}