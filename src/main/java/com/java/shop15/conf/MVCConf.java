package com.java.shop15.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.java.shop15.Constants;

@Configuration // -> bao sping biet day la file cau hinh cho MVC
public class MVCConf implements WebMvcConfigurer,Constants{
	
	// thực hiện định nghĩa các static resource
	// classpath tương ứng vs folder : src/main/resource
	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/manager/**").addResourceLocations("classpath:/manager/");
		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		// resource handler cho phần upload ảnh từ người dùng.
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + UPLOAD_FOLDER_ROOT);

	}

	@Bean // bao sping biet folder chua view
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		// đường dẫn folder chứa Views
		bean.setPrefix("/WEB-INF/views/");
		// Tên đuôi view
		bean.setSuffix(".jsp");
		return bean;
	}
	
	
}
