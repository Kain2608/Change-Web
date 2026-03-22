package com.sportpj.sportpj.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.CategoryModel;
import java.util.List;


@Repository
public interface CategoryRepository extends JpaRepository<CategoryModel, Long>{
  List<CategoryModel> findByStatus(String status);
}
