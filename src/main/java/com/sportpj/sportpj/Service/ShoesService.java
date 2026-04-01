package com.sportpj.sportpj.Service;

import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.sportpj.sportpj.Model.ColorModel;
import com.sportpj.sportpj.Model.SizeModel; // Import SizeModel
import com.sportpj.sportpj.Model.ShoeVariantModel;
import com.sportpj.sportpj.Model.ShoesModel;
import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Repository.ColorRepository;
import com.sportpj.sportpj.Repository.SizeRepository; // Import SizeRepository
import com.sportpj.sportpj.Repository.ShoeVariantRepository;
import com.sportpj.sportpj.Repository.ShoesRepository;
import com.sportpj.sportpj.Repository.UserRepository;
import com.sportpj.sportpj.helpers.JwtHelper;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ShoesService {

    @Autowired
    private ShoesRepository shoesRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ShoeVariantRepository variantRepository;
    @Autowired
    private ColorRepository colorRepository; 
    @Autowired
    private SizeRepository sizeRepository; // Thêm SizeRepository
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private JwtHelper jwtHelper;

    public String toSlug(String input) {
        if (input == null) return "";
        String slug = Normalizer.normalize(input, Normalizer.Form.NFD);
        slug = slug.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        slug = slug.toLowerCase();
        slug = slug.replaceAll("[^a-z0-9\\s-]", "");
        slug = slug.trim().replaceAll("\\s+", "-");
        return slug;
    }

    public UserModel getCurrentUser(HttpServletRequest request) {
        String email = jwtHelper.getEmail(request);
        if (email != null) {
            return userRepository.findByEmail(email);
        }
        return null;
    }

    @Transactional
    public ShoesModel saveShoes(ShoesModel shoes, 
                                MultipartFile avatarFile, 
                                Integer[] sizeIds, // Đổi từ String[] sang Integer[] (nhận ID)
                                Integer[] colorIds, 
                                Integer[] stocks, 
                                HttpServletRequest request) {
        
        // 1. Xử lý Avatar
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                Map uploadResult = cloudinary.uploader().upload(
                        avatarFile.getBytes(),
                        ObjectUtils.asMap("folder", "shoes")
                );
                shoes.setAvatar(uploadResult.get("secure_url").toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 2. Thông tin bổ sung
        if (shoes.getStatus() == null || shoes.getStatus().isBlank()) {
            shoes.setStatus("active");
        }
        
        UserModel user = getCurrentUser(request);
        if (user != null) {
            shoes.setCreatedBy(user.getFullName());
            shoes.setUpdatedBy(user.getFullName());
        }

        // 3. Xử lý Slug
        String slug = toSlug(shoes.getName());
        String originSlug = slug;
        int count = 1;
        while (shoesRepository.existsBySlug(slug)) {
            slug = originSlug + "-" + count++;
        }
        shoes.setSlug(slug);

        // 4. Lưu Shoes trước
        ShoesModel savedShoe = shoesRepository.save(shoes);

        // 5. Lưu các biến thể (Variants)
        if (sizeIds != null) {
            for (int i = 0; i < sizeIds.length; i++) {
                if (sizeIds[i] != null) {
                    ShoeVariantModel variant = new ShoeVariantModel();
                    
                    // TÌM SIZE THEO ID
                    SizeModel size = sizeRepository.findById(sizeIds[i]).orElse(null);
                    variant.setSize(size);

                    // TÌM COLOR THEO ID
                    if (colorIds != null && colorIds[i] != null) {
                        ColorModel color = colorRepository.findById(colorIds[i]).orElse(null);
                        variant.setColor(color);
                    }

                    variant.setStockQuantity(stocks[i] != null ? stocks[i] : 0);
                    variant.setShoe(savedShoe);
                    variantRepository.save(variant);
                }
            }
        }
        return savedShoe;
    }

    @Transactional
    public void deleteShoes(long id) {
        shoesRepository.deleteById(id);
    }

    @Transactional
    public ShoesModel updateShoes(long id, 
                                  ShoesModel shoesModel, 
                                  MultipartFile avatarFile, 
                                  Integer[] sizeIds, // Đổi từ String[] sang Integer[]
                                  Integer[] colorIds, 
                                  Integer[] stocks, 
                                  HttpServletRequest request) {
        
        ShoesModel old = shoesRepository.findById(id).orElseThrow();

        // Cập nhật thông tin cơ bản
        old.setName(shoesModel.getName());
        old.setCategory(shoesModel.getCategory());
        old.setBrand(shoesModel.getBrand());
        old.setPrice(shoesModel.getPrice());
        old.setNewPrice(shoesModel.getNewPrice());
        old.setTarget(shoesModel.getTarget());
        old.setStatus(shoesModel.getStatus());
        old.setDescription(shoesModel.getDescription());
        old.setType(shoesModel.getType());

        // Avatar
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                Map uploadResult = cloudinary.uploader().upload(
                        avatarFile.getBytes(),
                        ObjectUtils.asMap("folder", "shoes"));
                old.setAvatar(uploadResult.get("secure_url").toString());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        UserModel user = getCurrentUser(request);
        if (user != null) {
            old.setUpdatedBy(user.getFullName());
        }

        // Slug
        String slug = toSlug(shoesModel.getName());
        if (!old.getSlug().equals(slug)) {
            String originSlug = slug;
            int count = 1;
            while (shoesRepository.existsBySlug(slug)) {
                slug = originSlug + "-" + count++;
            }
            old.setSlug(slug);
        }

        // LÀM SẠCH BIẾN THỂ CŨ TRƯỚC KHI CẬP NHẬT
        // Bạn cần thêm phương thức deleteByShoeId trong ShoeVariantRepository
        variantRepository.deleteByShoe(old); 
        
        // CẬP NHẬT BIẾN THỂ MỚI
        if (sizeIds != null) {
            for (int i = 0; i < sizeIds.length; i++) {
                if (sizeIds[i] != null) {
                    ShoeVariantModel v = new ShoeVariantModel();
                    
                    SizeModel size = sizeRepository.findById(sizeIds[i]).orElse(null);
                    v.setSize(size);

                    if (colorIds != null && colorIds[i] != null) {
                        v.setColor(colorRepository.findById(colorIds[i]).orElse(null));
                    }

                    v.setStockQuantity(stocks[i] != null ? stocks[i] : 0);
                    v.setShoe(old);
                    variantRepository.save(v);
                }
            }
        }

        return shoesRepository.save(old);
    }
}