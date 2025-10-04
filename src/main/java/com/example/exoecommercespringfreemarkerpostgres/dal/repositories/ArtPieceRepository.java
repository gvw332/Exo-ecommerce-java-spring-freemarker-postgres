package com.example.exoecommercespringfreemarkerpostgres.dal.repositories;

import com.example.exoecommercespringfreemarkerpostgres.dll.entities.ArtPiece;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ArtPieceRepository extends JpaRepository<ArtPiece, Long> {

    @Query("SELECT a FROM ArtPiece a WHERE " +
            "LOWER(a.title) LIKE LOWER(CONCAT('%', :search, '%')) OR " +
            "LOWER(a.artist) LIKE LOWER(CONCAT('%', :search, '%'))")
    Page<ArtPiece> searchArtPieces(@Param("search") String search, Pageable pageable);

    Page<ArtPiece> findAll(Pageable pageable);
}