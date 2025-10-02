package com.example.exoecommercespringfreemarkerpostgres.pl.controllers;
import java.math.BigDecimal;
import com.example.exoecommercespringfreemarkerpostgres.bll.services.FileStorageService;
import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.ArtPieceRepository;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.ArtPiece;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/art")
public class ProductController {

    private final ArtPieceRepository artPieceRepository;
    private final FileStorageService fileStorageService;

    public ProductController(ArtPieceRepository artPieceRepository, FileStorageService fileStorageService) {
        this.artPieceRepository = artPieceRepository;
        this.fileStorageService = fileStorageService;
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
    public String createSubmit(
            @RequestParam("title") String title,
            @RequestParam("artist") String artist,
            @RequestParam("price") Double price,
            @RequestParam("description") String description,
            @RequestParam("image") MultipartFile image,
            Model model
    ) {
        try {
            // Validation basique
            if (image.isEmpty()) {
                model.addAttribute("error", "Veuillez sélectionner une image");
                return "products/create";
            }

            // Sauvegarde l'image et récupère le nom du fichier
            String imageFilename = fileStorageService.storeFile(image);

            // Crée l'entité ArtPiece
            ArtPiece art = new ArtPiece();
            art.setTitle(title);
            art.setArtist(artist);
            art.setPrice(BigDecimal.valueOf(price));
            art.setDescription(description);
            art.setImageUrl(imageFilename);

            artPieceRepository.save(art);

            return "redirect:/art/";
        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la création : " + e.getMessage());
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            model.addAttribute("username", auth.getName());
            model.addAttribute("roles", auth.getAuthorities());
            return "products/create";
        }
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
    public String editSubmit(
            @PathVariable Long id,
            @RequestParam("title") String title,
            @RequestParam("artist") String artist,
            @RequestParam("price") Double price,
            @RequestParam("description") String description,
            @RequestParam(value = "image", required = false) MultipartFile image,
            @RequestParam("currentImageUrl") String currentImageUrl,
            Model model
    ) {
        try {
            ArtPiece art = artPieceRepository.findById(id).orElseThrow();

            art.setTitle(title);
            art.setArtist(artist);
            art.setPrice(BigDecimal.valueOf(price));
            art.setDescription(description);

            // Si une nouvelle image est uploadée, on la sauvegarde
            if (image != null && !image.isEmpty()) {
                String imageFilename = fileStorageService.storeFile(image);
                art.setImageUrl(imageFilename);
            } else {
                // Sinon on garde l'ancienne image
                art.setImageUrl(currentImageUrl);
            }

            artPieceRepository.save(art);
            return "redirect:/art/";

        } catch (Exception e) {
            model.addAttribute("error", "Erreur lors de la modification : " + e.getMessage());
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            model.addAttribute("username", auth.getName());
            model.addAttribute("roles", auth.getAuthorities());
            ArtPiece art = artPieceRepository.findById(id).orElseThrow();
            model.addAttribute("art", art);
            return "products/edit";
        }
    }



    // --- Supprimer un tableau (ADMIN uniquement)
    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        artPieceRepository.deleteById(id);
        return "redirect:/art/";
    }
}