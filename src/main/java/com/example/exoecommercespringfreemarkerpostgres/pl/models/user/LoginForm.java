package com.example.exoecommercespringfreemarkerpostgres.pl.models.user;

import jakarta.validation.constraints.NotBlank;

public record LoginForm(
        @NotBlank(message = "Le nom d'utilisateur est requis")
        String username,

        @NotBlank(message = "Le mot de passe est requis")
        String password
) {}