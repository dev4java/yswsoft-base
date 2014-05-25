package com.yswsoft.lms.util;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.TryCatchFinally;

import common.Logger;

/**
* <p>Title: Util</p>
* <p>Description: 公共的方法</p>
* <p>Copyright: Copyright © 2013 - Luole.com</p>
* <p>Company: luoleTech</p>
* @author yusw
* @email yswthink@163.com
* @date 2014年5月5日下午2:35:06
* @version 1.0
*/
public class Util {
	/**
	* <p>Title: </p>
	* <p>Description:防止通过new生成该类对象 </p>
	 */
	private Util(){
		
	}
	private static Logger logger = Logger.getLogger(Util.class); 
	//TODO:通过googlemap的key-value双向获取
	
	public static boolean notEmpty(String str){
		boolean flag=false;
		if(str !=null && str.trim().length()>0 && !"".equals(str)){
			flag=true;
		}
		return flag;
	}
	
	public static int getInt(HttpServletRequest request,String name){
		String str=request.getParameter(name);
		if(notEmpty(xssFiter(str))){
			try {
				Integer i=Integer.parseInt(str);
				if(0<i && i<Integer.MAX_VALUE){
					return i;
				}else{
					return 0;
				}
			} catch (Exception e) {
				logger.info("将字符串转换int类型异常");
			}
		}
		return 0;
	}
	
	public static long getLong(HttpServletRequest request,String name){
		String str=request.getParameter(name);
		if(notEmpty(xssFiter(str))){
			try {
				Long l=Long.parseLong(str);
				if(0<l&& l<=Long.MAX_VALUE){
					return l;
				}else{
					return 0L;
				}
			} catch (Exception e) {
				logger.info("将字符串转换long类型异常");
			}
		}
		return 0L;
	}
	
	public static double getDouble(HttpServletRequest request,String name){
		String str=request.getParameter(name);
		if(notEmpty(xssFiter(str))){
			try {
				Double du = Double.parseDouble((str));
				if(0<du && du <= Double.MAX_VALUE){
					return du;
				}else{
					return 1d;
				}
			} catch (Exception e) {
				logger.info("将字符串转换long类型异常");
			}
		}
		return 1d;
	}
	
	public static String xssFiter(String str){
		String regEx="[《》`~!@#$%^&amp;*()+=|{}':;',\\[\\].&lt;&gt;/?~！@#￥%……&amp;*（）——+|{}【】'；：”“’。，、？]"; 
		Pattern p = Pattern.compile(regEx);;  
		if(notEmpty(str)){
			Matcher m = p.matcher(str);;  
			return m.replaceAll("").trim(); 
		}
		return str;
	}
	
	

}
