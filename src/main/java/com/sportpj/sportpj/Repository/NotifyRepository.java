package com.sportpj.sportpj.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sportpj.sportpj.Model.NotificationModel;
@Repository
public interface NotifyRepository extends JpaRepository<NotificationModel, Long> {
  List<NotificationModel> findByRecipientIdAndIsReadFalse(String userId);
}
