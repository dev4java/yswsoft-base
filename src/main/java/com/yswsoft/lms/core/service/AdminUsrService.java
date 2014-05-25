package com.yswsoft.lms.core.service;

import com.yswsoft.lms.core.model.AdminUsr;

public interface AdminUsrService extends BaseService<AdminUsr>{
	public AdminUsr getAdminUsrbyEmail(String email);
}
