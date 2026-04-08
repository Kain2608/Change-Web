package com.sportpj.sportpj.Repository;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.RacketModel;

@Repository
public interface RacketRepository extends JpaRepository<RacketModel, Long> {
    List<RacketModel> findByStatus(String status);
    List<RacketModel> findByCreatedBy(String createdBy); 
    List<RacketModel> findByStatusAndCreatedBy(String status, String createdBy);
    List<RacketModel> findByCategory_idAndStatus(Long categoryId, String status);
    List<RacketModel> findByCategory_id(Long categoryId); 
    List<RacketModel> findByCategory_idAndStatusIn(Long categoryId, List<String> status);
    boolean existsBySlug(String slug);
    long countByStatus(String status);
}  