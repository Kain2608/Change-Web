package com.sportpj.sportpj.Controller;


import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sportpj.sportpj.Model.CategoryModel;
import com.sportpj.sportpj.Model.RacketModel;
import com.sportpj.sportpj.Model.ShoesModel;
import com.sportpj.sportpj.Repository.CategoryRepository;
import com.sportpj.sportpj.Repository.RacketRepository;
import com.sportpj.sportpj.Repository.ShoesRepository;


@Controller
public class ClientMainController {
  @Autowired
  CategoryRepository categoryRepository;
  @Autowired
  RacketRepository racketRepository;
  @Autowired
  ShoesRepository shoesRepository;
  @GetMapping("/")
  public String getMain(Model model) {
    List<CategoryModel> categoryStatus = categoryRepository.findByStatus("active");
    Map<CategoryModel, List<ShoesModel>> cateMap = new LinkedHashMap<>();
    Map<CategoryModel,List<RacketModel>> cateMapping = new LinkedHashMap<>();
    List<String> activeStatuses = Arrays.asList("active", "new", "sales");
    for(CategoryModel item : categoryStatus){
      
      List<ShoesModel> shoesProduct = shoesRepository.findByCategory_idAndStatusIn(item.getId(), activeStatuses);
      List<RacketModel> racketProduct = racketRepository.findByCategory_idAndStatusIn(item.getId(), activeStatuses);
      if(!shoesProduct.isEmpty()){
        cateMap.put(item,shoesProduct);
      }
      if(!racketProduct.isEmpty()){
        cateMapping.put(item,racketProduct);
      }
    }
    model.addAttribute("categories", categoryRepository.findAll());
    List<CategoryModel> shoeCategories = categoryRepository.findByNameStartingWithAndStatus("Giày","active");
    model.addAttribute("shoeCategories", shoeCategories);
    List<CategoryModel> racketCategories = categoryRepository.findByNameStartingWithAndStatus("Vợt","active");
    model.addAttribute("racketCategories", racketCategories);
    model.addAttribute("cateMap",cateMap);
    model.addAttribute("cateMapping",cateMapping);
      return "clientMain";
  }
  
}
