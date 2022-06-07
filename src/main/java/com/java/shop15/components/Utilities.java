package com.java.shop15.components;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.github.slugify.Slugify;

public class Utilities {
	@Autowired
	private UserDetailsService userDetailsService;
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}

	public static String slugify(String text) {
		return new Slugify().slugify(text);
	}
	public static String encode(String text) {
		return new BCryptPasswordEncoder(4).encode(text);
	}
	public static void main(String[] args) {
		
		// sử dụng slugify tạo seo
		String productTitle = "Java Title 6"; // -> java-title-6
		String productTitleSeo = new Slugify().slugify(productTitle);
		System.out.println(productTitleSeo);
		
	}
	
}
