package com.yswsoft.lms.controller;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cc.luole.sns.tools.commons.Page;

import com.yswsoft.lms.core.model.Books;
import com.yswsoft.lms.core.service.BooksService;
import com.yswsoft.lms.util.Constant;
import com.yswsoft.lms.util.Util;


@Controller
@RequestMapping("/lms/books")
public class BooksController extends BaseController{
	
	//@Autowired
	//public DownLoadService  downLoadService ;
	
	//@Autowired
	//public DownloadStuService downloadStuService;
	
	/** serialVersionUID*/
	private static final long serialVersionUID = 1L;
	
	//TODO login 代码冗余 考虑配置过滤器
	
	
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		if(!isLogin()){
			
			return this.getLogin();
		}
		ModelAndView model = new ModelAndView();
		Calendar calendar = Calendar.getInstance();
	    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd EEEE");
	    String s = df.format(calendar.getTime());
		model.addObject("date", s);
		model.setViewName("/admin/index");
		return model;
	}
	
	
/*	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		if(!isLogin()){
			return this.getLogin();
		}
		ModelAndView model = new ModelAndView();
		model.setViewName("/admin/books/list");
		return model;
	}*/
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView listPost(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		if(!isLogin()){
			return this.getLogin();
		}
		int pageNo   = Util.getInt(request,"pageNo");
		int pageSize = Util.getInt(request,"pageSize");
		
		if(pageSize==0){
			pageSize=5;
		}
		if(pageNo==0){
			pageNo=1;
		}
		String flag=request.getParameter("flag");
		if(null==flag || "".equals(flag)){
			flag="next";
		}
		long totalPageCount =1L;
		long totalCount=1L;
		
		ModelAndView model = new ModelAndView();
		Page page = booksService.getPageBooks(Constant.Status.VALID, 1, 10);
		if(page!=null){
			List<Books> listBooks=(List<Books>) page.getResult();
			totalPageCount=page.getTotalPageCount();
			totalCount=page.getTotalCount();
			model.addObject("page", page);
			model.addObject("_url", "list");
			model.addObject("pageNo",pageNo);
			model.addObject("pageSize",pageSize);
			String pageHtml =this.pageHtml(flag,pageNo, totalCount, totalPageCount);
			model.addObject("pageHtml", pageHtml);
			model.addObject("books",page.getResult());
			System.out.println("当前总页数="+page.getTotalPageCount()+"  当前第页数="+page.getCurrentPageNo()+"   总记录数="+page.getTotalCount()+"---------"+pageHtml);
			
		}
		model.setViewName("/admin/books/list");
		return model;
	}
	
	
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		if(!isLogin()){
			return this.getLogin();
		}
		ModelAndView model = new ModelAndView();
		model.setViewName("/admin/books/add");
		return model;
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ModelAndView addPost(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		if(!isLogin()){
			return this.getLogin();
		}
		ModelAndView model = new ModelAndView();
		String name= request.getParameter("name");
		double price= Util.getDouble(request,"price");
		String detail= request.getParameter("detail");
		String typeNo= request.getParameter("typeNo");
		String author= request.getParameter("author");
		String press= request.getParameter("press");
		int duplicate= Util.getInt(request,"duplicate");
		Books books = new Books();
		books.setType(Constant.Ltype.BOOK);
		books.setName(name);
		books.setPrice(price);
		books.setDetail(detail);
		books.setTypeNo(typeNo);
		books.setAuthor(author);
		books.setPress(press);
		books.setDuplicate(duplicate);
		books.setStatus(Constant.Status.VALID);
		books.setSurplus(duplicate);
		books.setTotaPrice(duplicate*price);
		books.setExist(Constant.Status.VALID);
		Serializable bid = booksService.insert(books);
		
		if(bid!=null){
		return this.jsonSuccess("suc", "");	
		}else{
			return this.jsonError("err");
		}
	}
	
	
	
	@RequestMapping("/mod")
	public ModelAndView mod(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		if(!isLogin()){
			return this.getLogin();
		}
		long bid=Util.getLong(request, "bookid");
		String name= request.getParameter("name");
		double price= Util.getDouble(request,"price");
		String detail= request.getParameter("detail");
		String typeNo= request.getParameter("typeNo");
		String author= request.getParameter("author");
		String press= request.getParameter("press");
		int duplicate= Util.getInt(request,"duplicate");
		Books book = booksService.load(bid);
		boolean f=false;
		if(book !=null){
			book.setType(Constant.Ltype.BOOK);
			book.setName(name);
			book.setPrice(price);
			book.setDetail(detail);
			book.setTypeNo(typeNo);
			book.setAuthor(author);
			book.setPress(press);
			book.setDuplicate(duplicate);
			book.setStatus(Constant.Status.VALID);
			book.setSurplus(duplicate);
			book.setTotaPrice(duplicate*price);
			book.setExist(Constant.Status.VALID);
			f=booksService.update(book);
		}
		if(f){
			return this.jsonSuccess("suc", null);
		}else{
			return this.jsonError("err");
		}
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		if(!isLogin()){
			return this.getLogin();
		}
		long bid=Util.getLong(request, "bookid");
		Books books=booksService.load(bid);
		ModelAndView model = new ModelAndView();
		model.addObject("book", books);
		model.setViewName("/admin/books/detail");
		return model;
	}
	@RequestMapping("/del")
	public ModelAndView del(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		if(!isLogin()){
			
			return this.getLogin();
		}
		ModelAndView model = new ModelAndView();
		model.setViewName("/admin/books/del");
		return model;
	}


	//后台分页代码
		private String pageHtml(String flag,int pageNo,long totalCount,long totalPageCount){
			String pageHtml="";
			int c=pageNo%8;
			int start=1;
			int end=1;
			StringBuilder sb = new StringBuilder();
			sb.append("");
			sb.append("<a class=\"home\" href=\"#\" id=\"homeid\">首页</a>");
			sb.append("<a  id=\"upid\" class=\"prev\" href=\"#\">上一页</a>");
			//number-cur
			if(totalPageCount>8){
				if(pageNo<8){
					for (int i = 1; i <= 8; i++) {
						sb.append("<a class=\"number ");
						if(i==pageNo){
							sb.append(" number-cur  ");
						}
						sb.append("\" onClick=\"go(");
						sb.append(i);
						sb.append(");\">");
						sb.append(i);
						sb.append("</a>");
					}
					sb.append("<span class=\"number\">...</span>");
					sb.append("<a class=\"number\" onClick=\"go(");
					sb.append(totalPageCount);
					sb.append(");\">");
					sb.append(totalPageCount);
					sb.append("</a>");
				}else{
					int s=pageNo-c+1;//开始一排的第一个
					int s1=s+8;//一排结束的值[不包含该值]
					if(c==0){
						if(flag.equals("up")){
							s=pageNo-8;
							if(totalPageCount<s1){
								for (int ss=pageNo-c; ss <= totalPageCount; ss++) {//for (int ss=pageNo-c+1; ss <= totalPageCount; ss++) {
									//System.out.println("-------------"+ss);
									/*sb.append("<a class=\"number\" onClick=\"go(");*/
									sb.append("<a class=\"number ");
									if(ss==pageNo){
										sb.append(" number-cur  ");
									}
									sb.append("\" onClick=\"go(");
									sb.append(ss);
									sb.append(");\">");
									sb.append(ss);
									sb.append("</a>");
								}
							}else{
								for (int i = pageNo-8+1; i <= pageNo; i++) {
									/*sb.append("<a class=\"number\" onClick=\"go(");*/
									sb.append("<a class=\"number ");
									if(i==pageNo){
										sb.append(" number-cur  ");
									}
									sb.append("\" onClick=\"go(");
									sb.append(i);
									sb.append(");\">");
									sb.append(i);
									sb.append("</a>");
								}
								sb.append("<span class=\"number\">...</span>");
								sb.append("<a class=\"number\" onClick=\"go(");
								sb.append(totalPageCount);
								sb.append(");\">");
								sb.append(totalPageCount);
								sb.append("</a>");
							}

						}else if(flag.equals("next")){
							s=pageNo+8;
							if(totalPageCount<s1){
								sb.append("<a class=\"number\" onClick=\"go(1);\">1</a> ");

								sb.append("<span class=\"number\">...</span>");
								for (int ss=pageNo-c; ss <= totalPageCount; ss++) {//for (int ss=pageNo-c+1; ss <= totalPageCount; ss++) {
									//System.out.println("-------------"+ss);
									/*sb.append("<a class=\"number\" onClick=\"go(");*/
									sb.append("<a class=\"number ");
									if(ss==pageNo){
										sb.append(" number-cur  ");
									}
									sb.append("\" onClick=\"go(");
									sb.append(ss);
									sb.append(");\">");
									sb.append(ss);
									sb.append("</a>");
								}
							}else{
								for (int i = pageNo+1; i <= s; i++) {
									/*sb.append("<a class=\"number\" onClick=\"go(");*/
									sb.append("<a class=\"number ");
									if(i==pageNo){
										sb.append(" number-cur  ");
									}
									sb.append("\" onClick=\"go(");
									sb.append(i);
									sb.append(");\">");
									sb.append(i);
									sb.append("</a>");
								}
								sb.append("<span class=\"number\">...</span>");
								sb.append("<a class=\"number\" onClick=\"go(");
								sb.append(totalPageCount);
								sb.append(");\">");
								sb.append(totalPageCount);
								sb.append("</a>");
							}

						}else if(flag.equals("curr")){
							s=pageNo+8;
							if(totalPageCount<s1){
								sb.append("<a class=\"number\" onClick=\"go(1);\">1</a> ");
								sb.append("<span class=\"number\">...</span>");
								for (int ss=pageNo-c; ss <= totalPageCount; ss++) {
									//System.out.println("-------------"+ss);
									/*sb.append("<a class=\"number\" onClick=\"go(");*/
									sb.append("<a class=\"number ");
									if(ss==pageNo){
										sb.append(" number-cur  ");
									}
									sb.append("\" onClick=\"go(");
									sb.append(ss);
									sb.append(");\">");
									sb.append(ss);
									sb.append("</a>");
								}
							}else{
								for (int i = pageNo; i < s; i++) {
									/*sb.append("<a class=\"number\" onClick=\"go(");*/
									sb.append("<a class=\"number ");
									if(i==pageNo){
										sb.append(" number-cur  ");
									}
									sb.append("\" onClick=\"go(");
									sb.append(i);
									sb.append(");\">");
									sb.append(i);
									sb.append("</a>");
								}
								sb.append("<span class=\"number\">...</span>");
								sb.append("<a class=\"number\" onClick=\"go(");
								sb.append(totalPageCount);
								sb.append(");\">");
								sb.append(totalPageCount);
								sb.append("</a>");
							}

						}
					}else if(totalPageCount<s1){
						sb.append("<a class=\"number\" onClick=\"go(1);\">1</a> ");
						sb.append("<span class=\"number\">...</span>");
						for (int ss=pageNo-c+1; ss <= totalPageCount; ss++) {
							//System.out.println("-------------"+ss);
							/*sb.append("<a class=\"number\" onClick=\"go(");*/
							sb.append("<a class=\"number ");
							if(ss==pageNo){
								sb.append(" number-cur  ");
							}
							sb.append("\" onClick=\"go(");
							sb.append(ss);
							sb.append(");\">");
							sb.append(ss);
							sb.append("</a>");
						}
					}

					else{
						for (int ss=pageNo-c+1; ss < s1; ss++) {
							//System.out.println("-------------"+ss);
							/*sb.append("<a class=\"number\" onClick=\"go(");*/
							sb.append("<a class=\"number ");
							if(ss==pageNo){
								sb.append(" number-cur  ");
							}
							sb.append(" \" onClick=\"go(");
							sb.append(ss);
							sb.append(");\">");
							sb.append(ss);
							sb.append("</a>");
						}
						if(s1<totalPageCount){
							sb.append("<span class=\"number\">...</span>");
							sb.append("<a class=\"number\" onClick=\"go(");
							sb.append(totalPageCount);
							sb.append(");\">");
							sb.append(totalPageCount);
							sb.append("</a>");
						}
					}

				}
			}else{//小于8
				for (int i = 1; i <= totalPageCount; i++) {
					/*sb.append("<a class=\"number\" onClick=\"go(");*/
					sb.append("<a class=\"number ");
					if(i==pageNo){
						sb.append(" number-cur  ");
					}
					sb.append("\" onClick=\"go(");
					sb.append(i);
					sb.append(");\">");
					sb.append(i);
					sb.append("</a>");
				}
			}
			sb.append("<a id=\"nextid\" class=\"next next-cur\" href=\"#\">下一页</a>");
			sb.append("<a id=\"endid\"  class=\"end\" href=\"#\">末页</a>");
			/*sb.append("<span class=\"total\">共<span>");
			sb.append(totalCount);
			sb.append("</span>条记录</span>");*/
			pageHtml=sb.toString();
			System.out.println(pageHtml);
			return pageHtml;

		}

	
	
}
