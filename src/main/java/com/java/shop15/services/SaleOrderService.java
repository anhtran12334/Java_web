package com.java.shop15.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.java.shop15.dto.ProductSearch;
import com.java.shop15.dto.SaleOrderSearch;
import com.java.shop15.entities.Products;
import com.java.shop15.entities.SaleOrder;
@Service
public class SaleOrderService extends BaseService<SaleOrder>{

	@Override
	protected Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}
	
	public PagerData<SaleOrder> search(SaleOrderSearch searchModel){
		// khoi tao cau lenh
		String sql = "SELECT * FROM tbl_saleorder s WHERE 1=1";
		
		if(searchModel != null) {
			//tim kiem theo userId
			if(searchModel.userId != null) {
				sql += " and s.user_id = " + searchModel.userId;
				
			}
			if(searchModel.id != null) {
				sql += " and s.id = " + searchModel.id;
				
			}
			if(searchModel.trangthai != null) {
				sql += " and s.trangthai = " + searchModel.trangthai;
				
			}
			if(!StringUtils.isEmpty(searchModel.status)) {
				sql += " and s.status = " + searchModel.status;
			}
			if(!StringUtils.isEmpty(searchModel.status)) {
				sql += " and s.status = " + searchModel.status;
			}
			if(!StringUtils.isEmpty(searchModel.code)) {
				sql += " and s.code = " + searchModel.code;
			}
			if(!StringUtils.isEmpty(searchModel.createdDate)) {
				sql += " and s.created_date = " + searchModel.createdDate;
			}
			if(!StringUtils.isEmpty(searchModel.phoneNumber)) {
				sql += " and s.customer_phone = " + searchModel.phoneNumber;
			}
			if(!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and s.seo = '" + searchModel.seo + "'";
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and s.product_id like '%"
						+ searchModel.keyword + "%'" + " or s.customer_phone like '%"
						+ searchModel.keyword + "%'" + " or s.customer_email like '%"
						+ searchModel.keyword + "%'" + " or s.customer_address like '%"
						+ searchModel.keyword + "%')";
			}
			
			sql += " ORDER BY created_date DESC";
		}
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page, searchModel == null ? 5 : searchModel.item);
		
	}

}
