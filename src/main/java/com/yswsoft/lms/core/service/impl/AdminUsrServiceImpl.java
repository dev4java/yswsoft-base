package com.yswsoft.lms.core.service.impl;

import org.springframework.stereotype.Service;

import com.yswsoft.lms.core.model.AdminUsr;
import com.yswsoft.lms.core.service.AdminUsrService;

@Service("adminUsrService")
public class AdminUsrServiceImpl extends BaseServiceImpl<AdminUsr> implements AdminUsrService{

	@Override
	public AdminUsr getAdminUsrbyEmail(String email) {
		// TODO Auto-generated method stub
		return this.load("get_adminusr_by_email", new Object[]{email});
	}

}
