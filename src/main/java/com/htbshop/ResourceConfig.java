package com.htbshop;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ResourceConfig implements WebMvcConfigurer{
	@Bean(name="messageSource")
	public MessageSource getMessageSource() {
		ReloadableResourceBundleMessageSource msg = new ReloadableResourceBundleMessageSource();
		msg.setBasename("classpath:static/validate/message/account");
		msg.setDefaultEncoding("utf-8");
		return msg;
	}

}
