package com.htbshop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.htbshop.interceptor.AdminInterceptor;
import com.htbshop.interceptor.AuthorizeInterceptor;
import com.htbshop.interceptor.ShareInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
	@Autowired
	ShareInterceptor share;
	@Autowired
	AuthorizeInterceptor auth;
	@Autowired
	AdminInterceptor admin;
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
			registry.addInterceptor(share).addPathPatterns("/**");
			
			registry.addInterceptor(auth)
				.addPathPatterns("/account/change","/account/logout","/account/edit","/order/**");
			registry.addInterceptor(admin).addPathPatterns("/admin/**");
	}

}
