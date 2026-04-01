package com.sportpj.sportpj.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.ShoesModel;

@Repository
public interface ShoesRepository extends JpaRepository<ShoesModel, Long> {
}