package com.sportpj.sportpj.Model;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
@Table(name = "wishlists") 
public class WishListModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "wishlist_id")
    private Integer id;
    @Column(name = "user_id")
    private Integer userId;
    @Column(name = "product_id")    
    private Integer productId; 
    @Column(name = "added_at")
    private LocalDateTime addedAt;

    public WishListModel() {
    }

    public WishListModel(Integer id, Integer userId, Integer productId, LocalDateTime addedAt) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.addedAt = addedAt;
    }

    public WishListModel(Integer userId, Integer productId, LocalDateTime createdAt) {
        this.userId = userId;
        this.productId = productId;
        this.addedAt = createdAt;
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

    public LocalDateTime getAddedAt() {
        return addedAt;
    }

    public void setAddedAt(LocalDateTime addedAt) {
        this.addedAt = addedAt;
    }
}
