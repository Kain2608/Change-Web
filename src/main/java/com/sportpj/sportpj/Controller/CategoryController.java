package com.sportpj.sportpj.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportpj.sportpj.Model.RacketModel;
import com.sportpj.sportpj.Service.RacketService;

import jakarta.servlet.http.HttpServletRequest;



@Controller
@RequestMapping("/admin/category")
public class CategoryController {
  @Autowired
  RacketService racketService;
  @GetMapping("/list")
  public String getCategoryPage(){
    return "categoryList";
  }
   @GetMapping("/racket-create")
  public String racketCreate(){
    return "racketCreate"; 
  }
  @PostMapping("/racket-create")
  public String postRacketCreate(
      @ModelAttribute RacketModel racketModel,
      RedirectAttributes redirect, 
      @RequestParam(name = "avatar", required = false) MultipartFile avatarFile,
      HttpServletRequest request
  ) {
    racketService.saveRacket(racketModel, avatarFile, request);
    redirect.addFlashAttribute("success", "Tạo thành công");
    return "redirect:/admin/category/racket-create";
}
  
  @GetMapping("/shoes-create")
  public String shoesCreate(){
    return "shoesCreate"; 
  }
}
