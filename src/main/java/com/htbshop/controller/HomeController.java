package com.htbshop.controller;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.htbshop.bean.MailInfo;
import com.htbshop.dao.ProductDAO;
import com.htbshop.entity.Product;
import com.htbshop.service.MailService;

@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;
	
	@Autowired
	MailService mailer;
	@RequestMapping("/home/index")
	public String home(Model model) {
		List<Product> list= pdao.findBySpecial(0);
		model.addAttribute("list", list);
		model.addAttribute("title", "Sản phẩm");
		
		return "home/index";
	}
	@RequestMapping("home/about")
	public String about() {
		return "home/about";
	}
	@RequestMapping("home/contact")
	public String contact() {
		return "home/contact";
	}
	@RequestMapping("home/feedback")
	public String feedback() {
		return "home/feedback";
	}
	@RequestMapping("home/nofi")
	public String notification(Model model, @RequestParam("email") String email) throws MessagingException {
		String form = "16130294@st.hcmuaf.edu.vn";
		String to = email;
		String subject = "Welcome to HTBStore";
		String body = "Cảm ơn bạn đã đăng kí nhận tin tử HTBStore. Chúng tôi sẽ thông báo cho bạn khi có sản phẩm mới.";
		MailInfo mail = new MailInfo(form, to, subject, body);
		mailer.send(mail);
		model.addAttribute("msg", "Đăng kí nhận tin thành công");
		return "redirect:/home/index";
	}
}
