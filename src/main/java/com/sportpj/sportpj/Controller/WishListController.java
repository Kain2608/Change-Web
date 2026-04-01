package com.sportpj.sportpj.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sportpj.sportpj.Service.WishListService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/wishlist")
public class WishListController {

    @Autowired
    private WishListService wishListService;

    @GetMapping
    public Map<String, Object> getCurrentUserWishlist(HttpServletRequest request) {
        return wishListService.getCurrentUserWishlist(request);
    }

    @PostMapping("/{productId}")
    public Map<String, Object> addToWishlist(@PathVariable Integer productId, HttpServletRequest request) {
        return wishListService.addToWishlist(productId, request);
    }

    @DeleteMapping("/{productId}")
    public Map<String, Object> removeFromWishlist(@PathVariable Integer productId, HttpServletRequest request) {
        return wishListService.removeFromWishlist(productId, request);
    }

    @DeleteMapping
    public Map<String, Object> clearWishlist(HttpServletRequest request) {
        return wishListService.clearCurrentUserWishlist(request);
    }
}
