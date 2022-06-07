package com.java.shop15.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.components.Utilities;
import com.java.shop15.entities.Roles;
import com.java.shop15.entities.users;
import com.java.shop15.services.RoleService;
import com.java.shop15.services.UserService;

@Controller
public class LoginUserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
//	@RequestMapping(value = { "/login/user" }, method = RequestMethod.GET) // ->action 
//	public String login(final Model model, final HttpServletRequest
//  request, final HttpServletResponse response)
//  
//  throws IOException {
//  
//  return "/user/loginUser"; 
//  }
	@RequestMapping(value = { "/signUp" }, method = RequestMethod.GET) // ->action 
	public String signUp(final Model model, final HttpServletRequest
  request, final HttpServletResponse response)
  
  throws IOException {
  
		model.addAttribute("user", new users());
  return "/user/sign-up"; 
  }
	@RequestMapping(value = { "/savesignUp" }, method = RequestMethod.POST) // ->action 
	public String saveSignUp(final Model model, final HttpServletRequest
  request, final HttpServletResponse response,
  @ModelAttribute("user") users user)
  throws IOException {
		Roles role = roleService.getById(19);
		user.addRoles(role);
		user.setPassword(Utilities.encode(user.getPassword()));
		userService.saveOrUpdate(user);	
  return "/user/sign-up"; 
  }
}
