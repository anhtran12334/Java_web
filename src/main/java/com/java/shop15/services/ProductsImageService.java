package com.java.shop15.services;

import org.springframework.stereotype.Service;

import com.java.shop15.entities.ProductsImage;

@Service
public class ProductsImageService extends BaseService<ProductsImage>{

	@Override
	protected Class<ProductsImage> clazz() {
		// TODO Auto-generated method stub
		return ProductsImage.class;
	}

}
