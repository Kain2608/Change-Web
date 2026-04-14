package com.sportpj.sportpj.Controller;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportpj.sportpj.Model.UserClient;
import com.sportpj.sportpj.Repository.UserClientRepository;
import com.sportpj.sportpj.Service.EmailService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/client")
public class UserClientAuthController {

    @Autowired
    private UserClientRepository userClientRepository;

    @Autowired
    private EmailService emailService;

    // ----- UTILS -----

    private String generateOtp() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    // ----- LOGIN -----

    @GetMapping("/login")
    public String getLoginPage() {
        return "clientLogin";
    }

    @PostMapping("/login")
    public String loginPost(@RequestParam String email,
                            @RequestParam String password,
                            HttpSession session,
                            RedirectAttributes redirect) {
        
        Optional<UserClient> userOpt = userClientRepository.findByEmail(email);
        
        if (userOpt.isPresent()) {
            UserClient user = userOpt.get();
            if ("pending".equals(user.getStatus())) {
                redirect.addFlashAttribute("error", "Tài khoản của bạn chưa xác thực email.");
                return "redirect:/client/login";
            }
            if (password.equals(user.getPassword())) {
                session.setAttribute("clientUser", user);
                return "redirect:/"; // return to client main page
            }
        }

        redirect.addFlashAttribute("error", "Email hoặc mật khẩu không chính xác");
        return "redirect:/client/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("clientUser");
        return "redirect:/";
    }

    // ----- REGISTER -----

    @GetMapping("/register")
    public String getRegisterPage() {
        return "clientRegister";
    }

    @PostMapping("/register")
    public String registerPost(@ModelAttribute UserClient clientParam,
                               @RequestParam String confirmPassword,
                               HttpSession session,
                               RedirectAttributes redirect) {
        
        if (!clientParam.getPassword().equals(confirmPassword)) {
            redirect.addFlashAttribute("error", "Mật khẩu xác nhận không khớp.");
            return "redirect:/client/register";
        }

        Optional<UserClient> existing = userClientRepository.findByEmail(clientParam.getEmail());
        if (existing.isPresent()) {
            redirect.addFlashAttribute("error", "Email này đã được sử dụng.");
            return "redirect:/client/register";
        }

        String otp = generateOtp();
        clientParam.setOtpCode(otp);
        clientParam.setOtpExpiryTime(LocalDateTime.now().plusMinutes(5));
        clientParam.setStatus("pending");
        
        userClientRepository.save(clientParam);
        
        emailService.sendOtpEmail(clientParam.getEmail(), otp, "Mã xác nhận đăng ký tài khoản");

        session.setAttribute("verifyEmail", clientParam.getEmail());
        redirect.addFlashAttribute("success", "Vui lòng kiểm tra email để lấy số OTP.");
        return "redirect:/client/verify-otp";
    }

    // ----- VERIFY OTP -----

    @GetMapping("/verify-otp")
    public String getVerifyOtpPage(HttpSession session, RedirectAttributes redirect) {
        if (session.getAttribute("verifyEmail") == null) {
             return "redirect:/client/register";
        }
        return "clientVerifyOtp";
    }

    @PostMapping("/verify-otp")
    public String verifyOtpPost(@RequestParam String otpCode,
                                HttpSession session,
                                RedirectAttributes redirect) {
        
        String email = (String) session.getAttribute("verifyEmail");
        if (email == null) {
            redirect.addFlashAttribute("error", "Không tìm thấy phiên xác thực.");
            return "redirect:/client/register";
        }

        Optional<UserClient> userOpt = userClientRepository.findByEmail(email);
        if (userOpt.isPresent()) {
            UserClient user = userOpt.get();
            if (user.getOtpCode() != null && user.getOtpCode().equals(otpCode)) {
                if (user.getOtpExpiryTime().isBefore(LocalDateTime.now())) {
                    redirect.addFlashAttribute("error", "Mã OTP đã hết hạn.");
                    return "redirect:/client/verify-otp";
                }
                
                // Mở khóa tài khoản
                user.setStatus("active");
                user.setOtpCode(null);
                user.setOtpExpiryTime(null);
                userClientRepository.save(user);

                session.removeAttribute("verifyEmail");
                redirect.addFlashAttribute("success", "Xác thực thành công. Vui lòng đăng nhập.");
                return "redirect:/client/login";
            }
        }

        redirect.addFlashAttribute("error", "Mã OTP không chính xác.");
        return "redirect:/client/verify-otp";
    }

    // ----- FORGOT PASSWORD -----

    @GetMapping("/forgot-password")
    public String getForgotPasswordPage() {
        return "clientForgotPassword";
    }

