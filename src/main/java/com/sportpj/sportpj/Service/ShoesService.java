package com.sportpj.sportpj.Service;

import java.io.IOException;
import java.text.Normalizer;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.sportpj.sportpj.Model.ShoeVariantModel;
import com.sportpj.sportpj.Model.ShoesModel;
import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Repository.BrandRepository;
import com.sportpj.sportpj.Repository.CategoryRepository;
import com.sportpj.sportpj.Repository.ColorRepository;
import com.sportpj.sportpj.Repository.ShoeVariantRepository;
import com.sportpj.sportpj.Repository.ShoesRepository;
import com.sportpj.sportpj.Repository.SizeRepository;
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
    private SizeRepository sizeRepository;
    @Autowired
    private BrandRepository brandRepository; 
    @Autowired
    private CategoryRepository categoryRepository; 
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private JwtHelper jwtHelper;

    public String toSlug(String input) {
        if (input == null) return "";
        String slug = Normalizer.normalize(input, Normalizer.Form.NFD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        return slug.toLowerCase().replaceAll("[^a-z0-9\\s-]", "").trim().replaceAll("\\s+", "-");
    }

    public UserModel getCurrentUser(HttpServletRequest request) {
        String email = jwtHelper.getEmail(request);
        return (email != null) ? userRepository.findByEmail(email) : null;
    }

    @Transactional
    public ShoesModel saveShoes(ShoesModel shoes, MultipartFile avatarFile, Integer brandId, 
                                Long categoryId, Integer[] sizeIds, Integer[] colorIds, 
                                Integer[] stocks, HttpServletRequest request) {
        
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                Map uploadResult = cloudinary.uploader().upload(avatarFile.getBytes(), ObjectUtils.asMap("folder", "shoes"));
                shoes.setAvatar(uploadResult.get("secure_url").toString());
            } catch (IOException e) { 
                e.printStackTrace(); 
            }
        }

        if (brandId != null) shoes.setBrand(brandRepository.findById(brandId).orElse(null));
        if (categoryId != null) shoes.setCategory(categoryRepository.findById(categoryId).orElse(null));

        if (shoes.getStatus() == null || shoes.getStatus().isBlank()) shoes.setStatus("active");
        
        UserModel user = getCurrentUser(request);
        if (user != null) {
            shoes.setCreatedBy(user.getFullName());
            shoes.setUpdatedBy(user.getFullName());
        }

        String slug = toSlug(shoes.getName());
        String originSlug = slug;
        int count = 1;
        while (shoesRepository.existsBySlug(slug)) { 
            slug = originSlug + "-" + count++; 
        }
        shoes.setSlug(slug);

        double randomRating = Math.round((4.0 + Math.random()) * 10.0) / 10.0;
        int randomReview = (int) (Math.random() * 400) + 15;
        shoes.setRating(randomRating);
        shoes.setReviewCount(randomReview);
        shoes.setType("shoes");

        ShoesModel savedShoe = shoesRepository.save(shoes);
        saveVariants(savedShoe, sizeIds, colorIds, stocks);
        return savedShoe;
    }

    @Transactional
    public ShoesModel updateShoes(long id, ShoesModel shoesModel, MultipartFile avatarFile, Integer brandId, 
                                  Long categoryId, // ĐÃ SỬA THÀNH LONG
                                  Integer[] sizeIds, Integer[] colorIds, Integer[] stocks, HttpServletRequest request) {
        
        ShoesModel old = shoesRepository.findById(id).orElseThrow();
        old.setName(shoesModel.getName());
        old.setPrice(shoesModel.getPrice());
        old.setNewPrice(shoesModel.getNewPrice());
        old.setTarget(shoesModel.getTarget());
        old.setStatus(shoesModel.getStatus());
        old.setDescription(shoesModel.getDescription());
        old.setType(shoesModel.getType());

        // Khớp kiểu Long hoàn toàn
        if (categoryId != null) old.setCategory(categoryRepository.findById(categoryId).orElse(null));
        if (brandId != null) old.setBrand(brandRepository.findById(brandId).orElse(null));

        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                Map uploadResult = cloudinary.uploader().upload(avatarFile.getBytes(), ObjectUtils.asMap("folder", "shoes"));
                old.setAvatar(uploadResult.get("secure_url").toString());
            } catch (Exception e) { e.printStackTrace(); }
        }

        UserModel user = getCurrentUser(request);
        if (user != null) old.setUpdatedBy(user.getFullName());

        String slug = toSlug(shoesModel.getName());
        if (old.getSlug() == null || !old.getSlug().equals(slug)) {
            String originSlug = slug;
            int count = 1;
            while (shoesRepository.existsBySlug(slug)) { slug = originSlug + "-" + count++; }
            old.setSlug(slug);
        }

        variantRepository.deleteByShoe(old); 
        saveVariants(old, sizeIds, colorIds, stocks);
        return shoesRepository.save(old);
    }

    private void saveVariants(ShoesModel shoe, Integer[] sizeIds, Integer[] colorIds, Integer[] stocks) {
        if (sizeIds != null) {
            for (int i = 0; i < sizeIds.length; i++) {
                if (sizeIds[i] != null) {
                    ShoeVariantModel v = new ShoeVariantModel();
                    v.setSize(sizeRepository.findById(sizeIds[i]).orElse(null));
                    if (colorIds != null && colorIds[i] != null) {
                        v.setColor(colorRepository.findById(colorIds[i]).orElse(null));
                    }
                    v.setStockQuantity(stocks[i] != null ? stocks[i] : 0);
                    v.setShoe(shoe);
                    variantRepository.save(v);
                }
            }
        }
    }

    @Transactional
    public void deleteShoes(long id) { shoesRepository.deleteById(id); }
}