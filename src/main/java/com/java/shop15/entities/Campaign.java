package com.java.shop15.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_campaign")
public class Campaign extends BaseEntity{
	
	@Column(name ="title", length = 45, nullable = false)
	private String title;
	@Column(name ="content", length = 45, nullable = false)
	private String content;
	@Column(name ="image", length = 45, nullable = false)
	private String image;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
