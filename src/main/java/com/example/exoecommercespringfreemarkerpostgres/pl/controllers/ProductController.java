package com.example.exoecommercespringfreemarkerpostgres.pl.controllers;

import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.ArtPieceRepository;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.ArtPiece;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/art")
public class ProductController {

    private final ArtPieceRepository artPieceRepository;

    public ProductController(ArtPieceRepository artPieceRepository) {
        this.artPieceRepository = artPieceRepository;
    }

    // --- Liste des tableaux (accessible à tous)
    @GetMapping("/")
    public String index(Model model, Authentication authentication) {
        model.addAttribute("products", artPieceRepository.findAll());
        model.addAttribute("username", authentication != null ? authentication.getName() : null);
        model.addAttribute("roles", authentication != null ? authentication.getAuthorities() : null);
        return "products/index";
    }

    // --- Détail d'un tableau (accessible à tous)
    @GetMapping("/{id}")
    public String detail(@PathVariable Long id, Model model, Authentication authentication) {
        ArtPiece art = artPieceRepository.findById(id).orElseThrow();
        model.addAttribute("art", art);
        model.addAttribute("username", authentication != null ? authentication.getName() : null);
        model.addAttribute("roles", authentication != null ? authentication.getAuthorities() : null);
        return "products/detail";
    }


    // --- Créer un tableau (ADMIN uniquement)
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/create")
    public String createForm(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("art", new ArtPiece());
        model.addAttribute("username", auth.getName());
        model.addAttribute("roles", auth.getAuthorities());
        if (auth.getAuthorities().stream().anyMatch(r -> r.getAuthority().equals("ROLE_User"))){
            return "products/index";
        }

        return "products/create";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/create")
    public String createSubmit(@ModelAttribute @Valid ArtPiece art, BindingResult result) {
        if (result.hasErrors()) return "products/create";
        artPieceRepository.save(art);
        return "redirect:/art/";
    }

    // --- Modifier un tableau (ADMIN uniquement)
    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ArtPiece art = artPieceRepository.findById(id).orElseThrow();
        model.addAttribute("art", art);
        model.addAttribute("username", auth.getName());
        model.addAttribute("roles", auth.getAuthorities());
        return "products/edit";
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/edit/{id}")
    public String editSubmit(@PathVariable Long id, @ModelAttribute @Valid ArtPiece art, BindingResult result) {
        if (result.hasErrors()) return "products/edit";
        art.setId(id);
        artPieceRepository.save(art);
        return "redirect:/art/";
    }

    // --- Supprimer un tableau (ADMIN uniquement)
    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        artPieceRepository.deleteById(id);
        return "redirect:/art/";
    }
}
