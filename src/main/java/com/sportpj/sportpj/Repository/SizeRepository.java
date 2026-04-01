package com.sportpj.sportpj.Repository;

import com.sportpj.sportpj.Model.SizeModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SizeRepository extends JpaRepository<SizeModel, Integer> {

}