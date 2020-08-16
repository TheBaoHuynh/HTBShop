package com.htbshop.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.htbshop.dao.ProductDAO;
import com.htbshop.entity.Customer;
import com.htbshop.entity.Product;

@Controller
public class ProductManager {
	@Autowired
	ProductDAO dao;
	@Autowired
	//muon upload file phai co cai nay
	ServletContext app;
	
	@RequestMapping("/admin/product/index")
	public String index(Model model) {
		Product entity = new Product();
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/product/index";
	}
	@RequestMapping("/admin/product/edit/{id}")
	public String edit(Model model,
			@PathVariable("id") Integer id) {
		Product entity = dao.findById(id);
		model.addAttribute("entity", entity);
		model.addAttribute("list", dao.findAll());
		return "admin/product/index";
	}
	//them danh muc
	@RequestMapping("/admin/product/create")
	public String create(RedirectAttributes model,
			@ModelAttribute("entity") Product entity,
			@RequestParam("image-file") MultipartFile file) throws IllegalStateException, IOException {
		if(file.isEmpty()) {
			entity.setImage("user.png");
		}else {
			entity.setImage(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/products/" + entity.getImage());
			file.transferTo(new File(path));
		}
		dao.create(entity);
		model.addAttribute("msg", "Thêm thành công");
		return "redirect:/admin/product/index";
	}
	@RequestMapping("/admin/product/update")
	public String update(RedirectAttributes model, 
			@ModelAttribute("entity") Product entity,
			@RequestParam("image-file") MultipartFile file) throws IllegalStateException, IOException {
		if(!file.isEmpty()) {
			entity.setImage(file.getOriginalFilename());
			String path = app.getRealPath("/static/images/products/" + entity.getImage());
			file.transferTo(new File(path));
		}
		dao.update(entity);
		model.addAttribute("msg", "Sửa thành công");
		return "redirect:/admin/product/edit/" + entity.getId();
	}
	@RequestMapping(value= {"/admin/product/delete","/admin/product/delete/{id}"})
	public String delete(RedirectAttributes model,
			@RequestParam(value = "id", required = false) Integer id1,
			@PathVariable(value = "id", required = false) Integer id2) {
		// id bang id1 neu id1 khac null, nguoc lại thì id = id2
		Integer id =(id1 != null) ?  id1 : id2;
		dao.delete(id);
		model.addAttribute("msg", "Xóa thành công");
		return "redirect:/admin/product/index";
	}
	//phan trang
	int pageSize = 5;
	@ResponseBody
	@RequestMapping("/pager/product/page-count")
	public long pageCount() {
		return dao.getPageCount(pageSize);
	}
	@ResponseBody
	@RequestMapping("/pager/product/page/{pageNo}")
	public List<Product> getPage(@PathVariable("pageNo") int pageNo) {
		List<Product> list =  dao.getPage(pageNo, pageSize);
		return list;
	}
}
