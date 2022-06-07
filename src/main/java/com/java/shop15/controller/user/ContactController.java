package com.java.shop15.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.dto.SimpleContact;

@Controller
public class ContactController {
	/*
	 * @RequestMapping(value = { "/contact" }, method = RequestMethod.GET) // ->
	 * action public String home(final Model model, final HttpServletRequest
	 * request, final HttpServletResponse response) throws IOException {
	 * model.addAttribute("SimpleContact", new SimpleContact()); return
	 * "user/contact"; // =>duong dan toi VIEW. }
	 * 
	 * @ModelAttribute("Contact") : gia trii contact phai trung voi gia tri trong
	 * modelAttribute="contact" trong spring form
	 * 
	 * @RequestMapping(value = { "/save-contact" }, method = RequestMethod.POST) //
	 * -> action public String saveContact(final Model model, final
	 * HttpServletRequest request, final HttpServletResponse response,
	 * 
	 * @ModelAttribute("SimpleContact") SimpleContact SimpleContact) throws
	 * IOException { // 1. lay thong tin nguoi dung day len // String email =
	 * request.getParameter("txtEmail"); // TODO 2: luu thong tin vao co so du lieu
	 * 
	 * // 3: thong bao cho nguoi dung biet luu thanh cong
	 * model.addAttribute("thongbao", "Cam on ban "+ email + " da gui lien he");
	 * model.addAttribute("thongbao", SimpleContact.getTxtEmail() + " " +
	 * SimpleContact.getTxtContent());
	 * 
	 * return "user/contact"; // =>duong dan toi VIEW. }
	 * 
	 * @RequestMapping(value = { "/contact-ajax" }, method = RequestMethod.POST) //
	 * -> action public ResponseEntity<Map<String, Object>> contactAjax(final Model
	 * model, final HttpServletRequest request, final HttpServletResponse response,
	 * final @RequestBody SimpleContact contact){
	 * System.out.println("Contact[Email]: " + contact.getTxtEmail());
	 * 
	 * Map<String, Object> jsonResult = new HashMap<String, Object>(); // 200: thanh
	 * cong //500: khong thanh cong jsonResult.put("code", 200);
	 * jsonResult.put("message", "Save thanh cong dia chi " +
	 * contact.getTxtEmail()); return ResponseEntity.ok(jsonResult); }
	 */
	
}
