package com.example.exoecommercespringfreemarkerpostgres.dal.utils;

import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.ArtPieceRepository;
import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.UserRepository;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.ArtPiece;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.User;
import com.example.exoecommercespringfreemarkerpostgres.dll.enums.UserRole;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.math.BigDecimal;

@Configuration
public class DataInitializer {

    @Bean
    CommandLineRunner initUsers(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        return args -> {
            if (userRepository.count() == 0) {
                userRepository.save(User.builder()
                        .username("admin")
                        .email("admin@example.com")
                        .password(passwordEncoder.encode("admin123"))
                        .role(UserRole.ADMIN)
                        .build()
                );

                userRepository.save(User.builder()
                        .username("user")
                        .email("user@example.com")
                        .password(passwordEncoder.encode("user123"))
                        .role(UserRole.USER)
                        .build()
                );
            }
        };
    }

    @Bean
    CommandLineRunner initArtPieces(ArtPieceRepository artPieceRepository) {
        return args -> {
            if (artPieceRepository.count() == 0) {
                String[] titles = {
                        "La Joconde", "La Nuit étoilée", "Le Cri", "La Jeune Fille à la perle",
                        "Les Tournesols", "Guernica", "La Naissance de Vénus", "Le Baiser",
                        "La Persistance de la mémoire", "La Laitière", "Les Nymphéas",
                        "La Liberté guidant le peuple", "Le Déjeuner sur l'herbe", "Les Demoiselles d'Avignon",
                        "La Ronde de nuit", "La Création d'Adam", "Le Radeau de la Méduse",
                        "Impression, soleil levant", "La Chambre de Van Gogh", "Le Jardin des délices",
                        "Les Époux Arnolfini", "La Grande Vague de Kanagawa", "La Danse",
                        "Le Penseur", "Les Ménines", "L'Origine du monde", "La Mort de Marat",
                        "Le Tricheur à l'as de carreau", "La Dentellière", "Le Verrou"
                };

                String[] artists = {
                        "Léonard de Vinci", "Vincent van Gogh", "Edvard Munch", "Johannes Vermeer",
                        "Vincent van Gogh", "Pablo Picasso", "Sandro Botticelli", "Gustav Klimt",
                        "Salvador Dalí", "Johannes Vermeer", "Claude Monet",
                        "Eugène Delacroix", "Édouard Manet", "Pablo Picasso",
                        "Rembrandt", "Michel-Ange", "Théodore Géricault",
                        "Claude Monet", "Vincent van Gogh", "Jérôme Bosch",
                        "Jan van Eyck", "Katsushika Hokusai", "Henri Matisse",
                        "Auguste Rodin", "Diego Vélasquez", "Gustave Courbet", "Jacques-Louis David",
                        "Georges de La Tour", "Johannes Vermeer", "Jean-Honoré Fragonard"
                };

                String[] descriptions = {
                        "Chef-d'œuvre de la Renaissance italienne",
                        "Peinture post-impressionniste emblématique",
                        "Œuvre expressionniste norvégienne iconique",
                        "Portrait baroque néerlandais mystérieux",
                        "Série de natures mortes éclatantes",
                        "Manifeste cubiste contre la guerre",
                        "Allégorie mythologique de la Renaissance",
                        "Symbole de l'Art nouveau viennois",
                        "Peinture surréaliste onirique",
                        "Scène de genre du Siècle d'or néerlandais",
                        "Série impressionniste contemplative",
                        "Allégorie romantique révolutionnaire",
                        "Œuvre réaliste provocatrice",
                        "Révolution cubiste de la forme",
                        "Portrait de groupe baroque monumental",
                        "Fresque de la chapelle Sixtine",
                        "Peinture d'histoire romantique dramatique",
                        "Tableau fondateur de l'impressionnisme",
                        "Intérieur post-impressionniste intime",
                        "Triptyque flamand fantastique",
                        "Portrait de mariage Renaissance symbolique",
                        "Estampe japonaise célèbre",
                        "Œuvre fauviste dynamique",
                        "Sculpture en bronze monumental",
                        "Chef-d'œuvre baroque espagnol",
                        "Peinture réaliste controversée",
                        "Peinture néoclassique dramatique",
                        "Scène de genre caravagesque",
                        "Portrait intimiste baroque",
                        "Peinture rococo galante"
                };

                for (int i = 0; i < 30; i++) {
                    artPieceRepository.save(ArtPiece.builder()
                            .title(titles[i])
                            .artist(artists[i])
                            .description(descriptions[i])
                            .price(BigDecimal.valueOf(500 + (i * 150)))
                            .imageUrl("https://picsum.photos/seed/" + (i + 1) + "/600/800")
                            .build()
                    );
                }
            }
        };
    }
}