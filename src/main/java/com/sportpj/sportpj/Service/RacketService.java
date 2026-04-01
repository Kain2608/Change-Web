package com.sportpj.sportpj.Service;

import java.io.IOException;
import java.text.Format;
import java.text.Normalizer;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.Map;

import javax.swing.text.NumberFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
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

    public String toSlug(String input) {
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

    public String priceFormatter(RacketModel racket) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat priceFormat = NumberFormat.getCurrencyInstance(localeVN);
        String priceF = priceFormat.format(racket.getPrice());
        return priceF;
    }

    public RacketModel saveRacket(RacketModel racket, MultipartFile avatarFile, HttpServletRequest request) {
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                Map uploadResult = cloudinary.uploader().upload(
                        avatarFile.getBytes(),
                        ObjectUtils.asMap("folder", "racket"));
                String url = uploadResult.get("secure_url").toString();
                racket.setAvatar(url);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        racket.setStatus("active");
        UserModel user = getCurrentUser(request);
        if (user != null) {
            racket.setCreatedBy(user.getFullName());
            racket.setUpdatedBy(user.getFullName());
        }

        return racketRepository.save(racket);
    }

    public void deleteRacket(@PathVariable("id") long id) {
        racketRepository.deleteById(id);
    }

    public RacketModel updateRacket(
            @PathVariable("id") long id,
            RacketModel racketModel,
            MultipartFile avatarFile,
            HttpServletRequest request) {
        RacketModel old = racketRepository.findById(id).orElseThrow();

        // Update thông tin cơ bản
        old.setName(racketModel.getName());
        old.setStatus(racketModel.getStatus());
        old.setDescription(racketModel.getDescription());

        // Upload avatar nếu có
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                Map uploadResult = cloudinary.uploader().upload(
                        avatarFile.getBytes(),
                        com.cloudinary.utils.ObjectUtils.asMap("folder", "racket"));

                String url = uploadResult.get("secure_url").toString();
                old.setAvatar(url);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Lấy user hiện tại
        UserModel user = getCurrentUser(request);
        if (user != null) {
            old.setUpdatedBy(user.getFullName());
        }

        // Xử lý slug không trùng
        String slug = toSlug(racketModel.getName());
        int i = 1;

        while (racketRepository.existsBySlug(slug) && !old.getSlug().equals(slug)) {
            slug = toSlug(racketModel.getName()) + "-" + i;
            i++;
        }

        old.setSlug(slug);

        return racketRepository.save(old);
    }
}