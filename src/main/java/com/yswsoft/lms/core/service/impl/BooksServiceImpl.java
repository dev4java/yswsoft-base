package com.yswsoft.lms.core.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import cc.luole.sns.tools.commons.Page;

import com.yswsoft.lms.core.model.Books;
import com.yswsoft.lms.core.service.BooksService;

@Service("booksService")
public class BooksServiceImpl extends BaseServiceImpl<Books> implements BooksService{

	@Override
	public Books getBooksByType(int type,int status) {
		// TODO Auto-generated method stub
		return this.load("get_books_by_type", new Object[]{type,status});
	}

	@Override
	public List<Books> getListBooks(int status) {
		// TODO Auto-generated method stub
		return this.query("get_books_list", new Object[]{status});
	}

	@Override
	public Page getPageBooks(int status,int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return this.pageQuery("get_books_page", new Object[]{status}, pageNo, pageSize);
	}

	@Override
	public Page getPageBooksByParameter(int status, int type, String parameter,
			int pageNo, int pageSize) {
		return this.pageQuery("get_books_page_by_parameter", new Object[]{status}, pageNo, pageSize);
	}

	
	

}
