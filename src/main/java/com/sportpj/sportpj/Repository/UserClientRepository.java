package com.sportpj.sportpj.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.UserClient;

@Repository
public interface UserClientRepository extends JpaRepository<UserClient, Long> {
    Optional<UserClient> findByEmail(String email);
    Optional<UserClient> findByOtpCode(String otpCode);
}
