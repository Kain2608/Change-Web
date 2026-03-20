package com.sportpj.sportpj.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;





@Controller
public class UserController {
  @GetMapping("/admin/register")
  public String getRegisterPage() {
      return "register";
  }
  
  @GetMapping("/admin/login")
  public String getLoginPage(Model model) {
      return "login";
  }
  @GetMapping("/admin/dashboard")
  public String getDashboardPage() {
      return "dashboard";
  }
  
}
