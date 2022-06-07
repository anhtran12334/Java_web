package com.java.shop15.services;

import org.springframework.stereotype.Service;

import com.java.shop15.entities.Roles;

@Service
public class RoleService extends BaseService<Roles>{

	@Override
	protected Class<Roles> clazz() {
		// TODO Auto-generated method stub
		return Roles.class;
	}
	
}
