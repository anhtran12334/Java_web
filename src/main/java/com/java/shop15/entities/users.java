package com.java.shop15.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;



@Entity
@Table(name = "tbl_users")
public class users extends BaseEntity implements UserDetails{
	@Column(name = "username", length = 45, nullable = false)
	private String username;
	@Column(name = "fullname", length = 45, nullable = false)
	private String fullname;
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	@Column(name = "password", length = 100, nullable = false)
	private String password;
	
	@Column(name = "email", length = 45, nullable = false)
	private String email;
	@Column(name = "address", length = 200, nullable = false)
	private String address;
	@Column(name = "phone_number", length = 45, nullable = false)
	private String phoneNumber;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "searchUser")
	private Set<Search> searchs = new HashSet<Search>();
	public void addRelationSearch(Search search) {
		searchs.add(search);
		search.setSearchUser(this);
	}
	public void deleteRelationSearch(Search search) {
		searchs.remove(search);
		search.setSearchUser(null);
	}
	public Set<Search> getSearchs() {
		return searchs;
	}
	public void setSearchs(Set<Search> searchs) {
		this.searchs = searchs;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	private Set<Comment> comments = new HashSet<Comment>();
	
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public void addRelationComment(Comment comment) {
		comments.add(comment);
		comment.setUsers(this);
	}
	public void deleteRelationComment(Comment comment) {
		comments.remove(comment);
		comment.setUsers(null);
	}
	@OneToMany(cascade = CascadeType.ALL,
			fetch = FetchType.EAGER,
			mappedBy = "user")
	private Set<SaleOrder> saleOrders = new HashSet<SaleOrder>();
	
	public void addRelationSaleOrder(SaleOrder saleOrder) {
		saleOrders.add(saleOrder);
		saleOrder.setUser(this);
	}
	public void deleteRelationSaleOrder(SaleOrder saleOrder) {
		saleOrders.remove(saleOrder);
		saleOrder.setUser(null);
	}
	
	public Set<SaleOrder> getSaleOrders() {
		return saleOrders;
	}
	public void setSaleOrders(Set<SaleOrder> saleOrders) {
		this.saleOrders = saleOrders;
	}

	@ManyToMany(cascade= CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
	private List<Roles> roles = new ArrayList<Roles>();
	
	public void addRoles(Roles role) {
		role.getUsers().add(this);
		roles.add(role);
	}
	public void deleteRoles(Roles role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}
	
	public List<Roles> getRoles() {
		return roles;
	}

	public void setRoles(List<Roles> roles) {
		this.roles = roles;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return roles;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
