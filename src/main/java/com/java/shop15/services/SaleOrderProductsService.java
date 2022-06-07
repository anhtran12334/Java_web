package com.java.shop15.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.java.shop15.dto.SaleOrderProductSearch;
import com.java.shop15.dto.SaleOrderSearch;
import com.java.shop15.entities.SaleOderProducts;
import com.java.shop15.entities.SaleOrder;

@Service
public class SaleOrderProductsService extends BaseService<SaleOderProducts> {

	@Override
	protected Class<SaleOderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOderProducts.class;
	}

	public PagerData<SaleOderProducts> search(SaleOrderProductSearch searchModel) {
		// khoi tao cau lenh
		String sql = "SELECT * FROM tbl_saleorder_products s WHERE 1=1";
		
		if (searchModel != null) { // tim kiem theo categories
			if(searchModel.saleOrderId != null) {
				sql += " and s.saleorder_id = " + searchModel.saleOrderId;
				
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (s.product_id like '%" + searchModel.keyword + "%')"  ;
			}
		}
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page,5);

	}

}
