package com.sportpj.sportpj.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ProductDetailClientController {
  @GetMapping("/product")
  public String getMain() {
      return "ProductAll";
  }
}
