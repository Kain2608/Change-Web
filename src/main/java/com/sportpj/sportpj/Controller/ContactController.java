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

        contactService.saveContact(contactModel, request);
        
        List<UserModel> adminUsers = userRepository.findByRole("Admin"); 
        if (adminUsers != null && !adminUsers.isEmpty()) {
            for (UserModel admin : adminUsers) {
                notifyService.sentToUser(admin, contactModel);
            }
        }
        
        redirect.addFlashAttribute("success", "Gửi thành công");
        return "redirect:/contact";
    }
    @GetMapping("/admin/contact/list")
    public String ContactList() {
        return "contactList";
    }
    
}