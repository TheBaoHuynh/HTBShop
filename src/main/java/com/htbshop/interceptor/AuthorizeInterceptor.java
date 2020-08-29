package com.htbshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.htbshop.entity.Customer;

@Component
public class AuthorizeInterceptor extends HandlerInterceptorAdapter {
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		//kiem tra trong session co user chưa
		HttpSession session = request.getSession();
		//lay user ra
		Customer user = (Customer) session.getAttribute("user");
		if(user == null) {
			session.setAttribute("back-uri", request.getRequestURI());
			response.sendRedirect("/account/login");
			return false;
		}
		return true;
	}
}
