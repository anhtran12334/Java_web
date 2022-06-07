package com.java.shop15.entities;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_products")
public class Products extends BaseEntity {
	@Column(name = "title", length = 1000, nullable = false)
	private String title;

	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;
	@Column(name = "price_sale", precision = 13, scale = 2, nullable = true)
	private BigDecimal priceSale;
	@Column(name = "short_description", length = 3000, nullable = false)
	private String shortDescription;
	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	@Column(name = "is_hot" ,nullable = true)
	private Boolean isHot = Boolean.TRUE;
	public Boolean getIsHot() {
		return isHot;
	}

	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	@Lob
	@Column(name = "detail_description", columnDefinition = "LONGTEXT", nullable = false)
	private String detailDescription;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Categories categories;

	public Set<ProductsImage> getProductImage() {
		return productImage;
	}

	public void setProductImage(Set<ProductsImage> productImage) {
		this.productImage = productImage;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "products")
	private Set<ProductsImage> productImage = new HashSet<ProductsImage>();
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "saleProducts")
	private Set<SaleOderProducts> sale = new HashSet<SaleOderProducts>();
	
	public void addRelationSaleProducts(SaleOderProducts saleProduct) {

		this.sale.add(saleProduct);
		saleProduct.setSaleProducts(this);
	}

	// xoa moi 1 san pham vao @OneToMany
	// @param product
	public void deleteRelationSaleProducts(SaleOderProducts saleProduct) {

		this.sale.remove(saleProduct);
		saleProduct.setSaleProducts(null);
	}
	
	public Set<SaleOderProducts> getSale() {
		return sale;
	}

	public void setSale(Set<SaleOderProducts> sale) {
		this.sale = sale;
	}

	public void addRelationProduct(ProductsImage product) {

		this.productImage.add(product);
		product.setProducts(this);
	}

	// xoa moi 1 san pham vao @OneToMany
	// @param product
	public void deleteRelationProduct(ProductsImage product) {

		this.productImage.remove(product);
		product.setProducts(null);
	}

	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPriceSale() {
		return priceSale;
	}

	public void setPriceSale(BigDecimal priceSale) {
		this.priceSale = priceSale;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getDetailDescription() {
		return detailDescription;
	}

	public void setDetailDescription(String detailDescription) {
		this.detailDescription = detailDescription;
	}

	@Column(name = "avatar", length = 200, nullable = true)
	private String avatar;

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
}
