package com.java.shop15.controller.manager;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.controller.BaseController;
import com.java.shop15.dto.CategorySearch;
import com.java.shop15.dto.SaleOrderComment;
import com.java.shop15.dto.SaleOrderProductSearch;
import com.java.shop15.dto.SaleOrderSearch;
import com.java.shop15.entities.Categories;
import com.java.shop15.entities.SaleOderProducts;
import com.java.shop15.entities.SaleOrder;
import com.java.shop15.entities.users;
import com.java.shop15.services.CommentService;
import com.java.shop15.services.SaleOrderProductsService;
import com.java.shop15.services.SaleOrderService;
import com.java.shop15.services.UserService;

@Controller
public class ManagerSalaOrderController extends BaseController{
	@Autowired
	private SaleOrderService saleOrderService;
	@Autowired
	private SaleOrderProductsService saleOrderProductsService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private UserService userService;
	@RequestMapping(value = { "/admin/saleOrder/list" }, method = RequestMethod.GET)
	public String adminSaleOrderList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		
		//lay keyword 
		String keyword = request.getParameter("keyword");
		String code = request.getParameter("code");
		String createdDate = request.getParameter("createdDate");
		String phoneNumber = request.getParameter("phoneNumber");
		/* String item = request.getParameter("item"); */
		SaleOrderSearch saleOrderModel = new SaleOrderSearch();
		saleOrderModel.keyword = keyword;
		saleOrderModel.code = code;
		saleOrderModel.item = getItem(request);
		saleOrderModel.phoneNumber = phoneNumber;
		saleOrderModel.createdDate = createdDate;
		saleOrderModel.page = getCurrentPage(request);
		saleOrderModel.status = true;
		
		model.addAttribute("saleOrdersWithPaging", saleOrderService.search(saleOrderModel));
		model.addAttribute("saleOrderModel", saleOrderModel);
		model.addAttribute("saleOrderall", saleOrderService.findAll());
		return "manager/saleOrder"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/saleOrderReceived/list" }, method = RequestMethod.GET)
	public String adminSaleOrderListr(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		
		//lay keyword 
		String keyword = request.getParameter("keyword");
		String code = request.getParameter("code");
		String createdDate = request.getParameter("createdDate");
		String phoneNumber = request.getParameter("phoneNumber");
		
		SaleOrderSearch saleOrderModel = new SaleOrderSearch();
		saleOrderModel.keyword = keyword;
		saleOrderModel.code = code;
		saleOrderModel.item = getItem(request);
		saleOrderModel.phoneNumber = phoneNumber;
		saleOrderModel.createdDate = createdDate;
		saleOrderModel.page = getCurrentPage(request);
		saleOrderModel.status = false;
		saleOrderModel.trangthai = 0;
		
		model.addAttribute("saleOrdersWithPaging", saleOrderService.search(saleOrderModel));
		model.addAttribute("saleOrderModel", saleOrderModel);
		
		return "manager/receivedSaleOrder"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/commentSaleOrder/list" }, method = RequestMethod.GET)
	public String commentSaleOrder(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		
		//lay keyword 
		String keyword = request.getParameter("keyword");
		String code = request.getParameter("code");
		String createdDate = request.getParameter("createdDate");
		String phoneNumber = request.getParameter("phoneNumber");
		
		SaleOrderSearch saleOrderModel = new SaleOrderSearch();
		saleOrderModel.keyword = keyword;
		saleOrderModel.code = code;
		saleOrderModel.item = getItem(request);
		saleOrderModel.phoneNumber = phoneNumber;
		saleOrderModel.createdDate = createdDate;
		saleOrderModel.page = getCurrentPage(request);
		saleOrderModel.trangthai = 1;
		
		model.addAttribute("saleOrdersWithPaging", saleOrderService.search(saleOrderModel));
		model.addAttribute("saleOrderModel", saleOrderModel);
		
		return "manager/commentSaleOrder"; // -> đường dẫn tới View.
	}
	
	@RequestMapping(value = { "/admin/history/list" }, method = RequestMethod.GET)
	public String history(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		
		//lay keyword 
		String keyword = request.getParameter("keyword");
		String code = request.getParameter("code");
		String createdDate = request.getParameter("createdDate");
		String phoneNumber = request.getParameter("phoneNumber");
		
		SaleOrderSearch saleOrderModel = new SaleOrderSearch();
		saleOrderModel.keyword = keyword;
		saleOrderModel.code = code;
		saleOrderModel.item = getItem(request);
		saleOrderModel.phoneNumber = phoneNumber;
		saleOrderModel.createdDate = createdDate;
		saleOrderModel.page = getCurrentPage(request);
		saleOrderModel.trangthai = 2;
		
		model.addAttribute("saleOrdersWithPaging", saleOrderService.search(saleOrderModel));
		model.addAttribute("saleOrderModel", saleOrderModel);
		
		return "manager/historySaleOrder"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/saleOrderProducts/list/{saleOrderId}" }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("saleOrderId") int saleOrderId) throws IOException {
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		SaleOrderProductSearch saleOrderProducts = new SaleOrderProductSearch();
		saleOrderProducts.saleOrderId = saleOrder.getId();
		model.addAttribute("saleOrderProduct", saleOrderProductsService.search(saleOrderProducts));
		
		return "manager/saleOrderProducts"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/admin/comment/{saleOrderId}" }, method = RequestMethod.GET)
	public String comment(final Model model, final HttpServletRequest request,
			final HttpServletResponse response,@PathVariable("saleOrderId") int saleOrderId) throws IOException {
		
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		SaleOrderComment comment = new SaleOrderComment();
		comment.saleOrderId = saleOrder.getId();
		model.addAttribute("commentService", commentService.search(comment));
		return "manager/comment";
	}
	
	@RequestMapping(value = { "/removeSaleOrder/{id}/{userId}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> removeProduct(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id,@PathVariable("userId") int userId) throws IOException {
		System.out.println(id);
		
		SaleOrder saleOrder = saleOrderService.getById(id);
		
		users user = userService.getById(userId);
		user.deleteRelationSaleOrder(saleOrder);
		saleOrderService.deleteById(id);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("message", "Đã xóa thành công đơn hàng có id là " + id);
		jsonResult.put("id", id);
		return ResponseEntity.ok(jsonResult);

	}
	@RequestMapping(value = { "/receiveSaleOrder/{id}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> receiveSaleOrder(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {
		
		

		SaleOrder saleOrder = saleOrderService.getById(id);
		//saleOrder.setCondition(false);
		saleOrder.setStatus(false);
		saleOrderService.saveOrUpdate(saleOrder);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("message", "Đã tiếp nhận thành công đơn hàng có id là " + id);
		jsonResult.put("id", id);
		return ResponseEntity.ok(jsonResult);

	}
}
