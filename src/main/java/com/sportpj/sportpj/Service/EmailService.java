package com.sportpj.sportpj.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired(required = false)
    private JavaMailSender javaMailSender;

    public void sendOtpEmail(String toEmail, String otpCode, String subject) {
        if (javaMailSender == null) {
            System.out.println("====== VUI LÒNG CẤU HÌNH GMAIL TRONG APPLICATION.YAML BẰNG TÀI KHOẢN CỦA BẠN ======");
            System.out.println("Email: " + toEmail + " | OTP: " + otpCode);
            System.out.println("==================================================================================");
            return;
        }

        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(toEmail);
            helper.setSubject(subject);

            String htmlMsg = "<div style='font-family: Arial, sans-serif; padding: 20px; border: 1px solid #ddd; max-width: 500px; margin: auto;'>"
                    + "<h2 style='color: #007bff; text-align: center;'>Thông báo từ Hệ Thống</h2>"
                    + "<p>Xin chào,</p>"
                    + "<p>Mã xác nhận (OTP) của bạn là: <strong style='font-size: 24px; color: #d9534f;'>" + otpCode + "</strong></p>"
                    + "<p>Mã này có hiệu lực trong 5 phút. Vui lòng không chia sẻ mã này cho bất kỳ ai.</p>"
                    + "<hr style='border-top: 1px solid #eee; margin: 20px 0;'>"
                    + "<p style='font-size: 12px; color: #888; text-align: center;'>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.</p>"
                    + "</div>";

            helper.setText(htmlMsg, true);

            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("LỖI GỬI EMAIL: " + e.getMessage());
        } catch (Exception ex) {
            System.out.println("CHƯA CẤU HÌNH GMAIL HỢP LỆ THỂ GỬI EMAIL: " + ex.getMessage());
            System.out.println("Mã OTP in tạm ra console: " + otpCode);
        }
    }
}
