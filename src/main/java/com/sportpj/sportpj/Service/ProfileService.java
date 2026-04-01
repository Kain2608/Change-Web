package com.sportpj.sportpj.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Repository.UserRepository;
import com.sportpj.sportpj.helpers.JwtHelper;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ProfileService {
  @Autowired
  UserRepository userRepository;
  @Autowired
  JwtHelper jwtHelper;
  @Autowired
  private Cloudinary cloudinary;
  public UserModel getCurrentUser(HttpServletRequest request){
    String email = jwtHelper.getEmail(request);
      if(email != null){
        return userRepository.findByEmail(email);
      }
    return null;
  }
  public UserModel updateProfile(UserModel userModel, HttpServletRequest request,MultipartFile avatarFile){
    UserModel old = getCurrentUser(request);
    old.setFullName(userModel.getFullName());
    old.setPhone(userModel.getPhone());
    old.setEmail(userModel.getEmail());
    if (avatarFile != null && !avatarFile.isEmpty()) {
      try {
        Map uploadResult = cloudinary.uploader().upload(
            avatarFile.getBytes(),
            com.cloudinary.utils.ObjectUtils.asMap("folder", "users")
        );

        String url = uploadResult.get("secure_url").toString();
        old.setAvatar(url);
      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    UserModel user = getCurrentUser(request);
      if(user != null){
        old.setUpdatedBy(user.getFullName()); 
      }
    return userRepository.save(old);
  }
}
