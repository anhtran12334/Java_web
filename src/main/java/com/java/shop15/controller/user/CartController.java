package com.java.shop15.controller.user;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.shop15.controller.BaseController;
import com.java.shop15.dto.Cart;
import com.java.shop15.dto.CartItem;
import com.java.shop15.entities.Products;
import com.java.shop15.entities.SaleOderProducts;
import com.java.shop15.entities.SaleOrder;
import com.java.shop15.entities.users;
import com.java.shop15.services.ProductService;
import com.java.shop15.services.SaleOrderService;
import com.java.shop15.services.UserService;


@Controller
public class CartController extends BaseController{
	@Autowired
	private ProductService productService;
	@Autowired 
	private SaleOrderService saleOrderService;
	
	@Autowired
	private UserService userService;
	 @Autowired
	    public JavaMailSender emailSender;
	@RequestMapping(value = { "/cart/finish"}, method = RequestMethod.POST) public
	  String cartFinish(final Model model, final HttpServletRequest request, final
	  HttpServletResponse response) throws Exception{ 
		 
			/* String code = request.getParameter("code"); */
		String name = request.getParameter("fullName");
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		
		
		// tao hoa don
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCode(String.valueOf(System.currentTimeMillis()));
		saleOrder.setTrangthai(0);
		saleOrder.setCreatedDate(new java.util.Date());
		saleOrder.setCustomerName(name);
		saleOrder.setCustomerAddress(address);
		saleOrder.setCustomerPhone(phoneNumber);
		saleOrder.setCustomerEmail(email);
		sendHtmlEmail(email, saleOrder);
		if(getUserLogined()!=null) {
			users user = userService.getUserById(getUserLogined().getId());
			saleOrder.setUser(user);
			
		}
		
		long total = 0;
		// lay thong tin gio hang
				HttpSession session = request.getSession();
				Cart cart = (Cart) session.getAttribute("cart");
				if(cart !=null) {
				System.out.println();
				for(CartItem cartItem : cart.getCartItems()) {
					SaleOderProducts saleOderProducts = new SaleOderProducts();
					saleOderProducts.setSaleProducts(productService.getById(cartItem.getProductId()));
					saleOderProducts.setQuality(cartItem.getQuanlity());
					saleOrder.addRelationSaleProducts(saleOderProducts);
					total += cartItem.getQuanlity() * cartItem.getPriceUnit().intValueExact();
				}
				BigDecimal totalOrder = new BigDecimal(total);
				  saleOrder.setTotal(totalOrder);
				  
				// luu len db
				saleOrderService.saveOrUpdate(saleOrder);
				
				// xoa du lieu gio hang
				session.setAttribute("cart", null);
				session.setAttribute("totalItems", "0");
				}
		 return "redirect:/home";
	  
	  }
	public void sendHtmlEmail( String to,SaleOrder saleOrder) throws MessagingException {

        MimeMessage message = emailSender.createMimeMessage();

        boolean multipart = true;
        
        MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "utf-8");
        
