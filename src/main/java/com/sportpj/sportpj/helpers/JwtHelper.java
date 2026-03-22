package com.sportpj.sportpj.helpers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sportpj.sportpj.Service.JwtAuthService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@Component
public class JwtHelper {

    @Autowired
    private JwtAuthService jwtAuthService;

    private String getTokenFromRequest(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie c : cookies){
                if("token".equals(c.getName())){
                    return c.getValue();
                }
            }
        }
        return null;
    }

    public Map<String, Object> getEAndU(HttpServletRequest request){
        String token = getTokenFromRequest(request);
        if(token != null){
            return jwtAuthService.validateToken(token);
        }
        return null;
    }

    public String getEmail(HttpServletRequest request){
        Map<String, Object> data = getEAndU(request);
        if(data != null) return (String) data.get("email");
        return null;
    }
    public Long getUserId(HttpServletRequest request){
        Map<String, Object> data = getEAndU(request);
        if(data != null) return ((Number) data.get("userId")).longValue();
        return null;
    }
} 
  

