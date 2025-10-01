package com.example.exoecommercespringfreemarkerpostgres.dll.entities;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import java.io.Serializable;
import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = {"id"})
@ToString(of = {"id"})
@Getter
@MappedSuperclass
public class BaseEntity<T extends Serializable> {

    @Id
    @GeneratedValue
    private T id;

    @Column(name = "CREATED_AT", nullable = false, updatable = false)
    @CreationTimestamp
    private LocalDateTime createdAt;

    @Column(name = "UPDATED_AT", nullable = false, updatable = false)
    @UpdateTimestamp
    private LocalDateTime updatedAt;

}