package com.example.exoecommercespringfreemarkerpostgres.dal.repositories;

import com.example.exoecommercespringfreemarkerpostgres.dll.entities.CartItem;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {

    List<CartItem> findByUser(User user);
}
