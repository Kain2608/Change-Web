package com.sportpj.sportpj.Model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "colors")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ColorModel { // Đổi tên thành ColorModel cho đồng bộ với ShoesModel
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name", nullable = false, unique = true)
    private String name;

    @Column(name = "code") 
    private String code;
}