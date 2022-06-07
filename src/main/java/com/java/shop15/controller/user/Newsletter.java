package com.java.shop15.controller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.dto.SimpleLetter;
@Controller
public class Newsletter {
	@RequestMapping(value = { "/newsletter" }, method = RequestMethod.GET) // -> action
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
//			SimpleLetter letter = new SimpleLetter("abc@gmail.com");
//			model.addAttribute("SimpleLetter", new SimpleLetter());
//			
			
			
		return "user/newsletter"; // =>duong dan toi VIEW.
	}
	@RequestMapping(value = { "/letter-ajax" }, method = RequestMethod.POST) // -> action
	public ResponseEntity<Map<String, Object>> contactAjax(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@RequestBody SimpleLetter letter){
		System.out.println("Letter[Email]: " + letter.getEmail());
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		// 200: thanh cong
		//500: khong thanh cong
		jsonResult.put("code", 200);
		jsonResult.put("message", "Save thanh cong dia chi " + letter.getEmail());
		return ResponseEntity.ok(jsonResult);
	}
}

