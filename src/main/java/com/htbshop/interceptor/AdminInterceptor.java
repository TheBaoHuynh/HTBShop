package com.htbshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.htbshop.dao.CustomerDAO;
import com.htbshop.entity.Customer;

@Component
public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	CustomerDAO dao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//kiem tra trong session co user chưa
		HttpSession session = request.getSession();
		//lay user ra
		Customer user = (Customer) session.getAttribute("user");
		if(user==null) {
			session.setAttribute("back-uri", request.getRequestURI());
			response.sendRedirect("/account/login");
			return false;
		} 
		user = (Customer) dao.findById(user.getId());
		if(user.getAdmin()==false) {
			session.setAttribute("back-uri", request.getRequestURI());
			response.sendRedirect("/home/index");
			return false;
		}
		return true;
	}
}
