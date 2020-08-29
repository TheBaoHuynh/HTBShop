package com.htbshop.controller;

import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.htbshop.dao.ProductDAO;
import com.htbshop.entity.Product;
import com.htbshop.service.CookieService;

@Controller
public class ProductController {
	@Autowired
	ProductDAO pdao;
	@Autowired
	CookieService cookie;
	

	@RequestMapping("/product/list-by-category/{cid}")
	public String listByCategory(Model model, @PathVariable("cid") Integer categoryId) {
		List<Product> list = pdao.findByCategoryId(categoryId);
		model.addAttribute("list", list);
		model.addAttribute("title", "Danh mục ");
		return "product/list";
		
	}
	//tiem kiem san pham
	@RequestMapping("/product/list-by-keywords")
	public String listByKeyword(Model model, @RequestParam("keywords") String keywords) {
		List<Product> list = pdao.findByKeywords(keywords);
		model.addAttribute("list", list);
		model.addAttribute("title", "Kết quả tìm kiếm");
		return "product/list";
		
	}
	
	@RequestMapping("/product/list-by-special/{id}")
	public String listBySpecial(Model model, @PathVariable("id") Integer id) {
		List<Product> list = pdao.findBySpecial(id);
		model.addAttribute("list", list);
		return "product/list";
		
	}
	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product p = pdao.findById(id);
		model.addAttribute("p", p);
		model.addAttribute("title", "Chi tiết sản phẩm");
		//dem so lan xem
		p.setViewCount(p.getViewCount() +1);
		pdao.update(p);
		
		//san phan tuong tu
		List<Product> list = pdao.findByCategoryId(p.getCategory().getId());
		
		model.addAttribute("list", list);
		
		//san pham yeu thich
		Cookie favo = cookie.read("favo");
		if(favo !=null) {
			String ids = favo.getValue();
			List<Product> favo_list = pdao.findByIds(ids);
			model.addAttribute("favote", favo_list);
		}
		//san pham da xem
		Cookie viewed = cookie.read("viewed"); //lay cookie tu client
		String value =id.toString();
		if(viewed != null) {
			value = viewed.getValue();
			value += "," +id.toString();
		}
		cookie.create("viewed", value, 10);
		List<Product> viewed_list = pdao.findByIds(value);
		model.addAttribute("viewed", viewed_list);
		return "product/detail";
		
	}
	@ResponseBody
	@RequestMapping("/product/add-to-favo/{id}")
	public boolean addToFavo(Model model, @PathVariable("id") Integer id) {
		Cookie favo = cookie.read("favo"); //lay cookie tu client
		String value = id.toString(); // lay 
		if(favo != null) {
			value = favo.getValue(); //neu co lay gia tri cookie coi co id do chua
			if(!value.contains(id.toString())) {
				value = value + "," + id.toString();
			}else {
				return false;
			}
			
		}
		favo = cookie.create("favo", value, 30);
		return true;
		
	}

}