    @PostMapping("/forgot-password")
    public String forgotPasswordPost(@RequestParam String email,
                                     HttpSession session,
                                     RedirectAttributes redirect) {
        
        Optional<UserClient> userOpt = userClientRepository.findByEmail(email);
        if (userOpt.isPresent()) {
            UserClient user = userOpt.get();
            String otp = generateOtp();
            user.setOtpCode(otp);
            user.setOtpExpiryTime(LocalDateTime.now().plusMinutes(5));
            userClientRepository.save(user);

            emailService.sendOtpEmail(email, otp, "Mã khôi phục mật khẩu");
            session.setAttribute("resetEmail", email);
            redirect.addFlashAttribute("success", "Vui lòng kiểm tra email để lấy số OTP khôi phục.");
            return "redirect:/client/reset-password";
        }

        redirect.addFlashAttribute("error", "Không tìm thấy tài khoản với email này.");
        return "redirect:/client/forgot-password";
    }

    // ----- RESET PASSWORD -----

    @GetMapping("/reset-password")
    public String getResetPasswordPage(HttpSession session) {
        if (session.getAttribute("resetEmail") == null) {
            return "redirect:/client/forgot-password";
        }
        return "clientResetPassword";
    }

    @PostMapping("/reset-password")
    public String resetPasswordPost(@RequestParam String otpCode,
                                    @RequestParam String newPassword,
                                    @RequestParam String confirmNewPassword,
                                    HttpSession session,
                                    RedirectAttributes redirect) {
        
        String email = (String) session.getAttribute("resetEmail");
        if (email == null) {
            return "redirect:/client/forgot-password";
        }

        if (!newPassword.equals(confirmNewPassword)) {
            redirect.addFlashAttribute("error", "Mật khẩu xác nhận không khớp.");
            return "redirect:/client/reset-password";
        }

        Optional<UserClient> userOpt = userClientRepository.findByEmail(email);
        if (userOpt.isPresent()) {
            UserClient user = userOpt.get();
            if (user.getOtpCode() != null && user.getOtpCode().equals(otpCode)) {
                if (user.getOtpExpiryTime().isBefore(LocalDateTime.now())) {
                    redirect.addFlashAttribute("error", "Mã OTP đã hết hạn.");
                    return "redirect:/client/reset-password";
                }

                // Đổi mật khẩu
                user.setPassword(newPassword);
                user.setOtpCode(null);
                user.setOtpExpiryTime(null);
                userClientRepository.save(user);

                session.removeAttribute("resetEmail");
                redirect.addFlashAttribute("success", "Đổi mật khẩu thành công. Vui lòng đăng nhập lại.");
                return "redirect:/client/login";
            }
        }

        redirect.addFlashAttribute("error", "Mã OTP không chính xác.");
        return "redirect:/client/reset-password";
    }

    // ----- CHANGE PASSWORD -----

    @GetMapping("/change-password")
    public String getChangePasswordPage(HttpSession session, RedirectAttributes redirect) {
        if (session.getAttribute("clientUser") == null) {
            redirect.addFlashAttribute("error", "Bạn phải đăng nhập để đổi mật khẩu.");
            return "redirect:/client/login";
        }
        return "clientChangePassword";
    }

    @PostMapping("/change-password")
    public String changePasswordPost(@RequestParam String currentPassword,
                                     @RequestParam String newPassword,
                                     @RequestParam String confirmNewPassword,
                                     HttpSession session,
                                     RedirectAttributes redirect) {
        
        UserClient sessionUser = (UserClient) session.getAttribute("clientUser");
        if (sessionUser == null) {
            return "redirect:/client/login";
        }

        Optional<UserClient> userOpt = userClientRepository.findById(sessionUser.getId());
        if (userOpt.isPresent()) {
            UserClient dbUser = userOpt.get();
            if (!dbUser.getPassword().equals(currentPassword)) {
                redirect.addFlashAttribute("error", "Mật khẩu cũ không chính xác.");
                return "redirect:/client/change-password";
            }
            if (!newPassword.equals(confirmNewPassword)) {
                redirect.addFlashAttribute("error", "Mật khẩu xác nhận không chính xác.");
                return "redirect:/client/change-password";
            }
            
            dbUser.setPassword(newPassword);
            userClientRepository.save(dbUser);
            
            // Cập nhật lại session
            session.setAttribute("clientUser", dbUser);
            redirect.addFlashAttribute("success", "Đổi mật khẩu thành công.");
            return "redirect:/client/change-password";
        }

        return "redirect:/client/login";
    }
}
