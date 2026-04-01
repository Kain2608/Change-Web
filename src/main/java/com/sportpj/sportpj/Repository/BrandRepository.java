package com.sportpj.sportpj.Repository;

import com.sportpj.sportpj.Model.BrandModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BrandRepository extends JpaRepository<BrandModel, Integer> {
    List<BrandModel> findByStatus(String status);
}