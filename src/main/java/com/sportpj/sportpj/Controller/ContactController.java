package com.sportpj.sportpj.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportpj.sportpj.Model.ContactModel;
import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Repository.UserRepository;
import com.sportpj.sportpj.Service.ContactService;
import com.sportpj.sportpj.Service.NotifyService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ContactController {
    @Autowired
    ContactService contactService;
    @Autowired
    NotifyService notifyService;
    @Autowired
    UserRepository userRepository;

    @GetMapping("/contact")
    public String getPage() {
        return "contact";
    }

    @PostMapping("/contact")
    public String postMethodName(@ModelAttribute ContactModel contactModel, Model model, RedirectAttributes redirect, HttpServletRequest request) {
        // 1. Lưu thông tin liên hệ
        contactService.saveContact(contactModel, request);
        
        // 2. Lấy TẤT CẢ các tài khoản có quyền Admin (Nhớ viết đúng chữ hoa/thường theo DB của bạn)
        List<UserModel> adminUsers = userRepository.findByRole("Admin"); 
        System.out.println("👉 Số lượng Admin tìm thấy trong DB: " + (adminUsers != null ? adminUsers.size() : 0));
        // 3. Gửi thông báo cho từng Admin
        if (adminUsers != null && !adminUsers.isEmpty()) {
            for (UserModel admin : adminUsers) {
                notifyService.sentToUser(admin, contactModel);
            }
        }
        
        redirect.addFlashAttribute("success", "Gửi thành công");
        return "redirect:/contact";
    }
}