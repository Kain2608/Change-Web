package com.sportpj.sportpj.Model;

import jakarta.persistence.*;

@Entity
@Table(name = "shoe_variants")
public class ShoeVariantModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // THAY ĐỔI: Chuyển String size thành mối quan hệ ManyToOne với SizeModel
    @ManyToOne
    @JoinColumn(name = "size_id") 
    private SizeModel size;

    // Giữ nguyên quan hệ với ColorModel
    @ManyToOne
    @JoinColumn(name = "color_id") 
    private ColorModel color;

    private Integer stockQuantity;

    @ManyToOne
    @JoinColumn(name = "shoe_id")
    private ShoesModel shoe;

    // --- Getters and Setters ---

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    // Sửa Getter/Setter cho SizeModel
    public SizeModel getSize() { return size; }
    public void setSize(SizeModel size) { this.size = size; }

    public ColorModel getColor() { return color; }
    public void setColor(ColorModel color) { this.color = color; }

    public Integer getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(Integer stockQuantity) { this.stockQuantity = stockQuantity; }

    public ShoesModel getShoe() { return shoe; }
    public void setShoe(ShoesModel shoe) { this.shoe = shoe; }
}