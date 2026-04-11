package com.sportpj.sportpj.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class SearchResultController {
  @GetMapping("/search-result")
  public String getMethodName() {
      return "searchResult";
  }
  
}
