package com.sportpj.sportpj.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.RacketModel;

@Repository
public interface RacketRepository extends JpaRepository<RacketModel, Long> {
}