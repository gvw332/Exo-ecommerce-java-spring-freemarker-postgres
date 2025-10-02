package com.example.exoecommercespringfreemarkerpostgres.pl.controllers;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController implements org.springframework.boot.web.servlet.error.ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Integer statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");

        if (statusCode != null) {
            if (statusCode == 404) {
                return "error/404"; // page 404
            } else if (statusCode == 500) {
                return "error/500"; // page 500
            }
        }
        return "error/error"; // page générique pour les autres erreurs
    }

    // Nouveau : endpoint dédié pour Access Denied
    @GetMapping("/access-denied")
    public String accessDenied() {
        return "error/access-denied"; // ton template FreeMarker
    }
}
