package com.example.exoecommercespringfreemarkerpostgres.dll.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "cart_item")
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
    private ArtPiece artPiece;

    private int quantity;

    @ManyToOne
    private User user;
}
