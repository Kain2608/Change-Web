package com.sportpj.sportpj.Model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "shoes")
public class ShoesModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    // Chuyển Category sang Model (Khuyên dùng đồng bộ với Brand)
    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryModel category;

    // CHỖ BẠN CẦN: Chuyển Brand sang Model
    @ManyToOne
    @JoinColumn(name = "brand_id")
    private BrandModel brand;

    @OneToMany(mappedBy = "shoe", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ShoeVariantModel> variants;

    private String target;
    private Integer price;
    private Integer newPrice;
    private String avatar;

    @Column(columnDefinition = "TEXT") 
    private String description;

    private String status;
    private String createdBy;
    private String updatedBy;
    private String slug;
    private String type = "shoes";

    @CreationTimestamp
    @Column(updatable = false, columnDefinition = "DATETIME(0)")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(columnDefinition = "DATETIME(0)")
    private LocalDateTime updatedAt;

    // --- GETTERS & SETTERS ---

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    // Getter/Setter mới cho Category
    public CategoryModel getCategory() { return category; }
    public void setCategory(CategoryModel category) { this.category = category; }

    // Getter/Setter mới cho Brand
    public BrandModel getBrand() { return brand; }
    public void setBrand(BrandModel brand) { this.brand = brand; }

    public List<ShoeVariantModel> getVariants() { return variants; }
    public void setVariants(List<ShoeVariantModel> variants) { this.variants = variants; }

    public String getTarget() { return target; }
    public void setTarget(String target) { this.target = target; }

    public Integer getPrice() { return price; }
    public void setPrice(Integer price) { this.price = price; }

    public Integer getNewPrice() { return newPrice; }
    public void setNewPrice(Integer newPrice) { this.newPrice = newPrice; }

    public String getAvatar() { return avatar; }
    public void setAvatar(String avatar) { this.avatar = avatar; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }

    public String getUpdatedBy() { return updatedBy; }
    public void setUpdatedBy(String updatedBy) { this.updatedBy = updatedBy; }

    public String getSlug() { return slug; }
    public void setSlug(String slug) { this.slug = slug; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }

    public String getCreatedAtFormatted() {
        if (createdAt == null) return null;
        return createdAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public String getUpdatedAtFormatted() {
        if (updatedAt == null) return null;
        return updatedAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }
    public double getRandomRating() {
        return Math.round((4.0 + Math.random()) * 10.0) / 10.0;
    }

    public int getRandomReviewCount() {
        return (int) (Math.random() * 400) + 15;
    }
}