package com.java.shop15.services;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;


import com.java.shop15.dto.UserSearch;

import com.java.shop15.entities.users;
@Service
public class UserService extends BaseService<users>{

	@Override
	protected Class<users> clazz() {
		// TODO Auto-generated method stub
		return users.class;
	}
	public PagerData<users> search(UserSearch userModel){
		// khoi tao cau lenh
		String sql = "SELECT * FROM tbl_users u WHERE 1=1";
		
		if(userModel != null) {
			//tim kiem theo categories
			
			if(!StringUtils.isEmpty(userModel.seo)) {
				sql += " and u.seo = '" + userModel.seo + "'";
			}
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(userModel.keyword)) {
				sql += " and (u.username like '%" + userModel.keyword + "%'" + " or u.email like '%"
						+ userModel.keyword + "%' )";
			}
			
		}
		return runTransactQuerySQL(sql, userModel == null ? 0 : userModel.page,5);
		
	}
	public PagerData<users> searchRole(UserSearch userModel , int role){
		String sql = "select * from tbl_users u join tbl_users_roles ur on u.id = ur.user_id join tbl_roles r on r.id = ur.role_id where r.name = ";
				
		if(role == 1) {
			sql += "'ADMIN'";
			
		}
		if(role == 2) {
			sql += "'GUEST'";
			
		}
		if(role == 3) {
			sql += "'MANAGER'";
			
		}
		return runTransactQuerySQL(sql, userModel == null ? 0 : userModel.page,5);
				
	}
	public users loadUserByUsername (String userName) {
		String sql = "select * from tbl_users u where u.username='"+userName+"'";
		List<users> users = this.runTransactQuerySQL(sql, 0,5).getData();
		if(users==null || users.size()<=0) return null;
		return users.get(0);
		
	}
	public users getUserById(Integer userId) {
		String sql = "select * from tbl_users as u where u.id='"+userId+"'";
		List<users> users = this.runTransactQuerySQL(sql, 0,5).getData();
		if(users==null || users.size()<=0) return null;
		return users.get(0);
	}
}