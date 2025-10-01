package com.example.exoecommercespringfreemarkerpostgres.pl.controllers;

import com.example.exoecommercespringfreemarkerpostgres.bll.services.impls.UserService;
import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.UserRepository;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.User;
import com.example.exoecommercespringfreemarkerpostgres.dll.enums.UserRole;
import com.example.exoecommercespringfreemarkerpostgres.pl.models.user.RegisterForm;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;
    private final UserService userService;
    private final org.springframework.security.crypto.password.PasswordEncoder passwordEncoder;

    @GetMapping("/register")
    public String register(){
        return "auth/register";
    }

    @PostMapping("/register")
    public String register(
            @Valid @ModelAttribute RegisterForm registerForm,
            BindingResult bindingResult
    ){

        // Vérification des erreurs de formulaire
        if(bindingResult.hasErrors()){
            return "auth/register";
        }

        // Vérifier si le nom d'utilisateur existe déjà
        if(userRepository.existsByUsername(registerForm.username())){
            bindingResult.rejectValue("username", "error.username", "Ce nom d'utilisateur existe déjà.");
            return "auth/register";
        }

        // Encodage du mot de passe
        String hashedPassword = passwordEncoder.encode(registerForm.password());

        // Création de l'utilisateur avec le builder de Lombok
        User user = User.builder()
                .username(registerForm.username())
                .password(hashedPassword)
                .role(UserRole.USER)
                .build();

        userRepository.save(user);

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(){
        return "auth/login";
    }
}
