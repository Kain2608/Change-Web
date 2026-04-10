package com.sportpj.sportpj.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.ContactModel;

@Repository
public interface ContactRepository extends JpaRepository<ContactModel, Long> {
  
}
