package com.sportpj.sportpj.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sportpj.sportpj.Model.CategoryModel;
import com.sportpj.sportpj.Repository.CategoryRepository;


@Controller
public class ClientMainController {
  @Autowired
  CategoryRepository categoryRepository;
  @GetMapping("/")
  public String getMain(Model model) {
    model.addAttribute("categories", categoryRepository.findAll());
    List<CategoryModel> shoeCategories = categoryRepository.findByNameStartingWith("Giày");
    model.addAttribute("shoeCategories", shoeCategories);
    List<CategoryModel> racketCategories = categoryRepository.findByNameStartingWith("Vợt");
    model.addAttribute("racketCategories", racketCategories);
      return "clientMain";
  }
  
}
