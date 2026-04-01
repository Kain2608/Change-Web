package com.sportpj.sportpj.Model;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.*;

@Entity
@Table(name = "cart_items")
public class CartModel {
    
    @Id   
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cart_id")
    private Integer id;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "product_id")
    private Integer productId;

    @Column(name = "variant_id")
    private Integer variantId; 

    @Column(name = "quantity")
    private Integer quantity; 

    @CreationTimestamp 
    @Column(name = "added_at", updatable = false)
    private LocalDateTime addedAt;

    @UpdateTimestamp 
    @Column(name = "updated_at")
    private LocalDateTime updatedAt; 

    public CartModel() {
    }

    public CartModel(Integer id, Integer userId, Integer productId, Integer variantId, Integer quantity,
            LocalDateTime addedAt, LocalDateTime updatedAt) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.variantId = variantId;
        this.quantity = quantity;
        this.addedAt = addedAt;
        this.updatedAt = updatedAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getVariantId() {
        return variantId;
    }

    public void setVariantId(Integer variantId) {
        this.variantId = variantId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public LocalDateTime getAddedAt() {
        return addedAt;
    }

    public void setAddedAt(LocalDateTime addedAt) {
        this.addedAt = addedAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
