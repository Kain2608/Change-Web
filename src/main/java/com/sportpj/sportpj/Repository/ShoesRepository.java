package com.sportpj.sportpj.Repository;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.ShoesModel;

@Repository
public interface ShoesRepository extends JpaRepository<ShoesModel, Long> {
    List<ShoesModel> findByStatus(String status);
    List<ShoesModel> findByCreatedBy(String createdBy); 
    List<ShoesModel> findByCategory_id(Long categoryId); 
    List<ShoesModel> findByStatusAndCreatedBy(String status, String createdBy);
    List<ShoesModel> findByCategory_idAndStatus(Long categoryId, String status);
    List<ShoesModel> findByCategory_idAndStatusIn(Long categoryId, List<String> status);
    boolean existsBySlug(String slug);
    long countByStatus(String status);
}