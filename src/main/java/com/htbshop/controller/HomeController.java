package com.htbshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.htbshop.dao.ProductDAO;
import com.htbshop.entity.Product;

@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;
	@RequestMapping("/home/index")
	public String home(Model model) {
		List<Product> list= pdao.findBySpecial(1);
		model.addAttribute("list", list);
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
}
