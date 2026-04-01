package com.sportpj.sportpj.Repository;

import com.sportpj.sportpj.Model.ShoeVariantModel;
import com.sportpj.sportpj.Model.ShoesModel; // Nhớ import model Shoes
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Repository
public interface ShoeVariantRepository extends JpaRepository<ShoeVariantModel, Long> {
    
    List<ShoeVariantModel> findByShoeId(Long shoeId);

    ShoeVariantModel findByShoeIdAndSize_IdAndColor_Id(Long shoeId, Integer sizeId, Integer colorId);

    List<ShoeVariantModel> findByShoeIdAndStockQuantityGreaterThan(Long shoeId, Integer quantity);
    @Transactional
    void deleteByShoe(ShoesModel shoe);
}