package com.example.exoecommercespringfreemarkerpostgres.dal.utils;

import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.ArtPieceRepository;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.ArtPiece;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.math.BigDecimal;

@Configuration
public class DataInitializer {

    @Bean
    CommandLineRunner initDatabase(ArtPieceRepository repository) {
        return args -> {
            if (repository.count() == 0) { // Pour éviter les doublons
                repository.save(ArtPiece.builder()
                        .title("La Nuit étoilée")
                        .artist("Vincent van Gogh")
                        .description("Un chef-d'œuvre post-impressionniste")
                        .price(BigDecimal.valueOf(1200.0))
                        .imageUrl("nuit_etoilee.jpg")
                        .build()
                );

                repository.save(ArtPiece.builder()
                        .title("Mona Lisa")
                        .artist("Leonardo da Vinci")
                        .description("Portrait iconique de la Renaissance")
                        .price(BigDecimal.valueOf(2500.0))
                        .imageUrl("mona_lisa.jpg")
                        .build()
                );

                repository.save(ArtPiece.builder()
                        .title("Le Cri")
                        .artist("Edvard Munch")
                        .description("Expression du tourment émotionnel")
                        .price(BigDecimal.valueOf(900.0))
                        .imageUrl("le_cri.jpg")
                        .build()
                );
            }
        };
    }
}
