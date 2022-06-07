package com.java.shop15.controller.user;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.controller.BaseController;
import com.java.shop15.dto.SaleOrderComment;
import com.java.shop15.dto.SaleOrderProductSearch;
import com.java.shop15.dto.SaleOrderSearch;
import com.java.shop15.entities.Comment;
import com.java.shop15.entities.SaleOrder;
import com.java.shop15.entities.users;
import com.java.shop15.services.CommentService;
import com.java.shop15.services.SaleOrderProductsService;
import com.java.shop15.services.SaleOrderService;
import com.java.shop15.services.UserService;

@Controller
public class AccountController extends BaseController{
	@Autowired
	private SaleOrderService saleOrderService;
	@Autowired

	private SaleOrderProductsService saleOrderProductsService;
	@Autowired
	private UserService userService;
	@Autowired
	private CommentService commentService;
	@RequestMapping(value = { "/account" }, method = RequestMethod.GET) // -> action
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response)
	
			throws IOException {
			if(getUserLogined()!=null) {
			users user = userService.getUserById(getUserLogined().getId());
			SaleOrderSearch saleOrder = new SaleOrderSearch();
			 saleOrder.userId = user.getId();
			  saleOrder.status = true ;
			model.addAttribute("saleOrderReceive", saleOrderService.search(saleOrder));
			// da tiep nhan
			
			  SaleOrderSearch saleOrder1 = new SaleOrderSearch();
			  saleOrder1.userId = user.getId();
			  saleOrder1.status = false ;
			  saleOrder1.trangthai = 0 ;
			  model.addAttribute("saleOrderReceived", saleOrderService.search(saleOrder1));
			 // cho danh gia, lich su don hang
			  SaleOrderSearch saleOrder2 = new SaleOrderSearch();
			  saleOrder2.userId = user.getId();
			  saleOrder2.trangthai = 1 ;
			  model.addAttribute("historySaleOrder", saleOrderService.search(saleOrder2));
			 // lich su giao hàng
			  SaleOrderSearch saleOrder3 = new SaleOrderSearch();
			  saleOrder3.userId = user.getId();
			  saleOrder3.trangthai = 2 ;
			  model.addAttribute("historySaleOrderAfterComment", saleOrderService.search(saleOrder3));
			  
			
		}
		
		return "user/Account"; // =>duong dan toi VIEW.
	}
	@RequestMapping(value = { "/saleOrderProducts/list/{saleOrderId}" }, method = RequestMethod.GET)
	public String adminProductEdit(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("saleOrderId") int saleOrderId) throws IOException {
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		SaleOrderProductSearch saleOrderProducts = new SaleOrderProductSearch();
		saleOrderProducts.saleOrderId = saleOrder.getId();
		model.addAttribute("saleOrderProduct", saleOrderProductsService.search(saleOrderProducts));
		
		return "user/detailSaleOrder"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/commentSaleOrder/list/{saleOrderId}" }, method = RequestMethod.GET)
	public String commentSaleOrder(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("saleOrderId") int saleOrderId) throws IOException {
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		SaleOrderComment saleOrderComment = new SaleOrderComment();
		saleOrderComment.saleOrderId = saleOrder.getId();
		model.addAttribute("saleOrderComment", commentService.search(saleOrderComment));
		SaleOrderProductSearch saleOrderProducts = new SaleOrderProductSearch();
		saleOrderProducts.saleOrderId = saleOrder.getId();
		model.addAttribute("saleOrderProduct", saleOrderProductsService.search(saleOrderProducts));
		model.addAttribute("comment", new Comment());
		model.addAttribute("saleOrder", saleOrder);
		
		saleOrder.setTrangthai(2);
		saleOrderService.saveOrUpdate(saleOrder);
		return "user/Comment"; // -> đường dẫn tới View.
	}
	@RequestMapping(value = { "/receive/{id}" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> receive(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, @PathVariable("id") int id) throws IOException {
		
		

		SaleOrder saleOrder = saleOrderService.getById(id);
		//saleOrder.setCondition(false);
		saleOrder.setTrangthai(1);
		saleOrderService.saveOrUpdate(saleOrder);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("message", "Đã nhận hàng thành công ");
		jsonResult.put("id", id);
		return ResponseEntity.ok(jsonResult);

	}
}
