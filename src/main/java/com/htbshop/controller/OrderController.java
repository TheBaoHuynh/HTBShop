package com.htbshop.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.htbshop.dao.OrderDAO;
import com.htbshop.dao.OrderDetailDAO;
import com.htbshop.entity.Customer;
import com.htbshop.entity.Order;
import com.htbshop.entity.OrderDetail;
import com.htbshop.entity.Product;
import com.htbshop.service.CartService;

@Controller
public class OrderController {
	@Autowired
	HttpSession session;
	@Autowired
	CartService cart;
	@Autowired
	OrderDAO dao;
	@Autowired
	OrderDetailDAO ddao;
	
	@GetMapping("/order/checkout")
	public String showForm(@ModelAttribute("order") Order order) {
		order.setOrderDate(new Date());
		Customer user = (Customer) session.getAttribute("user");
		order.setCustomer(user);
		order.setAmount(cart.getAmount());
		return "order/checkout";
	}
	@PostMapping("/order/checkout")
	public String purchase(Model model, @ModelAttribute("order") Order order) {
		Collection<Product> list = cart.getItems();
		List<OrderDetail> details = new ArrayList<>();
		for(Product product : list) {
			OrderDetail detail = new OrderDetail();
			detail.setOrder(order);
			detail.setProduct(product);
			detail.setUnitPrice(product.getUnitPrice());
			detail.setQuantity(product.getQuantity());
			detail.setDiscount(product.getDiscount());
			details.add(detail);
		}
		dao.create(order,details);
		cart.clear();
		return "redirect:/order/list";
	}
	@GetMapping("/order/list")
	public String list(Model model) {
		Customer user = (Customer) session.getAttribute("user");
		List<Order> orders = dao.findByUser(user);
		model.addAttribute("orders", orders);
		return "order/list";
	}
	@GetMapping("/order/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Order order = dao.findById(id);
		List<OrderDetail> details = ddao.findByOrder(order);
		model.addAttribute("order", order);
		model.addAttribute("details", details);
		return "order/detail";
	}
	@GetMapping("/order/items")
	public String itmes(Model model) {
		Customer user = (Customer) session.getAttribute("user");
		List<Product> list = dao.findItemsByUser(user);
		model.addAttribute("list", list);
		model.addAttribute("title", "Hàng đã mua");
		return "product/list";
	}



}
