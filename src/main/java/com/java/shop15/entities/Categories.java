package com.java.shop15.entities;

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
@Table(name = "tbl_category")
public class Categories extends BaseEntity {

	@Column(name = "name", length = 100, nullable = false)
	private String name;

	@Column(name = "description", length = 100, nullable = false)
	private String description;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	@Column(name = "avatar", length = 500, nullable = true)
	private String avatar;
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "categories")
	private Set<Products> products = new HashSet<Products>();
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_id")
	private Categories parent;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "parent")
	private Set<Categories> childs = new HashSet<Categories>();
	public Set<Products> getProducts() {
		return products;
	}
	public void setProducts(Set<Products> products) {
		this.products = products;
	}
	public Categories getParent() {
		return parent;
	}
	public void setParent(Categories parent) {
		this.parent = parent;
	}
	public Set<Categories> getChilds() {
		return childs;
	}
	public void setChilds(Set<Categories> childs) {
		this.childs = childs;
	}
	//them 1 san pham vao @OneToMany
	//@param product
	public void addRelationProduct(Products product) {
		
		this.products.add(product);
		product.setCategories(this);
	}
	//xoa moi 1 san pham vao @OneToMany
	//@param product
	public void deleteRelationProduct(Products product) {
		
		this.products.remove(product);
		product.setCategories(null);
	}
	public void addRelationProduct(Categories child) {
		
		this.childs.add(child);
		child.setParent(this);
	}
	//xoa moi 1 san pham vao @OneToMany
	//@param product
	public void deleteRelationProduct(Categories child) {
		
		this.childs.remove(child);
		child.setParent(null);
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

}
