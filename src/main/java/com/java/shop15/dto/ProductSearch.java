package com.java.shop15.dto;

public class ProductSearch {
	//tim theo keyword
	public String keyword;
	
	//tim theo category
	public Integer  categoryId;
	
	public Boolean isHot;
	
	public Boolean getIsHot() {
		return isHot;
	}

	public String getKeyword() {
		return keyword;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public String getSeo() {
		return seo;
	}

	public int getPage() {
		return page;
	}

	public String seo;
	
	//page hien tai
	public int page;
	
	
}
