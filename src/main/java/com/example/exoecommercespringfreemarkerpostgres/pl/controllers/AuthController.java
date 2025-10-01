package com.example.exoecommercespringfreemarkerpostgres.pl.controllers;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class AuthController {

    @ModelAttribute("auth")
    public Authentication authentication(Authentication authentication){
        return authentication;
    }

    @ModelAttribute("currentUsername")
    public String getCurrentUsername(Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated() && !(authentication instanceof AnonymousAuthenticationToken)) {
            return authentication.getName();
        }
        return null;
    }

    @ModelAttribute("isAdmin")
    public boolean isAdmin(Authentication authentication) {
        return hasRole(authentication, "ADMIN");
    }

    @ModelAttribute("isUser")
    public boolean isUser(Authentication authentication) {
        return hasRole(authentication, "USER");
    }

    @ModelAttribute("isAuthenticated")
    public boolean isAuthenticated(Authentication authentication) {
        return authentication != null && authentication.isAuthenticated() && !(authentication instanceof AnonymousAuthenticationToken);
    }

    private boolean hasRole(Authentication authentication, String role) {
        if (authentication == null || !authentication.isAuthenticated()
                || authentication instanceof AnonymousAuthenticationToken) {
            return false;
        }

        return authentication.getAuthorities().stream()
                .anyMatch(authority ->
                        authority.getAuthority().equals("ROLE_" + role) ||
                                authority.getAuthority().equals(role)
                );
    }
}
