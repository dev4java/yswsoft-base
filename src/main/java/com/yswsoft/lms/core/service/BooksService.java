package com.yswsoft.lms.core.service;

import java.util.List;

import cc.luole.sns.tools.commons.Page;

import com.yswsoft.lms.core.model.Books;

public interface BooksService extends BaseService<Books>{
	public Books getBooksByType(int type,int status);
	public List<Books> getListBooks(int status);
	public Page getPageBooks(int status,int pageNo, int pageSize) ;
	public Page getPageBooksByParameter(int status,int type,String parameter,int pageNo, int pageSize) ;
}
