package com.java.shop15.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_search")
public class Search extends BaseEntity{
@Column(name ="keyword", nullable=true)
private String keyword;
@ManyToOne(cascade = CascadeType.ALL)
@JoinColumn(name = "user_id", referencedColumnName = "id")
private users searchUser;
/*
 * @ManyToOne(cascade = CascadeType.ALL)
 * 
 * @JoinColumn(name = "user_id", referencedColumnName = "id") private users
 * user;
 */

public users getSearchUser() {
	return searchUser;
}

public void setSearchUser(users searchUser) {
	this.searchUser = searchUser;
}

public String getKeyword() {
	return keyword;
}

public void setKeyword(String keyword) {
	this.keyword = keyword;
}
}
