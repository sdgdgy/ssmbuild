package com.kuang.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor implements HandlerInterceptor {
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
        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null){
            return true;
        }
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        return false;
    }
}
