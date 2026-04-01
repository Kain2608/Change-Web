package com.sportpj.sportpj.Model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table (name = "colors")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Color {
    @Id
    @Column(name = "color_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "color_name", nullable = false)
    private String name;
    @Column(name = "color_code" )
    private String code; 

}
