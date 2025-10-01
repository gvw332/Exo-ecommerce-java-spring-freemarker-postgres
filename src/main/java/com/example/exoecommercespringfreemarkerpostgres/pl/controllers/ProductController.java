package com.example.exoecommercespringfreemarkerpostgres.pl.controllers;

import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.ArtPieceRepository;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.ArtPiece;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ProductController {

    private final ArtPieceRepository artPieceRepository;

    public ProductController(ArtPieceRepository artPieceRepository) {
        this.artPieceRepository = artPieceRepository;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("products", artPieceRepository.findAll());
        return "products/index";
    }


}