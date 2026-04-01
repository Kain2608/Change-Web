package com.sportpj.sportpj.Controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sportpj.sportpj.Service.CartService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping
    public Map<String, Object> getCurrentUserCart(HttpServletRequest request) {
        return cartService.getCurrentUserCart(request);
    }

    @PostMapping("/add")
    public Map<String, Object> addToCart(@RequestBody AddToCartRequest body, HttpServletRequest request) {
        return cartService.addToCart(body.productId(), body.variantId(), body.quantity(), request);
    }

    @PatchMapping("/{cartId}/quantity")
    public Map<String, Object> updateQuantity(@PathVariable Integer cartId,
                                              @RequestBody UpdateQuantityRequest body,
                                              HttpServletRequest request) {
        return cartService.updateQuantity(cartId, body.quantity(), request);
    }

    @DeleteMapping("/{cartId}")
    public Map<String, Object> removeCartItem(@PathVariable Integer cartId, HttpServletRequest request) {
        return cartService.removeCartItem(cartId, request);
    }

    @DeleteMapping
    public Map<String, Object> clearCart(HttpServletRequest request) {
        return cartService.clearCurrentUserCart(request);
    }

    public record AddToCartRequest(Integer productId, Integer variantId, Integer quantity) {
    }

    public record UpdateQuantityRequest(Integer quantity) {
    }
}
