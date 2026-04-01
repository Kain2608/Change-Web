package com.sportpj.sportpj.Repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.ShoesModel;

@Repository
public interface ShoesRepository extends JpaRepository<ShoesModel, Long> {
    List<ShoesModel> findByStatus(String status);
    List<ShoesModel> findByCreatedBy(String createdBy); 
    List<ShoesModel> findByStatusAndCreatedBy(String status, String createdBy);
    boolean existsBySlug(String slug);
    long countByStatus(String status);
}