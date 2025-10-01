package com.example.exoecommercespringfreemarkerpostgres.dal.repositories;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    @Query("select u from User u where u.username ilike :username")
    Optional<User> findByUsername(String username);

    boolean existsByUsername(String username); // ✅ Ajoute cette ligne
}