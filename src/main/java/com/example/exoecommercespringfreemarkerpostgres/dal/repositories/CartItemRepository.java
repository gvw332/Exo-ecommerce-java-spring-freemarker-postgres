package com.example.exoecommercespringfreemarkerpostgres.dal.repositories;

import com.example.exoecommercespringfreemarkerpostgres.dll.entities.CartItem;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    List<CartItem> findByUser(User user);
    Optional<CartItem> findByUserAndArtPieceId(User user, Long artPieceId);
    void deleteByUser(User user);
}