        String htmlMsg = "<div style=\"text-align:center;\">"
                +"<img src=\"${base}/user/img/logo_2.png\" style=\"width: 50px; height: 50px; border-radius: 100%;\">"
        		+"<span style=\"font-size:50px\"><b>H??m Nay ??n G?? ?</b></span>"
        		+"</div>"
        		+"<h3>C???m ??n b???n ???? ?????t h??ng t???i H??m Nay ??n G??</h3>"
        		+"<h3>Xin Ch??o Tr???n Ng???c Anh,</h3>"
        		+"<p>H??m nay ??n g?? ???? nh???n ???????c y??u c???u c???a b???n v?? ??ang s??? l?? nh??. B???n s??? nh???n ???????c th??ng b??o ti???p theo khi ????n h??ng s???n s??ng ???????c giao.</p>\r\n"
        		+ "<p><b>L??u ?? nh??? cho b???n:</b> B???n ch??? n??n nh???n h??ng khi tr???ng th??i ????n h??ng ??ang giao v?? nh??? ki???m tra m?? ????n h??ng.</p>\r\n"
        		+ "<hr/>"
        		+"<div>"
        		+" <span><b>T??n:</b></span> <span>"+ saleOrder.getCustomerName()+"</span><br/>\r\n"
        		+ "<span><b>?????a Ch???:</b></span> <span>"+ saleOrder.getCustomerAddress()+"</span><br/>\r\n"
        		+ "<span><b>??i???n tho???i:</b></span> <span>"+ saleOrder.getCustomerPhone()+"</span><br/>\r\n"
        		+ "<span><b>Email:</b></span> <span>"+ saleOrder.getCustomerEmail()+"</span><br/>\r\n"
        		+ "</div>\r\n"
        		+ "<hr/>\r\n"
        		+ "<div>\r\n"
        		+ "<h4>Ki???n h??ng</h4>\r\n"
        		+ "<table border=\"1\" cellspacing=\"1px\" cellpadding=\" 10px\">\r\n"
        		+ "<tr>\r\n"
        		+ "<th>M?? ????n h??ng</th>\r\n"
        		+ "<th>???nh s???n ph???m</th>\r\n"
        		+ "<th>Title</th>\r\n"
        		+ "<th>????n Gi??</th>\r\n"
        		+ "<th>S??? l?????ng</th>\r\n"
        		+ "<th>Shipping</th>\r\n"
        		+ "<th>T???ng ti???n</th>\r\n"
        		+ "</tr>\r\n";
        		
        		
        		BigDecimal subTotal = BigDecimal.ZERO;
        		 for (SaleOderProducts s : saleOrder.getSales()) {
        			 subTotal = subTotal.add(s.getSaleProducts().getPrice().multiply(BigDecimal.valueOf(s.getQuality())));
        		String row =  "<tr>\r\n"
        		+ "<td>"+ saleOrder.getCode() +"</td>\r\n"
        		+ "<td><img src=\"${base}/"+s.getSaleProducts().getAvatar() +"style=\"width: 200px; height: 150px\"> </td>\r\n"
        		+ "<td>"+s.getSaleProducts().getTitle()+"</td>\r\n"
        		+ "<td>"+s.getSaleProducts().getPrice()+"</td>\r\n"
        		+ "<td>"+s.getQuality()+" ??</td>\r\n"
        		+ "</tr>\r\n";
        		htmlMsg += row;
        		}
        		htmlMsg += "</table>\r\n"
        		+"<hr/>"
        		+" <span><b>Shipping:</b></span> <span> 20.000 ??</span><br/>\r\n"
        		+" <span><b>Th??nh Ti???n:</b></span> <span>"+ subTotal +"</span><br/>\r\n"
        		+ "</div>\r\n"
        		+ "</div>\r\n"
        		+ "<h2>Thanks for your order !</h2>\r\n";
        
        message.setContent(htmlMsg, "text/html; charset=utf-8");
        
        
        helper.setTo(to);
        
