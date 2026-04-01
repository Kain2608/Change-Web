package com.sportpj.sportpj.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.sportpj.sportpj.Model.CartModel;
import com.sportpj.sportpj.Model.RacketModel;
import com.sportpj.sportpj.Repository.CartRepository;
import com.sportpj.sportpj.Repository.RacketRepository;
import com.sportpj.sportpj.helpers.JwtHelper;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private RacketRepository racketRepository;

    @Autowired
    private JwtHelper jwtHelper;

    public Map<String, Object> getCurrentUserCart(HttpServletRequest request) {
        Integer userId = requireCurrentUserId(request);
        return buildCartSummary(userId);
    }

    public Map<String, Object> addToCart(Integer productId, Integer variantId, Integer quantity, HttpServletRequest request) {
        Integer userId = requireCurrentUserId(request);
        int normalizedQuantity = normalizeQuantity(quantity);
        RacketModel product = getProductOrThrow(productId);

        CartModel cartItem = cartRepository
                .findByUserIdAndProductIdAndVariantId(userId, productId, variantId)
                .orElseGet(CartModel::new);

        if (cartItem.getId() == null) {
            cartItem.setUserId(userId);
            cartItem.setProductId(productId);
            cartItem.setVariantId(variantId);
            cartItem.setQuantity(normalizedQuantity);
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + normalizedQuantity);
        }

        cartRepository.save(cartItem);

        return Map.of(
                "message", "Da them san pham vao gio hang",
                "product", toProductSummary(product),
                "cart", buildCartSummary(userId));
    }

    public Map<String, Object> updateQuantity(Integer cartId, Integer quantity, HttpServletRequest request) {
        Integer userId = requireCurrentUserId(request);
        CartModel cartItem = getOwnedCartItem(cartId, userId);

        if (quantity == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "So luong khong hop le");
        }

        if (quantity <= 0) {
            cartRepository.delete(cartItem);
            return Map.of(
                    "message", "Da xoa san pham khoi gio hang",
                    "cart", buildCartSummary(userId));
        }

        cartItem.setQuantity(quantity);
        cartRepository.save(cartItem);

        return Map.of(
                "message", "Da cap nhat so luong san pham",
                "cart", buildCartSummary(userId));
    }

    public Map<String, Object> removeCartItem(Integer cartId, HttpServletRequest request) {
        Integer userId = requireCurrentUserId(request);
        CartModel cartItem = getOwnedCartItem(cartId, userId);
        cartRepository.delete(cartItem);

        return Map.of(
                "message", "Da xoa san pham khoi gio hang",
                "cart", buildCartSummary(userId));
    }

    public Map<String, Object> clearCurrentUserCart(HttpServletRequest request) {
        Integer userId = requireCurrentUserId(request);
        cartRepository.deleteByUserId(userId);

        return Map.of(
                "message", "Da xoa toan bo gio hang",
                "cart", buildCartSummary(userId));
    }

    private Map<String, Object> buildCartSummary(Integer userId) {
        List<CartModel> cartItems = cartRepository.findByUserIdOrderByUpdatedAtDesc(userId);
        List<Map<String, Object>> items = cartItems.stream()
                .map(this::toCartItemResponse)
                .toList();

        int totalQuantity = cartItems.stream()
                .map(CartModel::getQuantity)
                .filter(q -> q != null && q > 0)
                .mapToInt(Integer::intValue)
                .sum();

        long grandTotal = items.stream()
                .map(item -> (Long) item.get("lineTotal"))
                .mapToLong(Long::longValue)
                .sum();

        Map<String, Object> response = new LinkedHashMap<>();
        response.put("items", items);
        response.put("totalItems", items.size());
        response.put("totalQuantity", totalQuantity);
        response.put("grandTotal", grandTotal);
        return response;
    }

    private Map<String, Object> toCartItemResponse(CartModel cartItem) {
        RacketModel product = getProductOrThrow(cartItem.getProductId());
        long lineTotal = (long) safePrice(product) * safeQuantity(cartItem);

        Map<String, Object> item = new LinkedHashMap<>();
        item.put("cartId", cartItem.getId());
        item.put("productId", cartItem.getProductId());
        item.put("variantId", cartItem.getVariantId());
        item.put("quantity", cartItem.getQuantity());
        item.put("addedAt", cartItem.getAddedAt());
        item.put("updatedAt", cartItem.getUpdatedAt());
        item.put("lineTotal", lineTotal);
        item.put("product", toProductSummary(product));
        return item;
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

    private CartModel getOwnedCartItem(Integer cartId, Integer userId) {
        return cartRepository.findByIdAndUserId(cartId, userId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Khong tim thay san pham trong gio hang"));
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

    private int normalizeQuantity(Integer quantity) {
        if (quantity == null) {
            return 1;
        }
        if (quantity <= 0) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "So luong phai lon hon 0");
        }
        return quantity;
    }

    private int safePrice(RacketModel product) {
        return product.getPrice() == null ? 0 : product.getPrice();
    }

    private int safeQuantity(CartModel cartItem) {
        return cartItem.getQuantity() == null ? 0 : cartItem.getQuantity();
    }
}
