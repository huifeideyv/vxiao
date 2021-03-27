package com.xingguo.FilterOrAOP;


import javax.servlet.*;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
//@WebFilter(urlPatterns={"/Login.jsp"},
//        filterName ="LoginFilter")
public class LoginFilter implements Filter {
    public LoginFilter() {
        super();
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
            System.out.println("初始化过滤器");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest=(HttpServletRequest)servletRequest;
        HttpServletResponse httpServletResponse=(HttpServletResponse)servletResponse;
        Cookie []cookies=httpServletRequest.getCookies();
        for(Cookie cookie:cookies){
            System.out.println(cookie.getName()+" "+cookie.getValue());

        }
        if(cookies==null) {
            System.out.println("1");
            httpServletResponse.sendRedirect("/user/intoInterface1");
        }
        System.out.println("2");
        filterChain.doFilter(servletRequest,servletResponse);
//        else
//        {
//            for(Cookie cookie : cookies){
//                System.out.println(cookie);
//                httpServletRequest.setAttribute(cookie.getName(),cookie.getValue());
//            }
//            System.out.println("2");
//          servletRequest.getRequestDispatcher("/user/Filterlogin").forward(servletRequest,servletResponse);
//        }


    }

    @Override
    public void destroy() {
        System.out.println("销毁过滤器");
    }
}
