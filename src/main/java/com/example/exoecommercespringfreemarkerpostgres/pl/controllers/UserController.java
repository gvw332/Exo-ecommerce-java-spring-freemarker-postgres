package com.example.exoecommercespringfreemarkerpostgres.pl.controllers;

import com.example.exoecommercespringfreemarkerpostgres.bll.services.impls.UserService;
import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.UserRepository;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.User;
import com.example.exoecommercespringfreemarkerpostgres.dll.enums.UserRole;
import com.example.exoecommercespringfreemarkerpostgres.pl.models.user.RegisterForm;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;
    private final UserService userService;
    private final org.springframework.security.crypto.password.PasswordEncoder passwordEncoder;

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("registerForm", new RegisterForm("", "", "", ""));
        return "auth/register";
    }

    @PostMapping("/register")
    public String register(
            @Valid @ModelAttribute("registerForm") RegisterForm registerForm,
            BindingResult bindingResult,
            Model model
    ){
        // Vérification des erreurs de validation
        if(bindingResult.hasErrors()){
            model.addAttribute("registerForm", registerForm);
            model.addAttribute("bindingResult", bindingResult);
            return "auth/register";
        }

        // Vérifier si les mots de passe correspondent
        if(!registerForm.password().equals(registerForm.confirmPassword())){
            model.addAttribute("registerForm", registerForm);
            model.addAttribute("passwordMismatch", true);
            return "auth/register";
        }

        // Vérifier si le nom d'utilisateur existe déjà
        if(userRepository.existsByUsername(registerForm.username())){
            bindingResult.rejectValue("username", "error.username", "Ce nom d'utilisateur existe déjà.");
            model.addAttribute("registerForm", registerForm);
            model.addAttribute("bindingResult", bindingResult);
            return "auth/register";
        }

        // Vérifier si l'email existe déjà
        if(userRepository.existsByEmail(registerForm.email())){
            bindingResult.rejectValue("email", "error.email", "Cet email est déjà utilisé.");
            model.addAttribute("registerForm", registerForm);
            model.addAttribute("bindingResult", bindingResult);
            return "auth/register";
        }

        // Encodage du mot de passe
        String hashedPassword = passwordEncoder.encode(registerForm.password());

        // Création de l'utilisateur
        User user = User.builder()
                .username(registerForm.username())
                .email(registerForm.email())
                .password(hashedPassword)
                .role(UserRole.USER)
                .build();

        userRepository.save(user);

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            Model model
    ) {
        if (error != null) {
            model.addAttribute("error", "Nom d'utilisateur ou mot de passe incorrect.");
        }

        if (logout != null) {
            model.addAttribute("message", "Vous avez été déconnecté avec succès.");
        }

        return "auth/login";
    }

    @GetMapping("/profil")
    public String profil(Authentication authentication, Model model) {
        if (authentication == null) {
            return "redirect:/login";
        }

        String username = authentication.getName();
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));

        model.addAttribute("user", user);
        model.addAttribute("username", username);
        model.addAttribute("roles", authentication.getAuthorities());

        return "auth/profil";
    }
}