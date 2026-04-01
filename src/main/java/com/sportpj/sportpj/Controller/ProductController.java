package com.sportpj.sportpj.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportpj.sportpj.Model.RacketModel;
import com.sportpj.sportpj.Model.ShoesModel;
import com.sportpj.sportpj.Repository.CategoryRepository;
import com.sportpj.sportpj.Repository.ColorRepository;
import com.sportpj.sportpj.Repository.SizeRepository; // Thêm import
import com.sportpj.sportpj.Repository.RacketRepository;
import com.sportpj.sportpj.Repository.ShoesRepository;
import com.sportpj.sportpj.Repository.UserRepository;
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
    SizeRepository sizeRepository; // Thêm Repository để lấy Size cho View
    @Autowired
    private CategoryRepository categoryRepository;
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

        long totalProduct = racketRepository.count() + shoesRepository.count();
        long totalActive = racketRepository.countByStatus("active") + shoesRepository.countByStatus("active");
        long totalInactive = racketRepository.countByStatus("inactive") + shoesRepository.countByStatus("inactive");

        model.addAttribute("productList", productList);
        model.addAttribute("userList", userRepository.findAll());
        model.addAttribute("totalProduct", totalProduct);
        model.addAttribute("totalActive", totalActive);
        model.addAttribute("totalInactive", totalInactive);

        return "productList";
    }

    // ===== RACKET SECTION =====
    @GetMapping("/racket-create")
    public String racketCreate() {
        return "racketCreate";
    }

    @PostMapping("/racket-create")
    public String postRacketCreate(@ModelAttribute RacketModel racketModel,
                                   @RequestParam(name = "avatar", required = false) MultipartFile avatarFile,
                                   RedirectAttributes redirect,
                                   HttpServletRequest request) {
        racketService.saveRacket(racketModel, avatarFile, request);
        redirect.addFlashAttribute("success", "Tạo vợt thành công");
        return "redirect:/admin/product/list";
    }

    @GetMapping("/edit/racket/{id}")
    public String getRacketEditPage(@PathVariable("id") long id, Model model) {
        model.addAttribute("racketDetail", racketRepository.findById(id).orElseThrow());
        return "racketEdit";
    }

    @PostMapping("/edit/racket/{id}")
    public String postEditRacket(@PathVariable("id") long id, 
                                 @ModelAttribute RacketModel racketModel,
                                 @RequestParam(name = "avatar", required = false) MultipartFile avatarFile,
                                 RedirectAttributes redirect,
                                 HttpServletRequest request) {
        racketService.updateRacket(id, racketModel, avatarFile, request);
        redirect.addFlashAttribute("success", "Cập nhật vợt thành công");
        return "redirect:/admin/product/edit/racket/" + id;
    }

    @GetMapping("/delete/racket/{id}")
    public String deleteRacket(@PathVariable("id") long id, RedirectAttributes redirect) {
        try {
            racketService.deleteRacket(id);
            redirect.addFlashAttribute("success", "Xóa vợt thành công");
        } catch (Exception e) {
            redirect.addFlashAttribute("error", "Xóa thất bại");
        }
        return "redirect:/admin/product/list";
    }

    // ===== SHOES SECTION =====
    @GetMapping("/shoes-create")
    public String shoesCreate(Model model) {
        // Đổ danh sách màu sắc và kích thước ra View
        model.addAttribute("colors", colorRepository.findAll());
        model.addAttribute("sizes", sizeRepository.findAll()); 
        model.addAttribute("categories", categoryRepository.findAll());
        return "shoesCreate";
    }

    @PostMapping("/shoes-create")
    public String postShoesCreate(@ModelAttribute ShoesModel shoesModel,
                                  @RequestParam(name = "variant_sizes[]", required = false) Integer[] sizeIds,
                                  @RequestParam(name = "variant_colors[]", required = false) Integer[] colorIds,
                                  @RequestParam(name = "variant_stocks[]", required = false) Integer[] stocks,
                                  @RequestParam(name = "avatar", required = false) MultipartFile avatarFile,
                                  RedirectAttributes redirect,
                                  HttpServletRequest request) {
        
        // Gọi Service với tham số Integer[] cho sizeIds
        shoesService.saveShoes(shoesModel, avatarFile, sizeIds, colorIds, stocks, request);
        
        redirect.addFlashAttribute("success", "Tạo giày thành công");
        return "redirect:/admin/product/list";
    }

    @GetMapping("/edit/shoes/{id}")
    public String getShoesEditPage(@PathVariable("id") long id, Model model) {
        ShoesModel shoes = shoesRepository.findById(id).orElseThrow();
        model.addAttribute("shoesDetail", shoes);
        model.addAttribute("colors", colorRepository.findAll());
        model.addAttribute("sizes", sizeRepository.findAll()); // Thêm list size để sửa
        return "shoesEdit";
    }

    @PostMapping("/edit/shoes/{id}")
    public String postEditShoes(@PathVariable("id") long id, 
                                @ModelAttribute ShoesModel shoesModel,
                                @RequestParam(name = "variant_sizes[]", required = false) Integer[] sizeIds,
                                @RequestParam(name = "variant_colors[]", required = false) Integer[] colorIds,
                                @RequestParam(name = "variant_stocks[]", required = false) Integer[] stocks,
                                @RequestParam(name = "avatar", required = false) MultipartFile avatarFile,
                                RedirectAttributes redirect,
                                HttpServletRequest request) {
        
        // Gọi Service update với tham số Integer[] cho sizeIds
        shoesService.updateShoes(id, shoesModel, avatarFile, sizeIds, colorIds, stocks, request);
        
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
}