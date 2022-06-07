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

import com.java.shop15.components.Utilities;
import com.java.shop15.controller.BaseController;

import com.java.shop15.dto.UserSearch;
import com.java.shop15.entities.Roles;
import com.java.shop15.entities.users;
import com.java.shop15.services.RoleService;
import com.java.shop15.services.UserService;

@Controller
public class ManagerCategoryUser extends BaseController{
		
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = { "/admin/user/list" }, method = RequestMethod.GET)
	public String adminUserList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		Roles role = roleService.getByTransactQuerySQL("select*from tbl_roles where name = 'GUEST'");
		//code moi dung phan trang
		
		model.addAttribute("roleId", role.getId());
		//lay keyword 
		String keyword = request.getParameter("keyword");
		
		UserSearch userModel = new UserSearch();
		userModel.keyword = keyword;
		userModel.page = getCurrentPage(request);
		
		model.addAttribute("users", userService.searchRole(userModel, 1));
		model.addAttribute("usersWithPaging", userService.search(userModel));
		model.addAttribute("userModel", userModel);
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "manager/user"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/user/guest/list" }, method = RequestMethod.GET)
	public String adminUserGuestList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		Roles role = roleService.getByTransactQuerySQL("select*from tbl_roles where name = 'GUEST'");
		//code moi dung phan trang
		
		model.addAttribute("roleId", role.getId());
		//lay keyword 
		String keyword = request.getParameter("keyword");
		
		UserSearch userModel = new UserSearch();
		userModel.keyword = keyword;
		userModel.page = getCurrentPage(request);
		
		model.addAttribute("users", userService.searchRole(userModel, 2));
		model.addAttribute("usersWithPaging", userService.search(userModel));
		model.addAttribute("userModel", userModel);
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "manager/guest"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/user/manager/list" }, method = RequestMethod.GET)
	public String adminUserManagerList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		Roles role = roleService.getByTransactQuerySQL("select*from tbl_roles where name = 'MANAGER'");
		//code moi dung phan trang
		
		model.addAttribute("roleId", role.getId());
		//lay keyword 
		String keyword = request.getParameter("keyword");
		
		UserSearch userModel = new UserSearch();
		userModel.keyword = keyword;
		userModel.page = getCurrentPage(request);
		
		model.addAttribute("users", userService.searchRole(userModel, 3));
		model.addAttribute("usersWithPaging", userService.search(userModel));
		model.addAttribute("userModel", userModel);
		// MVC được cấu hình chỉ định vào thư mục /src/main/webapp/WEB-INF/views
		// để tìm các views
		// /WEB-INF/views/user/index.jsp
		return "manager/manager"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/addUser" }, method = RequestMethod.GET) // -> action
	public String home(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("roles", roleService.findAll());
		model.addAttribute("user", new users());
		return "manager/AddUser"; // =>duong dan toi VIEW.
	}

	@RequestMapping(value = { "/admin/user/edit/{userId}" }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("userId") int userId) throws IOException {
		users user =	userService.getById(userId);
		
		model.addAttribute("roles", roleService.findAll());
		// gửi danh sách products xuống views
		model.addAttribute("user", user);

		return "manager/AddUser"; // -> đường dẫn tới View.
	}

	@RequestMapping(value = { "/admin/addUser" }, method = RequestMethod.POST) // -> action
	public String saveContact(final Model model, final HttpServletRequest request, final HttpServletResponse response,
			@ModelAttribute("user") users user) // hứng																										// file																											// đẩy																										// lên
			
			throws IOException {
			int r = Integer.parseInt(request.getParameter("role"));
			Roles role = roleService.getById(r);
			user.addRoles(role);
			user.setPassword(Utilities.encode(user.getPassword()));
		userService.saveOrUpdate(user);

		return "manager/AddUser"; // =>duong dan toi VIEW.
	}
	@RequestMapping(value = { "/removeUser/{id}/{roleId}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> removeProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id,
			@PathVariable("roleId") int roleId) throws IOException {
		System.out.println(id);
		
		users user = userService.getById(id);
		
		Roles role = roleService.getById(roleId);
		user.deleteRoles(role);
		userService.deleteById(id);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("message", "Đã xóa thành công  người dùng có id là " + id);
		jsonResult.put("id", id);
		return ResponseEntity.ok(jsonResult);

	}
}
