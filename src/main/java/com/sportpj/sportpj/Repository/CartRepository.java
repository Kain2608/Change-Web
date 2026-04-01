package com.sportpj.sportpj.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.CartModel;

@Repository
public interface CartRepository  extends JpaRepository<CartModel, Integer>  {

    List<CartModel> findByUserIdOrderByUpdatedAtDesc(Integer userId);
    Optional<CartModel> findByUserIdAndProductIdAndVariantId(Integer userId, Integer productId, Integer variantId);
    Optional<CartModel> findByIdAndUserId(Integer id, Integer userId);
    void deleteByUserId(Integer userId);
}
