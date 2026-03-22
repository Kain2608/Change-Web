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
import com.sportpj.sportpj.Service.JwtAuthService;
import com.sportpj.sportpj.Service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// @ModelAttribute dùng để map dữ liệu từ form HTML về object Java
// Spring tự động lấy giá trị của input theo name và gán vào thuộc tính tương ứng của model
// Nếu không dùng @ModelAttribute, có thể dùng @RequestParam để lấy từng giá trị input riêng lẻ
// Tên name trong form phải trùng với thuộc tính của model để Spring map tự động
// Nếu tên khác, dùng @ModelAttribute("tên khác") để map chính xác
// Với file upload, input <input type="file" name="avatar"> không tự map vào model
// File upload phải dùng @RequestPart(name="avatar") MultipartFile avatarFile trong controller
// Các input khác vẫn tự map vào @ModelAttribute nếu tên trùng với thuộc tính model
// Nếu không cần object, có thể dùng @RequestParam cho từng input, nhưng không map thành object
// Quy tắc tổng quát:
// input name = thuộc tính model → map tự động
// file upload → dùng @RequestPart
// model name trong form và @ModelAttribute → nên trùng hoặc khai báo đúng


@Controller
public class UserController {
  @Autowired
  UserService userService;
  @Autowired
  JwtAuthService jwtAuthService;
  
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
        return "redirect:/admin/register";
    }

    if(!userService.register(user)) {
        redirect.addFlashAttribute("error", "Email đã tồn tại");
        return "redirect:/admin/register";
    }
    redirect.addFlashAttribute("success", "Bạn đã đăng ký tài khoản thành công");
    return "redirect:/admin/login";
}
  @GetMapping("/admin/login")
  public String getLoginPage(Model model) {
      return "login";
  }
  
  @PostMapping("/admin/login")
  public String loginPost(RedirectAttributes redirect,@RequestParam String email, @RequestParam String password,HttpServletResponse response) {
    if(!userService.checkLogin(email, password)){
        redirect.addFlashAttribute("error", "Tài khoản hoặc mật khẩu không đúng");
        return "redirect:/admin/login";
    }
    
    UserModel userModel = userService.findByEmail(email);
    String token = jwtAuthService.generateToken(email, userModel.getId());
    jwtAuthService.addTokenCookie(response, token);
    redirect.addFlashAttribute("success", "Đăng nhập thành công");
    return "redirect:/admin/dashboard";
  }
  
  @GetMapping("/admin/dashboard")
  public String getDashboardPage(HttpServletRequest request) {
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("token")){
                var data = jwtAuthService.validateToken(cookie.getValue());
                if(data != null){
                    return "dashboard";
                }
            }
        }
    }
      return "redirect:/admin/login";
  }
  @GetMapping("/admin/logout")
    public String logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("token", null);
        cookie.setHttpOnly(true);
        cookie.setPath("/");
        cookie.setMaxAge(0); 
        response.addCookie(cookie);
        return "redirect:/admin/login";
    }
}
