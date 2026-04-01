package com.sportpj.sportpj.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportpj.sportpj.Model.RacketModel;
import com.sportpj.sportpj.Model.ShoesModel;
import com.sportpj.sportpj.Repository.*;
import com.sportpj.sportpj.Service.RacketService;
import com.sportpj.sportpj.Service.ShoesService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/product")
public class ProductController {
    @Autowired
    RacketService racketService;
    @Autowired
    ShoesService shoesService;
    @Autowired
    RacketRepository racketRepository;
    @Autowired
    ShoesRepository shoesRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    ColorRepository colorRepository;
    @Autowired
    SizeRepository sizeRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private BrandRepository brandRepository; // Thêm Repository cho Brand

    @InitBinder({ "racketModel", "shoesModel" })
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("avatar");
    }

    @GetMapping("/list")
    public String getProductPage(Model model, 
                                @RequestParam(required = false) String status, 
                                @RequestParam(required = false) String createdBy) {
        boolean hasStatus = (status != null && !status.isEmpty());
        boolean hasCreatedBy = (createdBy != null && !createdBy.isEmpty());

        List<RacketModel> racketList;
        List<ShoesModel> shoesList;

        if (hasStatus && hasCreatedBy) {
            racketList = racketRepository.findByStatusAndCreatedBy(status, createdBy);
        } else if (hasStatus) {
            racketList = racketRepository.findByStatus(status);
        } else if (hasCreatedBy) {
            racketList = racketRepository.findByCreatedBy(createdBy);
        } else {
            racketList = racketRepository.findAll();
        }
        racketList.forEach(r -> r.setType("racket"));

        if (hasStatus && hasCreatedBy) {
            shoesList = shoesRepository.findByStatusAndCreatedBy(status, createdBy);
        } else if (hasStatus) {
            shoesList = shoesRepository.findByStatus(status);
        } else if (hasCreatedBy) {
            shoesList = shoesRepository.findByCreatedBy(createdBy);
        } else {
            shoesList = shoesRepository.findAll();
        }
        shoesList.forEach(s -> s.setType("shoes"));

        List<Object> productList = new ArrayList<>();
        productList.addAll(racketList);
        productList.addAll(shoesList);

        model.addAttribute("productList", productList);
        model.addAttribute("userList", userRepository.findAll());
        model.addAttribute("totalProduct", racketRepository.count() + shoesRepository.count());
        model.addAttribute("totalActive", racketRepository.countByStatus("active") + shoesRepository.countByStatus("active"));
        model.addAttribute("totalInactive", racketRepository.countByStatus("inactive") + shoesRepository.countByStatus("inactive"));

        return "productList";
    }

    // ===== SHOES SECTION =====
    @GetMapping("/shoes-create")
    public String shoesCreate(Model model) {
        model.addAttribute("colors", colorRepository.findAll());
        model.addAttribute("sizes", sizeRepository.findAll()); 
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("brands", brandRepository.findAll()); // Thêm list brands cho View
        return "shoesCreate";
    }

    @PostMapping("/shoes-create")
    public String postShoesCreate(@ModelAttribute ShoesModel shoesModel,
                                  @RequestParam(name = "brandId", required = false) Integer brandId, // Thêm nhận brandId
                                  @RequestParam(name = "categoryId", required = false) Long categoryId, // Thêm nhận categoryId
                                  @RequestParam(name = "variant_sizes[]", required = false) Integer[] sizeIds,
                                  @RequestParam(name = "variant_colors[]", required = false) Integer[] colorIds,
                                  @RequestParam(name = "variant_stocks[]", required = false) Integer[] stocks,
                                  @RequestParam(name = "avatar", required = false) MultipartFile avatarFile,
                                  RedirectAttributes redirect,
                                  HttpServletRequest request) {
        
        // Truyền đầy đủ các tham số mới vào Service
        shoesService.saveShoes(shoesModel, avatarFile, brandId, categoryId, sizeIds, colorIds, stocks, request);
        
        redirect.addFlashAttribute("success", "Tạo giày thành công");
        return "redirect:/admin/product/list";
    }

    @GetMapping("/edit/shoes/{id}")
    public String getShoesEditPage(@PathVariable("id") long id, Model model) {
        ShoesModel shoes = shoesRepository.findById(id).orElseThrow();
        model.addAttribute("shoesDetail", shoes);
        model.addAttribute("colors", colorRepository.findAll());
        model.addAttribute("sizes", sizeRepository.findAll());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("brands", brandRepository.findAll()); // Thêm list brands để sửa
        return "shoesEdit";
    }

    @PostMapping("/edit/shoes/{id}")
    public String postEditShoes(@PathVariable("id") long id, 
                                @ModelAttribute ShoesModel shoesModel,
                                @RequestParam(name = "brandId", required = false) Integer brandId, // Nhận brandId
                                @RequestParam(name = "categoryId", required = false) Long categoryId, // Nhận categoryId
                                @RequestParam(name = "variant_sizes[]", required = false) Integer[] sizeIds,
                                @RequestParam(name = "variant_colors[]", required = false) Integer[] colorIds,
                                @RequestParam(name = "variant_stocks[]", required = false) Integer[] stocks,
                                @RequestParam(name = "avatar", required = false) MultipartFile avatarFile,
                                RedirectAttributes redirect,
                                HttpServletRequest request) {
        
        // Cập nhật Service update với các tham số ID
        shoesService.updateShoes(id, shoesModel, avatarFile, brandId, categoryId, sizeIds, colorIds, stocks, request);
        
        redirect.addFlashAttribute("success", "Cập nhật giày thành công");
        return "redirect:/admin/product/edit/shoes/" + id;
    }

    @GetMapping("/delete/shoes/{id}")
    public String deleteShoes(@PathVariable("id") long id, RedirectAttributes redirect) {
        try {
            shoesService.deleteShoes(id);
            redirect.addFlashAttribute("success", "Xóa giày thành công");
        } catch (Exception e) {
            redirect.addFlashAttribute("error", "Xóa thất bại");
        }
        return "redirect:/admin/product/list";
    }
    
    // ... Phần Racket giữ nguyên như code cũ của bạn ...
}