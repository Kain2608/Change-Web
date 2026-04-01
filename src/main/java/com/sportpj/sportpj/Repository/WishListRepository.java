package com.sportpj.sportpj.Repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.WishListModel;

@Repository
public interface WishListRepository  extends JpaRepository<WishListModel, Integer>  {
    void deleteByUserIdAndProductId(Integer userId, Integer productId);
    Optional<WishListModel> findByUserIdAndProductId(Integer userId, Integer productId);

    @Query("SELECT w.productId FROM WishListModel w WHERE w.userId = :userId")
    List<Integer> findProductIdsByUserId(@Param("userId") Integer userId);
    List<WishListModel> findByUserIdOrderByAddedAtDesc(Integer userId);
    void deleteByUserId(Integer userId);
}
