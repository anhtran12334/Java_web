package com.java.shop15.controller.user;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.dto.ProductSearch;
import com.java.shop15.entities.Products;
import com.java.shop15.services.PagerData;
import com.java.shop15.services.ProductService;
@Controller
public class detailProduct {
	
	@Autowired
	private ProductService productService;
	@RequestMapping(value = { "/detailProduct/{seo}" }, method = RequestMethod.GET) // -> action
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("seo") String seo)
	
			throws IOException {
		
		ProductSearch productSearchModel = new ProductSearch();
		productSearchModel.seo = seo;
		
		PagerData<Products> pageData = productService.search(productSearchModel);
		
		Products product = pageData.getData().get(0);
		model.addAttribute("product", product);
			
		return "user/detailProduct"; // =>duong dan toi VIEW.
	}
}
