package com.java.shop15.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.java.shop15.dto.ResultsSearch;
import com.java.shop15.dto.UserSearch;
import com.java.shop15.entities.Search;
import com.java.shop15.entities.users;



@Service
public class SearchService extends BaseService<Search>{
	@Override
	protected Class<Search> clazz() {
		// TODO Auto-generated method stub
		return Search.class;
	}
	public PagerData<Search> search(ResultsSearch searchModel){
		// khoi tao cau lenh
		String sql = "SELECT * FROM tbl_search u WHERE 1=1";
		
		if(searchModel != null) {
			//tim kiem theo categories
			
			if(searchModel.userId != null) {
				sql += " and u.user_id = " + searchModel.userId;
				
			}
			/*
			 * sql+=
			 * "DELETE FROM tbl_search WHERE created_date<=DATE_SUB(NOW(), INTERVAL 1 MINUTE)"
			 * "Delete from tbl_search WHERE created_date < now() - interval 1 hour"
			 * ;
			 */
			
			sql += " ORDER BY created_date DESC ";
			/*
			 * sql+= "Delete from tbl_search WHERE created_date < now() - interval 1 hour";
			 */
		}
		return runTransactQuerySQL(sql,0,5);
		
	}
}
