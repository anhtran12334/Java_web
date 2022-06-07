package com.java.shop15.entities;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity{

	@Column(name = "code", length = 45, nullable = false)
	private String code;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	private users user;
	
	

	@Column(name = "total",columnDefinition = "DECIMAL(13,2)", nullable = true)
	private BigDecimal total;
	@Column(name = "customer_name", length= 100, nullable = true)
	private String customerName;
	@Column(name = "customer_address", length= 100, nullable = true)
	private String customerAddress;
	@Column(name = "customer_phone", length= 100, nullable = true)
	private String customerPhone;
	@Column(name = "customer_email", length= 100, nullable = true)
	private String customerEmail;
//	@Column(name = "condition", nullable = true)
//	private Boolean condition = Boolean.TRUE;
	
	/*
	 * @Column(name = "condition", nullable = true) private Boolean condition =
	 * Boolean.TRUE;
	 * 
	 * public Boolean getCondition() { return condition; }
	 * 
	 * public void setCondition(Boolean condition) { this.condition = condition; }
	 */
	 
//	public Boolean getCondition() {
//		return condition;
//	}
//
//	public void setCondition(Boolean condition) {
//		this.condition = condition;
//	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "saleOrder")
	private Set<Comment> comments = new HashSet<Comment>();
	
	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public void addRelationComment(Comment comment) {
		comments.add(comment);
		comment.setSaleOrder(this);
	}
	public void deleteRelationComment(Comment comment) {
		comments.remove(comment);
		comment.setSaleOrder(null);
	}
	@Column(name="trangthai", nullable=true)
	private Integer trangthai;
	
	public Integer getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(Integer trangthai) {
		this.trangthai = trangthai;
	}

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

	public String getCustomerPhone() {
		return customerPhone;
	}

	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "sale")
	private Set<SaleOderProducts> sales = new HashSet<SaleOderProducts>();
	
	public void addRelationSaleProducts(SaleOderProducts saleProduct) {

		this.sales.add(saleProduct);
		saleProduct.setSale(this);
	}

	// xoa moi 1 san pham vao @OneToMany
	// @param product
	public void deleteRelationSaleProducts(SaleOderProducts saleProduct) {

		this.sales.remove(saleProduct);
		saleProduct.setSale(null);
	}
	


	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public Set<SaleOderProducts> getSales() {
		return sales;
	}

	public void setSales(Set<SaleOderProducts> sales) {
		this.sales = sales;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public users getUser() {
		return user;
	}

	public void setUser(users user) {
		this.user = user;
	}



	
}
