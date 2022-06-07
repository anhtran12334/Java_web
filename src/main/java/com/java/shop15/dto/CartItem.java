package com.java.shop15.dto;

import java.math.BigDecimal;

/**
 * danh sách sản phẩm.
 * @author daing
 *
 */
public class CartItem {
	// mã sản phẩm 
	private BigDecimal total;
	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	private int productId;
	private String productAvatar;
	private String customerName;
	private String customerAddress;
	private String code;
	private String customerEmail;
	private String customerPhone;
	
	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerAddress() {
		return customerAddress;
	}

	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getProductAvatar() {
		return productAvatar;
	}

	public void setProductAvatar(String productAvatar) {
		this.productAvatar = productAvatar;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	// tên sản phẩme
	private String productName;
	
	// số lương sản phẩm
	private int quanlity;
	
	// đơn giá sản phẩm
	private BigDecimal priceUnit;

	

	

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getQuanlity() {
		return quanlity;
	}

	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

}
