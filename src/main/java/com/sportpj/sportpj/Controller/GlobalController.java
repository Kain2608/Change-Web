package com.sportpj.sportpj.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Service.ProfileService;

import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalController {
  @Autowired
  ProfileService profileService;
  @ModelAttribute("profile")
  public UserModel getInfo(HttpServletRequest request){
    return profileService.getCurrentUser(request);
  }
}
