package com.sportpj.sportpj.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.sportpj.sportpj.Model.RacketModel;
import com.sportpj.sportpj.Model.ShoesModel;
import com.sportpj.sportpj.Repository.BrandRepository;
import com.sportpj.sportpj.Repository.CategoryRepository;
import com.sportpj.sportpj.Repository.RacketRepository;
import com.sportpj.sportpj.Repository.ShoesRepository;

@Controller
public class ProductDetailClientController {

    @Autowired
    private RacketRepository racketRepository;

    @Autowired
    private ShoesRepository shoesRepository;

    @Autowired
    private CategoryRepository categoryRepository;
    
    @Autowired
    private BrandRepository brandRepository;

    @GetMapping("/tat-ca-san-pham")
public String getAllProductsPage(
        Model model, 
        @RequestParam(value = "cateIds", required = false) List<Long> cateIds,
        @RequestParam(value = "brandIds", required = false) List<Long> brandIds,
        @RequestParam(value = "stt", required = false) List<String> status, // "new" hoặc "sales"
        @RequestParam(value = "sort", required = false) String sort) {
    
    // 1. Gửi dữ liệu nền cho Sidebar
    model.addAttribute("allCategories", categoryRepository.findAll());
    model.addAttribute("brands", brandRepository.findAll()); 

    // 2. Lấy dữ liệu gốc
    List<RacketModel> rackets = racketRepository.findAll();
    List<ShoesModel> shoes = shoesRepository.findAll();

    // 3. Logic lọc chung cho cả 2 loại sản phẩm
    // Lọc theo Danh mục
    if (cateIds != null && !cateIds.isEmpty()) {
        rackets.removeIf(r -> r.getCategory() == null || !cateIds.contains(r.getCategory().getId()));
        shoes.removeIf(s -> s.getCategory() == null || !cateIds.contains(s.getCategory().getId()));
    }

    // Lọc theo Thương hiệu
    if (brandIds != null && !brandIds.isEmpty()) {
        rackets.removeIf(r -> r.getBrand() == null || !brandIds.contains(r.getBrand().getId()));
        shoes.removeIf(s -> s.getBrand() == null || !brandIds.contains(s.getBrand().getId()));
    }

    // Lọc theo Trạng thái (Hàng mới / Khuyến mãi)
    if (status != null && !status.isEmpty()) {
        // Lọc Hàng mới (status có chứa 'new') và Khuyến mãi (status có chứa 'sales')
        rackets.removeIf(r -> !status.contains(r.getStatus())); 
        shoes.removeIf(s -> !status.contains(s.getStatus()));
    }

    // 4. Gộp danh sách
    List<Object> allProducts = new ArrayList<>();
    allProducts.addAll(rackets);
    allProducts.addAll(shoes);

    // 5. Logic Sắp xếp theo Giá (Sort)
    if ("priceAsc".equals(sort)) {
        allProducts.sort((a, b) -> Double.compare(getPrice(a), getPrice(b)));
    } else if ("priceDesc".equals(sort)) {
        allProducts.sort((a, b) -> Double.compare(getPrice(b), getPrice(a)));
    } else {
        // Mặc định hoặc newest: Bạn có thể sắp xếp theo ID giảm dần
        allProducts.sort((a, b) -> Long.compare(getId(b), getId(a)));
    }

    model.addAttribute("listProduct", allProducts);
    return "ProductAll"; 
}

// Hàm bổ trợ để lấy giá chung từ 2 Object khác nhau
private double getPrice(Object obj) {
    if (obj instanceof RacketModel) return ((RacketModel) obj).getNewPrice();
    if (obj instanceof ShoesModel) return ((ShoesModel) obj).getNewPrice();
    return 0;
}

// Hàm bổ trợ để lấy ID chung
private long getId(Object obj) {
    if (obj instanceof RacketModel) return ((RacketModel) obj).getId();
    if (obj instanceof ShoesModel) return ((ShoesModel) obj).getId();
    return 0;
}
    @GetMapping("/product-detail/{id}")
public String getProductDetail(@PathVariable("id") Long id, Model model) {
    
    RacketModel racket = racketRepository.findById(id).orElse(null);
    
    if (racket != null) {
        model.addAttribute("product", racket);
        model.addAttribute("productType", "racket");
        return "ProductDetail";
    }

    ShoesModel shoes = shoesRepository.findById(id).orElse(null);
    
    if (shoes != null) {
        model.addAttribute("product", shoes);
        model.addAttribute("productType", "shoes");
        return "ProductDetail";
    }

    return "redirect:/tat-ca-san-pham";
}
}