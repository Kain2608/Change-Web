package com.sportpj.sportpj.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.ColorModel;

@Repository
public interface ColorRepository extends JpaRepository<ColorModel, Integer> {

    Optional<ColorModel> findByName(String name);

}