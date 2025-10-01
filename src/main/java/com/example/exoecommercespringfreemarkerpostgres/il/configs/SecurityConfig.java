package com.example.exoecommercespringfreemarkerpostgres.il.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();

    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(r -> r
                        .requestMatchers(
                                "/",                 // Page d'accueil
                                "/about",            // Page à propos
                                "/styles/**",        // Fichiers CSS
                                "/scripts/**"        // JS
                        ).permitAll()
                        .requestMatchers(
                                "/login",
                                "/register"
                        ).anonymous()               // Autorisé uniquement pour utilisateurs non connectés
                        .requestMatchers(
                                "/logout"
                        ).authenticated()           // Logout uniquement pour utilisateurs connectés
                        .anyRequest().permitAll()   // Le reste est autorisé temporairement
                )
                .formLogin(c -> c
                        .loginPage("/login").permitAll()
                        .defaultSuccessUrl("/", true)  // Redirection après login réussi
                )
                .logout(c -> c
                        .logoutUrl("/logout")
                        .deleteCookies("JSESSIONID")
                        .invalidateHttpSession(true)
                        .logoutSuccessUrl("/login")  // Redirection après logout
                );

        return http.build();
    }
}
