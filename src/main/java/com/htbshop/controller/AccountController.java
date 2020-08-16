package com.htbshop.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.htbshop.bean.MailInfo;
import com.htbshop.dao.CustomerDAO;
import com.htbshop.entity.Customer;
import com.htbshop.service.CookieService;
import com.htbshop.service.MailService;

@Controller
public class AccountController {
	@Autowired
	CustomerDAO dao;
	@Autowired
	HttpSession session;
	@Autowired
	CookieService cookie;
	@Autowired
	ServletContext app; // lam viec voi file
	@Autowired
	MailService mailer;
	@Autowired
	HttpServletRequest request;

	@GetMapping("/account/login")
	public String login(Model model) {
		Cookie ckid = cookie.read("userId");
		Cookie ckpw = cookie.read("pass");
		if (ckid != null) {
			String uid = ckid.getValue();
			String pwd = ckpw.getValue();

			model.addAttribute("uid", uid);
			model.addAttribute("pwd", pwd);

		}
		return "account/login";
	}

	@PostMapping("/account/login")
	public String login(Model model, @RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam(value = "rm", defaultValue = "false") boolean rm) {
		Customer user = dao.findById(id);
		
		if (user == null) {
			model.addAttribute("msg", "Tên đăng nhập hoặc mật khẩu không đúng");
		} else if (!BCrypt.checkpw(pw, user.getPassword())) {
			model.addAttribute("msg", "Tên đăng nhập hoặc mật khẩu không đúng");
		} else if (!user.getActivated()) {
			model.addAttribute("msg", "Tài khoản không tồn tại, bạn chưa có tài khoản?");
		} else {
			model.addAttribute("msg", "Đăng nhập thành công");
			session.setAttribute("user", user);
			
		
			// ghi nho bang cookie
			if (rm == true) {
				cookie.create("userId", user.getId(), 30);
				cookie.create("pass", user.getPassword(), 30);
			} else {
				cookie.delete("userId");
				cookie.delete("pass");
			}
			
			// quay lai trang duoc bao ve ( neu co)
			String backUri = (String) session.getAttribute("back-uri");
			if (backUri != null) {
				return "redirect:" + backUri;
			}
			if(user.getAdmin() == true) {
				return "redirect:../admin/home/index";
			}
			return "redirect:/home/index";
		}
		return "account/login";
	}

	@RequestMapping("/account/logout")
	public String logout(Model model) {
		session.removeAttribute("user");
		return "redirect:/home/index";
	}

	@GetMapping("/account/register")
	public String register(Model model) {
		Customer user = new Customer();
		model.addAttribute("form", user);
		return "account/register";
	}

	@PostMapping("/account/register")
	public String register(Model model, @Validated @ModelAttribute("form") Customer user, BindingResult errors,
			@RequestParam("photo_file") MultipartFile file)
			throws IllegalStateException, IOException, MessagingException {
		if (errors.hasErrors()) {
			model.addAttribute("msg", "Vui lòng nhập đúng yêu cầu");
			return "account/register";
		} else {
			Customer user2 = dao.findById(user.getId());
			if (user2 != null) {
				model.addAttribute("msg", "Tên đã được sử dụng");
				return "account/register";
			}
		}
		if (file.isEmpty()) {
			user.setPhoto("user.png");
		} else {
			String dir = app.getRealPath("/static/images/customers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		String hash = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
		user.setPassword(hash);
		user.setActivated(false);
		user.setAdmin(false);
		dao.create(user);
		model.addAttribute("msg", "Đăng kí thành công, vào email để kích hoạt tài khoản");

		String form = "16130294@st.hcmuaf.edu.vn";
		String to = user.getEmail();
		String subject = "Welcome";
		String url = request.getRequestURL().toString().replace("register", "active/" + user.getId());
		String body = "Bạn đã đăng kí tài khoản ở HTBStore <a href='" + url + "'>Nhấn vào đây để kích hoạt</a>";
		MailInfo mail = new MailInfo(form, to, subject, body);
		mailer.send(mail);
		return "account/register";
	}

	@GetMapping("/account/active/{id}")
	public String active(Model model, @PathVariable("id") String id) {
		Customer user = dao.findById(id);
		user.setActivated(true);
		dao.update(user);
		return "redirect:/account/login";
	}

	@GetMapping("/account/forgot")
	public String forgot(Model model) {
		return "account/forgot";
	}

	@PostMapping("/account/forgot")
	public String forgot(Model model, @RequestParam("id") String id, @RequestParam("email") String email)
			throws MessagingException {
		Customer user = dao.findById(id);
		if (user == null) {
			model.addAttribute("msg", "Tên đăng nhập không đúng");
		} else if (!email.equals(user.getEmail())) {
			model.addAttribute("msg", "Email không đúng");
		} else {

			String form = "16130294@st.hcmuaf.edu.vn";
			String to = user.getEmail();
			String subject = "Welcome";
			String body = "Mật khẩu của bạn là: " + user.getPassword();
			MailInfo mail = new MailInfo(form, to, subject, body);
			mailer.send(mail);
			model.addAttribute("msg", "Mật khẩu đã được gửi vào email của bạn");
		}
		return "redirect:/account/login";
	}

	// doi mat khau
	@GetMapping("/account/change")
	public String change(Model model) {
		return "account/change";
	}

	@PostMapping("/account/change")
	public String change(Model model, @RequestParam("id") String id, @RequestParam("pw") String pw,
			@RequestParam("pw1") String pw1, @RequestParam("pw2") String pw2) throws MessagingException {
		if (!pw1.equals(pw2)) {
			model.addAttribute("msg", "Mật khẩu mới không khớp");
		} else {
			Customer user = dao.findById(id);
			if (user == null) {
				model.addAttribute("msg", "Tên đăng nhập không đúng");
			} else if (!pw.equals(user.getPassword())) {
				model.addAttribute("msg", "Email không đúng");
			} else {
				user.setPassword(pw1);
				dao.update(user);
				model.addAttribute("msg", "Đổi mật khẩu thành công");
			}
		}
		return "redirect:/account/login";
	}

	// cap nhat tai khoan
	@GetMapping("/account/edit")
	public String edit(Model model) {
		Customer user = (Customer) session.getAttribute("user");
		model.addAttribute("form", user);
		return "account/edit";
	}

	@PostMapping("/account/edit")
	public String edit(Model model, @ModelAttribute("form") Customer user,
			@RequestParam("photo_file") MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
			String dir = app.getRealPath("/static/images/customers");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			user.setPhoto(f.getName());
		}
		dao.update(user);
		session.setAttribute("user", user);
		model.addAttribute("msg", "Cập nhật thành công");
		return "account/edit";
	}

}
