package com.sportpj.sportpj.Service;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.sportpj.sportpj.Model.RacketModel;
import com.sportpj.sportpj.Model.WishListModel;
import com.sportpj.sportpj.Repository.RacketRepository;
import com.sportpj.sportpj.Repository.WishListRepository;
import com.sportpj.sportpj.helpers.JwtHelper;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class WishListService {

    @Autowired
    private WishListRepository wishListRepository;

    @Autowired
    private RacketRepository racketRepository;

    @Autowired
    private JwtHelper jwtHelper;

    public Map<String, Object> getCurrentUserWishlist(HttpServletRequest request) {
        Integer userId = requireCurrentUserId(request);
        return buildWishlistSummary(userId);
    }

    public Map<String, Object> addToWishlist(Integer productId, HttpServletRequest request) {
        Integer userId = requireCurrentUserId(request);
        RacketModel product = getProductOrThrow(productId);

        boolean exists = wishListRepository.findByUserIdAndProductId(userId, productId).isPresent();
        if (!exists) {
            wishListRepository.save(new WishListModel(userId, productId, LocalDateTime.now()));
        }

        return Map.of(
                "message", exists ? "San pham da co trong wishlist" : "Da them san pham vao wishlist",
                "product", toProductSummary(product),
                "wishlist", buildWishlistSummary(userId));
    }

    public Map<String, Object> removeFromWishlist(Integer productId, HttpServletRequest request) {
        Integer userId = requireCurrentUserId(request);
        getProductOrThrow(productId);
        wishListRepository.deleteByUserIdAndProductId(userId, productId);

        return Map.of(
                "message", "Da xoa san pham khoi wishlist",
                "wishlist", buildWishlistSummary(userId));
    }

    public Map<String, Object> clearCurrentUserWishlist(HttpServletRequest request) {
        Integer userId = requireCurrentUserId(request);
        wishListRepository.deleteByUserId(userId);

        return Map.of(
                "message", "Da xoa toan bo wishlist",
                "wishlist", buildWishlistSummary(userId));
    }

    private Map<String, Object> buildWishlistSummary(Integer userId) {
        List<WishListModel> wishlistItems = wishListRepository.findByUserIdOrderByAddedAtDesc(userId);
        List<Map<String, Object>> items = wishlistItems.stream()
                .map(this::toWishlistItemResponse)
                .toList();
        List<Integer> productIds = wishListRepository.findProductIdsByUserId(userId);

        Map<String, Object> response = new LinkedHashMap<>();
        response.put("items", items);
        response.put("productIds", productIds);
        response.put("totalItems", items.size());
        return response;
    }

    private Map<String, Object> toWishlistItemResponse(WishListModel item) {
        RacketModel product = getProductOrThrow(item.getProductId());

        Map<String, Object> response = new LinkedHashMap<>();
        response.put("wishlistId", item.getId());
        response.put("productId", item.getProductId());
        response.put("addedAt", item.getAddedAt());
        response.put("product", toProductSummary(product));
        return response;
    }

    private Map<String, Object> toProductSummary(RacketModel product) {
        Map<String, Object> summary = new LinkedHashMap<>();
        summary.put("id", product.getId());
        summary.put("name", product.getName());
        summary.put("price", product.getPrice());
        summary.put("avatar", product.getAvatar());
        summary.put("brand", product.getBrand());
        summary.put("category", product.getCategory());
        summary.put("status", product.getStatus());
        return summary;
    }

    private RacketModel getProductOrThrow(Integer productId) {
        if (productId == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "productId la bat buoc");
        }

        return racketRepository.findById(Long.valueOf(productId))
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Khong tim thay san pham"));
    }

    private Integer requireCurrentUserId(HttpServletRequest request) {
        Long userId = jwtHelper.getUserId(request);
        if (userId == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Ban can dang nhap");
        }
        return Math.toIntExact(userId);
    }
}
