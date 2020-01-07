package com.kuang.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (request.getRequestURI().contains("toLogin")) {
            return true;
        }
        if (request.getRequestURI().contains("toRegister")) {
            return true;
        }
        if (request.getRequestURI().contains("register")) {
            return true;
        }
        if (request.getRequestURI().contains("login")) {
            return true;
        }
        if(request.getSession().getAttribute("user").toString().equals("admin")){
            return true;
        }else{
            return false;
        }
    }
}
