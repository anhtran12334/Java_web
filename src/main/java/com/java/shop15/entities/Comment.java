package com.java.shop15.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_comment")
public class Comment extends BaseEntity{
@Column (name ="star", nullable=true)
private Integer star;
@Column(name="message", length= 500, nullable=true)
private String message;
@Column(name="picture", length= 45, nullable= true)
private String picture;

@ManyToOne(fetch = FetchType.EAGER)
@JoinColumn(name = "saleorder_id" )
private SaleOrder saleOrder;

@ManyToOne(fetch = FetchType.EAGER)
@JoinColumn(name = "user_id" )
private users users;

public Integer getStar() {
	return star;
}

public void setStar(Integer star) {
	this.star = star;
}

public String getMessage() {
	return message;
}

public void setMessage(String message) {
	this.message = message;
}

public String getPicture() {
	return picture;
}

public void setPicture(String picture) {
	this.picture = picture;
}

public SaleOrder getSaleOrder() {
	return saleOrder;
}

public void setSaleOrder(SaleOrder saleOrder) {
	this.saleOrder = saleOrder;
}

public users getUsers() {
	return users;
}

public void setUsers(users users) {
	this.users = users;
}
}


