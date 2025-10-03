package com.example.exoecommercespringfreemarkerpostgres.pl.models.user;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record RegisterForm(
        @NotBlank(message = "Le nom d'utilisateur est requis")
        @Size(min = 3, max = 50, message = "Le nom doit contenir entre 3 et 50 caractères")
        String username,

        @NotBlank(message = "L'email est requis")
        @Email(message = "L'email n'est pas valide")
        String email,

        @NotBlank(message = "Le mot de passe est requis")
        @Size(min = 6, message = "Le mot de passe doit contenir au moins 6 caractères")
        String password,

        @NotBlank(message = "La confirmation du mot de passe est requise")
        String confirmPassword
) {}