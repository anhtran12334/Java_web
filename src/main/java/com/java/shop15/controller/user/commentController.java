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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.java.shop15.components.Utilities;
import com.java.shop15.entities.Comment;
import com.java.shop15.entities.Roles;
import com.java.shop15.entities.users;
import com.java.shop15.services.CommentService;

@Controller
public class commentController {
	@Autowired
	private CommentService commentService;
	@RequestMapping(value = { "/comment" }, method = RequestMethod.GET) // ->action 
	public String comment(final Model model, final HttpServletRequest
  request, final HttpServletResponse response)
  
  throws IOException {
  
		model.addAttribute("comment", new Comment());
  return "/user/Comment"; 
  }
	@RequestMapping(value = { "/saveComment" }, method = RequestMethod.POST) // ->action 
	public String saveSignUp(final Model model, final HttpServletRequest
  request, final HttpServletResponse response,
  @ModelAttribute("comment") Comment comment,
  @RequestParam("productAvatar") MultipartFile commentImage)
  throws IOException {
		
		
		if (comment.getId() == null || comment.getId() <= 0) { // thêm mới
			commentService.add(comment, commentImage);
		} else { // chỉnh sửa
			commentService.update(comment, commentImage);
		}
		commentService.saveOrUpdate(comment);	
  return "/user/Comment"; 
  }
}
