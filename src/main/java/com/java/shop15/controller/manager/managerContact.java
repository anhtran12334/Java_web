package com.java.shop15.controller.manager;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.controller.BaseController;

import com.java.shop15.dto.ContactSearch;
import com.java.shop15.entities.SaleOrder;
import com.java.shop15.services.ManagerContactService;

@Controller
public class managerContact extends BaseController{
	@Autowired
	private ManagerContactService contactService;
	@RequestMapping(value = { "/admin/contact/list" }, method = RequestMethod.GET)
	public String adminContactList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		//code moi dung phan trang
		
		//lay keyword 
		String keyword = request.getParameter("keyword");
		
		ContactSearch contactModel = new ContactSearch();
		contactModel.keyword = keyword;
		contactModel.page = getCurrentPage(request);
		
		model.addAttribute("ContactsWithPaging", contactService.search(contactModel));
		model.addAttribute("contactModel", contactModel);
		return "manager/contact"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/removecontact/{id}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> receiveSaleOrder(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {
		
		

		contactService.deleteById(id);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("message", "Đã xóa thành công liên hệ có id là " + id);
		jsonResult.put("id", id);
		return ResponseEntity.ok(jsonResult);

	}
}
