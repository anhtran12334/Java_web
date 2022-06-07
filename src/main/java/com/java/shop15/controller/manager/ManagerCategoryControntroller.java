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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.java.shop15.controller.BaseController;
import com.java.shop15.dto.CategorySearch;

import com.java.shop15.entities.Categories;
import com.java.shop15.entities.Products;
import com.java.shop15.services.CategoryService;

@Controller
public class ManagerCategoryControntroller extends BaseController{
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = { "/admin/category/list" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		// code cu la lay tat ca san pham
		List<Categories> category = categoryService.findAll();

		// gửi danh sách products xuống views
		model.addAttribute("category", category);
		//code moi dung phan trang
		
		//lay keyword 
		String keyword = request.getParameter("keyword");
		
		CategorySearch categoryModel = new CategorySearch();
		categoryModel.keyword = keyword;
		categoryModel.page = getCurrentPage(request);
		categoryModel.categoryId = super.getInteger(request, "categoryId");// request.getParameter("categoryId");
		model.addAttribute("categoriesWithPaging", categoryService.search(categoryModel));
		model.addAttribute("categoryModel", categoryModel);
		return "manager/category"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/addCategory" }, method = RequestMethod.GET) // -> action
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		/*
		 * // gui ds categories xuong view
		 * 
		 * model.addAttribute("categories", categoryService.findAll());
		 */

		model.addAttribute("category", new Categories());
		
		return "manager/AddCategory"; // =>duong dan toi VIEW.
	}

	@RequestMapping(value = { "/admin/category/edit/{categoryId}" }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("categoryId") int categoryId) throws IOException {

		/*
		 * // gửi danh sách categories xuống view model.addAttribute("categories",
		 * categoryService.findAll());
		 */

		Categories category = categoryService.getById(categoryId);

		// gửi danh sách products xuống views
		model.addAttribute("category", category);

		
		return "manager/AddCategory"; // -> đường dẫn tới View.
	}

	@RequestMapping(value = { "/admin/addCategory" }, method = RequestMethod.POST) // -> action
	public String saveContact(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("category") Categories category, 
			@RequestParam("categoryAvatar") MultipartFile categoryAvatar) // hứng																										// file																											// đẩy																										// lên
			
			throws IOException {
		// 1. lay thong tin nguoi dung day len
		/*
		 * // String email = request.getParameter("txtEmail");
		 */ // TODO 2: luu thong tin vao co so du lieu

		// 3: thong bao cho nguoi dung biet luu thanh cong
		/* model.addAttribute("thongbao", "Cam on ban "+ email + " da gui lien he"); */
//		model.addAttribute("thongbao", SimpleProduct.getFoodname() + " " + SimpleProduct.getStorename());
		// cần kiểm tra xem id của product
		// = null || = 0 thì thêm mới
		// ngược lại là chỉnh sửa

		if (category.getId() == null || category.getId() <= 0) { // thêm mới
			categoryService.add(category, categoryAvatar);
		} else { // chỉnh sửa
			categoryService.update(category, categoryAvatar);
		}
		categoryService.saveOrUpdate(category);

		return "manager/AddCategory"; // =>duong dan toi VIEW.
	}
	@RequestMapping(value = { "/removeCategory/{id}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> removeProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {
		System.out.println(id);
		Categories category = categoryService.getById(id);
//		product.setStatus(false);
//		productService.saveOrUpdate(product);
		categoryService.deleteById(id);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("message", "Đã xóa thành công danh mục có id là " + id);
		jsonResult.put("id", id);
		return ResponseEntity.ok(jsonResult);

	}
}
