package com.htbshop.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.htbshop.dao.OrderDAO;
import com.htbshop.dao.OrderDetailDAO;
import com.htbshop.entity.Order;

@Controller
public class OrderManager {
	@Autowired
	OrderDAO dao;
	@Autowired
	OrderDetailDAO ddao;
	
	@RequestMapping("/admin/order/index")
	public String index(Model model) {
		Order entity = new Order();
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		return "admin/order/index";
	}
	@RequestMapping("/admin/order/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") Integer id) {
		Order entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("details", ddao.findByOrder(entity));
		model.addAttribute("list", dao.findAll());
		return "admin/order/index";
	}
	//them danh muc
	@RequestMapping("/admin/order/create")
	public String create(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		dao.create(entity);
		model.addAttribute("msg", "Thêm thành công");
		return "redirect:/admin/order/index";
	}
	@RequestMapping("/admin/order/update")
	public String update(RedirectAttributes model, @ModelAttribute("entity") Order entity) {
		dao.update(entity);
		model.addAttribute("msg", "Sửa thành công");
		return "redirect:/admin/order/edit/" + entity.getId();
	}
	@RequestMapping(value= {"/admin/order/delete","/admin/order/delete/{id}"})
	public String delete(RedirectAttributes model,
			@RequestParam(value = "id", required = false) Integer id1,
			@PathVariable(value = "id", required = false) Integer id2) {
		// id bang id1 neu id1 khac null, nguoc lại thì id = id2
		Integer id =(id1 != null) ? id1 : id2;
		dao.delete(id);
		model.addAttribute("msg", "Xóa thành công");
		return "redirect:/admin/order/index";
	}

	//phan trang
	int pageSize = 5;
	@ResponseBody
	@RequestMapping("/pager/order/page-count")
	public long pageCount() {
		return dao.getPageCount(pageSize);
	}
	@ResponseBody
	@RequestMapping("/pager/order/page/{pageNo}")
	public List<Order> getPage(@PathVariable("pageNo") int pageNo) {
		List<Order> list =  dao.getPage(pageNo, pageSize);
		return list;
	}
}