        helper.setSubject("????n H??ng Ch??? Ti???p Nh???n!");
        
    
        this.emailSender.send(message);

        
    }
	@RequestMapping(value = { "/ajax/plusItem" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> plusItem(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem newItem) {
		 
		// lay thong tin gio hang
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();
		BigDecimal tong = BigDecimal.ZERO;
		for(CartItem cartItem : cartItems) {
			if (cartItem.getProductId() == newItem.getProductId()) {
			cartItem.setQuanlity(cartItem.getQuanlity()+1);
			/*
			 * BigDecimal totalPriceAdd = cartItem.getPriceUnit().multiply(new
			 * BigDecimal(newItem.getQuanlity()));
			 * cartItem.setTotal(cartItem.getTotal().add(totalPriceAdd)); tong =
			 * cartItem.getTotal().add(totalPriceAdd);
			 */
			
			}
			
		}
		cart.caculateTotalPrice();
		//caculateTotalPrice1(request);
		session.setAttribute("cart", cart);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("totalPrice", cart.caculateTotalPrice());
		// ????y ??
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	  
	  }
	@RequestMapping(value = { "/ajax/minusItem" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> minusItem(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem newItem) {
		 
		// lay thong tin gio hang
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();
		for(CartItem cartItem : cartItems) {
			if (cartItem.getProductId() == newItem.getProductId()) {
				if(cartItem.getQuanlity() >= 0) {
			cartItem.setQuanlity(cartItem.getQuanlity()-1);
				}
			}
		}
		
		
		cart.caculateTotalPrice();
		//caculateTotalPrice1(request);
		session.setAttribute("cart", cart);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("totalPrice", cart.caculateTotalPrice());
		// ????y ??
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	  
	  }
	@RequestMapping(value = { "/ajax/deleteItem" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteItem(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem newItem) {

		// lay thong tin gio hang

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		CartItem cartIt = null;
		List<CartItem> cartItems = cart.getCartItems();

		for (CartItem cartItem : cartItems) {
			if (cartItem.getProductId() == newItem.getProductId()) {

				cartIt = cartItem;
				break;

			}
		}
		cart.getCartItems().remove(cartIt);
//		cart.caculateTotalPrice();
		//caculateTotalPrice1(request);
		session.setAttribute("cart", cart);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		jsonResult.put("totalPrice", cart.caculateTotalPrice());
//		jsonResult.put("totalPrice", cart.caculateTotalPrice());
		// ????y ??
		session.setAttribute("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);

	}

	@RequestMapping(value = { "/cart/view" }, method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws Exception {

		return "user/view_cart";

	}

	@RequestMapping(value = { "/ajax/addToCart" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem newItem) {

		// session t????ng t??? nh?? ki???u Map v?? ???????c l??u tr??n main memory.
		HttpSession session = request.getSession();

		// L???y th??ng tin gi??? h??ng.
		Cart cart = null;
		if (session.getAttribute("cart") != null) {
			cart = (Cart) session.getAttribute("cart");
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		// L???y danh s??ch s???n ph???m c?? trong gi??? h??ng
		List<CartItem> cartItems = cart.getCartItems();

		// ki???m tra n???u c?? trong gi??? h??ng th?? t??ng s??? l?????ng
		
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == newItem.getProductId()) {
				isExists = true;
				item.setQuanlity(item.getQuanlity() + newItem.getQuanlity());
				BigDecimal totalPriceAdd = item.getPriceUnit().multiply(new BigDecimal(newItem.getQuanlity()));
				item.setTotal(item.getTotal().add(totalPriceAdd));
//				cart.setTotalPrice(item.getTotal().add(totalPriceAdd));
			}
		}
		

		// n???u s???n ph???m ch??a c?? trong gi??? h??ng
		if (!isExists) {
			Products productInDb = productService.getById(newItem.getProductId());

			newItem.setProductName(productInDb.getTitle());
			newItem.setPriceUnit(productInDb.getPrice());
			newItem.setProductAvatar(productInDb.getAvatar());

			newItem.setTotal(newItem.getPriceUnit().multiply(new BigDecimal(newItem.getQuanlity())));
			
			cart.getCartItems().add(newItem);
		}

		// tr??? k???t qu???
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		// ????y ??
		session.setAttribute("totalItems", getTotalItems(request));
		session.setAttribute("totalPrice", cart.caculateTotalPrice());
		return ResponseEntity.ok(jsonResult);
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}
		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = 0;
		for (CartItem item : cartItems) {
			total += item.getQuanlity();
		}

		return total;
	}
	private void caculateTotalPrice1(final HttpServletRequest request) {
		// session t????ng t??? nh?? ki???u Map v?? ???????c l??u tr??n main memory.
				HttpSession session = request.getSession();

		// L???y th??ng tin gi??? h??ng.
	
				Cart cart = null;
				if (session.getAttribute("cart") != null) {
				cart = (Cart) session.getAttribute("cart");
				} else {
					cart = new Cart();
					session.setAttribute("cart", cart);
				}
				// L???y danh s??ch s???n ph???m c?? trong gi??? h??ng
				List<CartItem> cartItems = cart.getCartItems();
				BigDecimal total = BigDecimal.ZERO;
				
				for(CartItem ci : cartItems ) {
					total = total.add(ci.getPriceUnit().multiply(BigDecimal.valueOf(ci.getQuanlity())));
				}
				cart.setTotalPrice(total);
				
				
	}
}
