package com.example.exoecommercespringfreemarkerpostgres.dll.entities;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "cart_items")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CartItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "art_piece_id", nullable = false)
    private ArtPiece artPiece;

    @Column(nullable = false)
    private Integer quantity = 1;

    // Méthode utile pour calculer le sous-total
    public BigDecimal getSubtotal() {
        return artPiece.getPrice().multiply(BigDecimal.valueOf(quantity));
    }
}