package com.java.shop15.dto;

import java.util.Date;

public class SaleOrderSearch {
	public String keyword;
	
	public String seo;
	
	public String code;
	public String getCode() {
		return code;
	}
	public String createdDate;
	
	
	public String getCreatedDate() {
		return createdDate;
	}
	public String phoneNumber;
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public int page;
	public int item;
	
	
	public int getItem() {
		return item;
	}
	public Integer id;
	
	public boolean status;
	
	public Integer trangthai;
	
//	public boolean condition;
//	
//	public boolean isCondition() {
//		return condition;
//	}

	public Integer getTrangthai() {
		return trangthai;
	}

	public boolean isStatus() {
		return status;
	}

	public Integer getId() {
		return id;
	}

	public Integer getUserId() {
		return userId;
	}

	public Integer userId;

	public String getKeyword() {
		return keyword;
	}

	public String getSeo() {
		return seo;
	}

	public int getPage() {
		return page;
	}

}
