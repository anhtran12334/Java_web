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
import com.java.shop15.dto.ProductSearch;
import com.java.shop15.entities.Categories;
import com.java.shop15.entities.Products;
import com.java.shop15.services.CategoryService;
import com.java.shop15.services.ProductService;



@Controller
public class AddProduct extends BaseController{

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;
	
	
	@RequestMapping(value = { "/admin/product/list" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		// code cu la lay tat ca san pham
		List<Products> products = productService.findAll();

		// gửi danh sách products xuống views
		model.addAttribute("products", products);
		//code moi dung phan trang
		
		//lay keyword 
		String keyword = request.getParameter("keyword");
		
		ProductSearch searchModel = new ProductSearch();
		searchModel.keyword = keyword;
		searchModel.page = getCurrentPage(request);
		searchModel.categoryId = super.getInteger(request, "categoryId");// request.getParameter("categoryId");
		model.addAttribute("productsWithPaging", productService.search(searchModel));
		model.addAttribute("searchModel", searchModel);
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "manager/ProductList"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.GET) // -> action
	public String addProduct(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		// gui ds categories xuong view

		model.addAttribute("categories", categoryService.findAll());

		model.addAttribute("product", new Products());
		return "manager/product"; // =>duong dan toi VIEW.
	}

	@RequestMapping(value = { "/admin/product/edit/{productId}" }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("productId") int productId) throws IOException {

		// gửi danh sách categories xuống view
		model.addAttribute("categories", categoryService.findAll());

		Products product = productService.getById(productId);

		// gửi danh sách products xuống views
		model.addAttribute("product", product);

		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "manager/product"; // -> đường dẫn tới View.
	}

	@RequestMapping(value = { "/admin/product" }, method = RequestMethod.POST) // -> action
	public String saveProduct(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("product") Products product, 
			@RequestParam("productAvatar") MultipartFile productAvatar, // hứng																										// file																											// đẩy																										// lên
			@RequestParam("productPictures") MultipartFile[] productPictures) // hứng file đẩy lên)
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

		if (product.getId() == null || product.getId() <= 0) { // thêm mới
			productService.add(product, productAvatar, productPictures);
		} else { // chỉnh sửa
			productService.update(product, productAvatar, productPictures);
		}
		productService.saveOrUpdate(product);

		return "manager/product"; // =>duong dan toi VIEW.
	}
	@RequestMapping(value = { "/removeProduct/{id}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> removeProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {
		System.out.println(id);
		Products product = productService.getById(id);
//		product.setStatus(false);
//		productService.saveOrUpdate(product);
		productService.deleteById(id);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("message", "Đã xóa thành công sản phẩm có id là " + id);
		jsonResult.put("id", id);
		return ResponseEntity.ok(jsonResult);

	}
}
