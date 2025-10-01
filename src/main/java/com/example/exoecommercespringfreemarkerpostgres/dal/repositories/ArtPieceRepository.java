package com.example.exoecommercespringfreemarkerpostgres.dal.repositories;

import com.example.exoecommercespringfreemarkerpostgres.dll.entities.ArtPiece;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArtPieceRepository extends JpaRepository<ArtPiece, Long> {

    List<ArtPiece> findByArtistContainingIgnoreCase(String artist);

    List<ArtPiece> findByTitleContainingIgnoreCase(String title);
}
