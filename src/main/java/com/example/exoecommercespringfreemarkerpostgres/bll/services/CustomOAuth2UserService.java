package com.example.exoecommercespringfreemarkerpostgres.bll.services;

import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.UserRepository;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.User;
import com.example.exoecommercespringfreemarkerpostgres.dll.enums.UserRole;
import lombok.RequiredArgsConstructor;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final UserRepository userRepository;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oauth2User = super.loadUser(userRequest);

        String email = oauth2User.getAttribute("email");
        String name = oauth2User.getAttribute("name");

        // Chercher ou créer l'utilisateur
        Optional<User> userOptional = userRepository.findByEmail(email);

        User user;
        if (userOptional.isEmpty()) {
            // Créer un nouvel utilisateur
            user = User.builder()
                    .username(name)
                    .email(email)
                    .provider("google")
                    .role(UserRole.USER)
                    .build();
            userRepository.save(user);
        } else {
            user = userOptional.get();
        }

        // Retourne notre custom OAuth2User au lieu de oauth2User directement
        return new CustomOAuth2User(oauth2User, user);
    }
}