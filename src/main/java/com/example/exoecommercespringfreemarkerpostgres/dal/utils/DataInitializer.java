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

}