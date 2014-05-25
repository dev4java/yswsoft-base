package com.yswsoft.lms.core.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
* <p>Title: Usr</p>
* <p>Description: 后台登陆用户</p>
* <p>Copyright: Copyright © 2013 - Luole.com</p>
* <p>Company: luoleTech</p>
* @author yusw
* @email yswthink@163.com
* @date 2014年5月6日下午3:53:13
* @version 1.0
*/
@Entity
@Table(name = "lms_sys_user")
public class AdminUsr implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private Long jobNumber;//工号
	private String loginEmail;
	private String name;
	private String password;
	private Date createTime;
	private int level;//权限等级 1最大 能做增删改操作 
	private int status;//状态
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="job_number")
	public Long getJobNumber() {
		return jobNumber;
	}
	public void setJobNumber(Long jobNumber) {
		this.jobNumber = jobNumber;
	}
	
	@Column(name="login_email")
	public String getLoginEmail() {
		return loginEmail;
	}
	public void setLoginEmail(String loginEmail) {
		this.loginEmail = loginEmail;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name="create_time")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Column(name="level")
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	@Column(name="status")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
