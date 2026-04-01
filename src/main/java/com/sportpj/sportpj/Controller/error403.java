package com.sportpj.sportpj.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class error403 {
  @GetMapping("/403")
  public String getMethodName() {
      return "error403";
  }
  
}
