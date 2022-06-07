package com.java.shop15.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.controller.BaseController;
import com.java.shop15.dto.CategorySearch;
import com.java.shop15.dto.ProductSearch;
import com.java.shop15.dto.ResultsSearch;
import com.java.shop15.dto.SimpleLetter;
import com.java.shop15.entities.Categories;
import com.java.shop15.entities.Contact;
import com.java.shop15.entities.Products;
import com.java.shop15.entities.users;
import com.java.shop15.services.CategoryService;
import com.java.shop15.services.ContactService;
import com.java.shop15.services.PagerData;
import com.java.shop15.services.ProductService;
import com.java.shop15.services.SearchService;
import com.java.shop15.services.UserService;

@Controller //-> đây la 1 bean cho lại controller
public class HomeController extends BaseController{
	
	@Autowired
	private ContactService contactService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
	@Autowired 
	private MailSender mailSender;
	@Autowired
	private SearchService searchService;
	@Autowired
	private UserService userService;
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET) // -> action
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
	
			throws IOException {
		if(getUserLogined()!=null) {
			users user = userService.getUserById(getUserLogined().getId());
			ResultsSearch result = new ResultsSearch();
			result.userId = user.getId();
			  
			model.addAttribute("resultSearchList", searchService.search(result));
			}
		
		return "user/home"; // =>duong dan toi VIEW.
	}
	 
	
	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET) // -> action
	public String ahome(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
	
			throws IOException {
		
		return "manager/home"; // =>duong dan toi VIEW.
	}
	
	@RequestMapping(value = { "/ajax-contact" }, method = RequestMethod.POST) // -> action
	public ResponseEntity<Map<String, Object>> contactAjax(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestBody SimpleLetter letter){
		
		Contact contact = new Contact();
		contact.setEmail(letter.getEmail());
		contact.setCreatedDate(new java.util.Date());
		contactService.saveOrUpdate(contact);
		
		sendEmail(letter.getEmail());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// 200: thanh cong
		//500: khong thanh cong
		jsonResult.put("code", 200);
		jsonResult.put("message", "Bạn Đã Đăng Ký Thành Công! Hãy Chú Ý Để Nhận thông Tin Từ chúng Tôi Nhé !  " );
		jsonResult.put("email", contact.getEmail());
		return ResponseEntity.ok(jsonResult);
		
	}
public void sendEmail(String to) {
		
		// Create a Simple MailMessage.
        SimpleMailMessage message = new SimpleMailMessage();
        
		message.setTo(to);
        message.setSubject("Hôm nay ăn gì gửi thông báo đến bạn!");
        message.setText("Hello");
        
        mailSender.send(message);
	}
}
// path variable 

