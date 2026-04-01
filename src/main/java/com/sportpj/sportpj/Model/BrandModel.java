package com.sportpj.sportpj.Model;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "brands")
public class BrandModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    private String name;

    private String description;

    private String logo;

    @Column(name = "status")
    private String status = "active";

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getLogo() { return logo; }
    public void setLogo(String logo) { this.logo = logo; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}