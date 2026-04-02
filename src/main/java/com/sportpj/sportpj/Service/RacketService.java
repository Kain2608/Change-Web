package com.sportpj.sportpj.Service;

import java.io.IOException;
import java.text.Normalizer;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.sportpj.sportpj.Model.RacketModel;
import com.sportpj.sportpj.Model.UserModel;
import com.sportpj.sportpj.Repository.BrandRepository;
import com.sportpj.sportpj.Repository.CategoryRepository;
import com.sportpj.sportpj.Repository.RacketRepository;
import com.sportpj.sportpj.Repository.UserRepository;
import com.sportpj.sportpj.helpers.JwtHelper;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class RacketService {

    @Autowired
    private RacketRepository racketRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private BrandRepository brandRepository;

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
        return (email != null) ? userRepository.findByEmail(email) : null;
    }

    public RacketModel saveRacket(RacketModel racket, MultipartFile avatarFile, HttpServletRequest request) {
        // 1. Xử lý Upload Ảnh
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                Map uploadResult = cloudinary.uploader().upload(
                        avatarFile.getBytes(),
                        ObjectUtils.asMap("folder", "rackets"));
                racket.setAvatar(uploadResult.get("secure_url").toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 2. Fix lỗi Hibernate: Load Category và Brand thực tế từ DB
        if (racket.getCategory() != null && racket.getCategory().getId() != null) {
            racket.setCategory(categoryRepository.findById(racket.getCategory().getId()).orElse(null));
        }
        if (racket.getBrand() != null && racket.getBrand().getId() != null) {
            racket.setBrand(brandRepository.findById(racket.getBrand().getId()).orElse(null));
        }

        // 3. Xử lý Slug duy nhất
        String baseSlug = toSlug(racket.getName());
        String finalSlug = baseSlug;
        int count = 1;
        while (racketRepository.existsBySlug(finalSlug)) {
            finalSlug = baseSlug + "-" + count++;
        }
        racket.setSlug(finalSlug);

        // 4. Thông tin người tạo
        UserModel user = getCurrentUser(request);
        if (user != null) {
            racket.setCreatedBy(user.getFullName());
            racket.setUpdatedBy(user.getFullName());
        }

        racket.setType("racket");
        return racketRepository.save(racket);
    }

    public RacketModel updateRacket(Long id, RacketModel newData, MultipartFile avatarFile, HttpServletRequest request) {
        RacketModel old = racketRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy vợt với ID: " + id));

        // 1. Cập nhật thông tin cơ bản và thông số kỹ thuật
        old.setName(newData.getName());
        old.setPrice(newData.getPrice());
        old.setNewPrice(newData.getNewPrice());
        old.setStock(newData.getStock());
        old.setWeight(newData.getWeight());
        old.setGripSize(newData.getGripSize());
        old.setTension(newData.getTension());
        old.setBalancePoint(newData.getBalancePoint());
        old.setStiffness(newData.getStiffness());
        old.setLength(newData.getLength());
        old.setDescription(newData.getDescription());
        old.setStatus(newData.getStatus());

        // 2. Cập nhật liên kết Category và Brand
        if (newData.getCategory() != null && newData.getCategory().getId() != null) {
            old.setCategory(categoryRepository.findById(newData.getCategory().getId()).orElse(null));
        }
        if (newData.getBrand() != null && newData.getBrand().getId() != null) {
            old.setBrand(brandRepository.findById(newData.getBrand().getId()).orElse(null));
        }

        // 3. Xử lý Upload Ảnh mới (nếu có)
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                Map uploadResult = cloudinary.uploader().upload(
                        avatarFile.getBytes(),
                        ObjectUtils.asMap("folder", "rackets"));
                old.setAvatar(uploadResult.get("secure_url").toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 4. Cập nhật Slug nếu đổi tên
        String newSlug = toSlug(newData.getName());
        if (old.getSlug() == null || !old.getSlug().equals(newSlug)) {
            String finalSlug = newSlug;
            int count = 1;
            while (racketRepository.existsBySlug(finalSlug)) {
                finalSlug = newSlug + "-" + count++;
            }
            old.setSlug(finalSlug);
        }

        // 5. Thông tin người cập nhật
        UserModel user = getCurrentUser(request);
        if (user != null) {
            old.setUpdatedBy(user.getFullName());
        }

        return racketRepository.save(old);
    }

    public void deleteRacket(Long id) {
        racketRepository.deleteById(id);
    }
}