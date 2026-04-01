package com.sportpj.sportpj.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.BagModel;

@Repository
public interface BagRepository extends JpaRepository<BagModel, Long> {
}