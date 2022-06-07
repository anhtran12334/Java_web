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

import com.java.shop15.controller.BaseController;
import com.java.shop15.dto.CategorySearch;
import com.java.shop15.dto.ProductSearch;
import com.java.shop15.entities.Categories;
import com.java.shop15.entities.Contact;
import com.java.shop15.entities.Products;
import com.java.shop15.services.CategoryService;
import com.java.shop15.services.PagerData;
import com.java.shop15.services.ProductService;

@Controller
public class ListProductController extends BaseController{
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@RequestMapping(value = { "/listProduct/{seo}" }, method = RequestMethod.GET) // -> action
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("seo") String seo)
			
			throws IOException {
		CategorySearch categorySearchModel = new CategorySearch();
		categorySearchModel.seo = seo;
		
		PagerData<Categories> pageData = categoryService.search(categorySearchModel);
		
		
		Categories category = pageData.getData().get(0);
		model.addAttribute("curentCategory", category);
		
		ProductSearch productSearchModel = new ProductSearch();
		productSearchModel.categoryId = category.getId();
		model.addAttribute("productsData", productService.search(productSearchModel));
		/*
		 * model.addAttribute("category", category);
		 */
		return "user/categoryProduct"; // =>duong dan toi VIEW.
	}
}
