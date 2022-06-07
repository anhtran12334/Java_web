package com.java.shop15.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.java.shop15.dto.ContactSearch;

import com.java.shop15.entities.Contact;


@Service
public class ManagerContactService extends BaseService<Contact>{
	@Override
	protected Class<Contact> clazz() {
		return Contact.class;
	}
	
	public PagerData<Contact> search(ContactSearch searchModel){
		// khoi tao cau lenh
		String sql = "SELECT * FROM tbl_contact c WHERE 1=1";
		
		if(searchModel != null) {
			
			
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (c.email like '%" + searchModel.keyword + "%')";
			}
			sql += " ORDER BY created_date DESC";
		}
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.page,5);
	}
	
}
