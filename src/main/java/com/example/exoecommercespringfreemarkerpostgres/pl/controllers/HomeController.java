package com.example.exoecommercespringfreemarkerpostgres.pl.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.security.core.Authentication;
@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/about")
    public String about(Model model, Authentication authentication) {
        model.addAttribute("username", authentication != null ? authentication.getName() : null);
        model.addAttribute("roles", authentication != null ? authentication.getAuthorities() : null);
        return "about";
    }


}