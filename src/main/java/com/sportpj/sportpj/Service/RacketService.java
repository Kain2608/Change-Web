package com.sportpj.sportpj.Service;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.Map;

import javax.swing.text.NumberFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.sportpj.sportpj.Model.RacketModel;
import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Repository.RacketRepository;
import com.sportpj.sportpj.Repository.UserRepository;
import com.sportpj.sportpj.helpers.JwtHelper;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Service
public class RacketService {

    @Autowired
    private RacketRepository racketRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    JwtHelper jwtHelper;
    public UserModel getCurrentUser(HttpServletRequest request){
        String email = jwtHelper.getEmail(request);
        if(email != null){
            return userRepository.findByEmail(email);
        }
        return null;
    }

    public RacketModel saveRacket(RacketModel racket, MultipartFile avatarFile,HttpServletRequest request) {
      if (avatarFile != null && !avatarFile.isEmpty()) {
          try {
              Map uploadResult = cloudinary.uploader().upload(
                      avatarFile.getBytes(),
                      ObjectUtils.asMap("folder", "racket")
              );
              String url = uploadResult.get("secure_url").toString();
              racket.setAvatar(url);
          } catch (IOException e) {
              e.printStackTrace();
          }
      }
      
      NumberFormat format = NumberFormat.getInstance();
      String priceFormat = format.format(racket.getPrice()) + "đ";
      UserModel user = getCurrentUser(request);
      if(user != null){
          racket.setCreatedBy(user.getFullName());
          racket.setUpdatedBy(user.getFullName());
      }
      return racketRepository.save(racket);
    }
}