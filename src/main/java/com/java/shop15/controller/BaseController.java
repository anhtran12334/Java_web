package com.java.shop15.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.java.shop15.entities.Categories;
import com.java.shop15.entities.Products;
import com.java.shop15.entities.Roles;
import com.java.shop15.entities.Search;
import com.java.shop15.entities.users;
import com.java.shop15.services.CategoryService;
import com.java.shop15.services.ProductService;
import com.java.shop15.services.SearchService;





public abstract class BaseController {
	@Autowired
	private CategoryService categortyService;
	
	@Autowired
	private ProductService productService;
	@Autowired
	private SearchService searchService;
	//lay current page, mac dinh trar ve 1
	public int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	public int getItem(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("item"));
		} catch (Exception e) {
			return  5;
		}
	}
	public Integer getInteger(HttpServletRequest request, String paramName) {
		try {
			return Integer.parseInt(request.getParameter(paramName));
		} catch (Exception e) {
			return null;
		}
	}
	
	@ModelAttribute("categories")
	public List<Categories> categories(){
		return categortyService.findAll();
	}

	@ModelAttribute("products")
	public List<Products> products(){
		return productService.findAll();
	}
	@ModelAttribute("keywordList")
	public List<Search> search(){
		
		return searchService.findAll();
	}
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		boolean isLogined = false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			isLogined = true;
		}
		return isLogined;
	}
	@ModelAttribute("userLogined")
	public users getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails)
			return (users) userLogined;
		
		return null;
	}
	@ModelAttribute("Roles")
	public List<String> roles() {
		
		List<String> roles = new ArrayList<String>();
		users logined = getUserLogined();
		if(logined == null) return roles;
		for(Roles r : logined.getRoles()) {
			roles.add(r.getAuthority());
		}
		return roles;
		
	}
	@ModelAttribute("isAdmin")
	public boolean isAdmin() {
		for(String role: roles()) {
			if(role.equalsIgnoreCase("admin")) return true;
		}
		return false;
	}
	@ModelAttribute("isManager")
	public boolean isManager() {
		for(String role: roles()) {
			if(role.equalsIgnoreCase("manager")) return true;
		}
		return false;
	}
	@ModelAttribute("isMember")
	public boolean isMember() {
		for(String role: roles()) {
			if(role.equalsIgnoreCase("guest")) return true;
		}
		return false;
	}
}
