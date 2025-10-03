package com.example.exoecommercespringfreemarkerpostgres.bll.services;

import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.ArtPieceRepository;
import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.CartItemRepository;
import com.example.exoecommercespringfreemarkerpostgres.dal.repositories.UserRepository;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.ArtPiece;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.CartItem;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartService {

    private final CartItemRepository cartItemRepository;
    private final ArtPieceRepository artPieceRepository;
    private final UserRepository userRepository;

    public List<CartItem> getCartItems(String username) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
        return cartItemRepository.findByUser(user);
    }

    @Transactional
    public void addToCart(String username, Long artPieceId, Integer quantity) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));

        ArtPiece artPiece = artPieceRepository.findById(artPieceId)
                .orElseThrow(() -> new RuntimeException("Tableau non trouvé"));

        // Vérifier si l'article existe déjà dans le panier
        Optional<CartItem> existingItem = cartItemRepository.findByUserAndArtPieceId(user, artPieceId);

        if (existingItem.isPresent()) {
            // Augmenter la quantité
            CartItem item = existingItem.get();
            item.setQuantity(item.getQuantity() + quantity);
            cartItemRepository.save(item);
        } else {
            // Créer un nouvel article
            CartItem newItem = CartItem.builder()
                    .user(user)
                    .artPiece(artPiece)
                    .quantity(quantity)
                    .build();
            cartItemRepository.save(newItem);
        }
    }

    @Transactional
    public void updateQuantity(Long cartItemId, Integer quantity) {
        CartItem item = cartItemRepository.findById(cartItemId)
                .orElseThrow(() -> new RuntimeException("Article non trouvé"));

        if (quantity <= 0) {
            cartItemRepository.delete(item);
        } else {
            item.setQuantity(quantity);
            cartItemRepository.save(item);
        }
    }

    @Transactional
    public void removeFromCart(Long cartItemId) {
        cartItemRepository.deleteById(cartItemId);
    }

    @Transactional
    public void clearCart(String username) {
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
        cartItemRepository.deleteByUser(user);
    }

    public BigDecimal getCartTotal(String username) {
        List<CartItem> items = getCartItems(username);
        return items.stream()
                .map(CartItem::getSubtotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

    public int getCartItemCount(String username) {
        List<CartItem> items = getCartItems(username);
        return items.stream()
                .mapToInt(CartItem::getQuantity)
                .sum();
    }
}