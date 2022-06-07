package com.java.shop15.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_saleorder_products")
public class SaleOderProducts extends BaseEntity{
	
	@Column(name = "quality", nullable = false)
	private int quality;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Products saleProducts;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "saleorder_id")
	private SaleOrder sale;

	public int getQuality() {
		return quality;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}

	

	public Products getSaleProducts() {
		return saleProducts;
	}

	public void setSaleProducts(Products saleProducts) {
		this.saleProducts = saleProducts;
	}

	public SaleOrder getSale() {
		return sale;
	}

	public void setSale(SaleOrder sale) {
		this.sale = sale;
	}
}
