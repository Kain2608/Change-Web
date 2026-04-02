package com.sportpj.sportpj.Model;

import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "rackets")
@Data 
public class RacketModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String slug;
    private String avatar;
    
    @Column(columnDefinition = "TEXT")
    private String description;

    private Integer price;    
    private Integer newPrice; 
    private Integer stock;    

    private String weight;       
    private String gripSize;     
    private String tension;      
    private String balancePoint; 
    private String stiffness;    
    private String length;       

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryModel category;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private BrandModel brand;

    private String status = "active";
    private String type = "racket"; 

    private String createdBy;
    private String updatedBy;

    @CreationTimestamp
    @Column(updatable = false, columnDefinition = "DATETIME(0)")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(columnDefinition = "DATETIME(0)")
    private LocalDateTime updatedAt;


    public String getFormattedPrice() {
        if (newPrice == null) return "Liên hệ";
        NumberFormat nf = NumberFormat.getInstance(new Locale("vi", "VN"));
        return nf.format(newPrice) + "₫";
    }

    public int getDiscountPercent() {
        if (price == null || newPrice == null || price <= newPrice) return 0;
        double discount = ((double) (price - newPrice) / price) * 100;
        return (int) Math.round(discount);
    }

    public String getCreatedAtFormatted() {
        return createdAt != null ? createdAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) : null;
    }

    public String getUpdatedAtFormatted() {
        return updatedAt != null ? updatedAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) : null;
    }
}