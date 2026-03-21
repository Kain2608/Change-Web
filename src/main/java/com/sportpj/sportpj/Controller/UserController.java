package com.sportpj.sportpj.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Service.UserService;





@Controller
public class UserController {
  @Autowired
  UserService userService;
  @GetMapping("/admin/register")
  public String getRegisterPage() {
      return "register";
  }
  @PostMapping("/admin/register")
public String register(@ModelAttribute UserModel user,
                       @RequestParam(required = false) Boolean agree,
                       RedirectAttributes redirect,
                       Model model) {

    if(agree == null || !agree) {
        redirect.addFlashAttribute("error", "Bạn phải đồng ý điều khoản");
        return "register";
    }

    if(!userService.register(user)) {
        redirect.addFlashAttribute("error", "Email đã tồn tại");
        return "register";
    }
    redirect.addFlashAttribute("success", "Bạn đã đăng ký tài khoản thành công");
    return "redirect:/admin/login";
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
