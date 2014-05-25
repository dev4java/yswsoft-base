package com.yswsoft.lms.core.model;


import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "lms_sys_books")
public class Books implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private Long id;//编号
	private int type;//1图书2期刊
	private String name;//名称
	private double price;//单价
	private String detail;//备注 
	private String typeNo;//分类号
	private String author;//作者
	private String press;//出版社 
	private int duplicate;//复本量
	private int status;//状态 0正常 1 删除
	private int exist;//0在馆 1借出 2遗失
	private int surplus;//剩余几本
	private String editor; //主编
	private double totaPrice;//总价
	private double pricing;//定价
	
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@Column(name="type")
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	@Column(name="name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name="price")
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Column(name="detail") 
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	
	@Column(name="type_no")
	public String getTypeNo() {
		return typeNo;
	}
	public void setTypeNo(String typeNo) {
		this.typeNo = typeNo;
	}
	
	@Column(name="author") 
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Column(name="press")
	public String getPress() {
		return press;
	}
	public void setPress(String press) {
		this.press = press;
	}
	
	@Column(name="duplicate")
	public int getDuplicate() {
		return duplicate;
	}
	public void setDuplicate(int duplicate) {
		this.duplicate = duplicate;
	}
	
	@Column(name="status")
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Column(name="surplus")
	public int getSurplus() {
		return surplus;
	}
	public void setSurplus(int surplus) {
		this.surplus = surplus;
	}
	
	@Column(name="editor")
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	
	@Column(name="tota_price")
	public double getTotaPrice() {
		return totaPrice;
	}
	public void setTotaPrice(double totaPrice) {
		this.totaPrice = totaPrice;
	}
	
	@Column(name="pricing")
	public double getPricing() {
		return pricing;
	}
	public void setPricing(double pricing) {
		this.pricing = pricing;
	}
	
	@Column(name="exist")
	public int getExist() {
		return exist;
	}
	public void setExist(int exist) {
		this.exist = exist;
	}
	
	
	
	
	
	
}
