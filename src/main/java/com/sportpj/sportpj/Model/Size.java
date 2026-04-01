package com.sportpj.sportpj.Model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "sizes")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Size {

    @Id
    @Column(name = "size_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "size_name", nullable = false)
    private String name;

    @Column(name = "size_order")
    private Integer order;
}
