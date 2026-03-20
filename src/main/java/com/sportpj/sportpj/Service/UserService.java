package com.sportpj.sportpj.Service;

import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean emailExists(String email) {
        return userRepository.findByEmail(email) != null;
    }

    public boolean register(UserModel userModel){
        if(emailExists(userModel.getEmail())) return false;

        userModel.setPassword(hashPassword(userModel.getPassword()));
        userModel.setRole("user");
        userRepository.save(userModel);
        return true;
    }

    public boolean checkLogin(String email, String rawPassword) {
        UserModel user = userRepository.findByEmail(email);
        if(user == null) return false;
        return user.getPassword().equals(hashPassword(rawPassword));
    }

    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encoded = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : encoded) {
                String hex = Integer.toHexString(0xff & b);
                if(hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}