package com.java.shop15.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.controller.BaseController;
import com.java.shop15.dto.ProductSearch;
import com.java.shop15.dto.ResultsSearch;
import com.java.shop15.dto.SaleOrderSearch;
import com.java.shop15.entities.Products;
import com.java.shop15.entities.Search;
import com.java.shop15.entities.users;
import com.java.shop15.services.ProductService;
import com.java.shop15.services.SearchService;
import com.java.shop15.services.UserService;

@Controller
public class ResultSearchController extends BaseController{
	@Autowired
	private ProductService productService;
	@Autowired
	private SearchService searchService;
	@Autowired
	private UserService userService;
	@RequestMapping(value = { "/resultSearch/list" }, method = RequestMethod.GET)
	public String resultSearchList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response
			) throws IOException {
		String keyword = request.getParameter("keyword");
		Search search = new Search();
		if(getUserLogined()!=null) {
			users user = userService.getUserById(getUserLogined().getId());
			
			search.setSearchUser(user);
			search.setKeyword(keyword);
			search.setCreatedDate(new java.util.Date());
			searchService.saveOrUpdate(search);
		}
		//lay keyword 
		
		ProductSearch searchModel = new ProductSearch();
		
		/* search.setSearchUser(getUserLogined()); */
		searchModel.keyword = keyword;
		searchModel.page = getCurrentPage(request);
		model.addAttribute("resultsWithPaging", productService.search(searchModel));
		
		return "user/resultsSearch"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/resultSearch/list/{keyword}" }, method = RequestMethod.GET)
	public String resultSearchList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("keyword") String keyword) throws IOException {
		
		
		//lay keyword 
		
		ProductSearch searchModel = new ProductSearch();
		
		searchModel.keyword = keyword;
		searchModel.page = getCurrentPage(request);
		
		model.addAttribute("result", productService.search(searchModel));
		
		return "user/historySearch"; // -> đường dẫn tới View.
	}
	/*
	 * @RequestMapping(value = { "/search" }, method = RequestMethod.GET) // ->
	 * action public String list(final Model model, final HttpServletRequest
	 * request, final HttpServletResponse response)
	 * 
	 * throws IOException { if(getUserLogined()!=null) { users user =
	 * userService.getUserById(getUserLogined().getId()); ResultsSearch result = new
	 * ResultsSearch(); result.userId = user.getId();
	 * 
	 * model.addAttribute("resultSearchList", searchService.search(result)); }
	 * return "user/home"; }
	 */
}
