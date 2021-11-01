package com.web.cart_30.model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="Cart")
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cid;
	private Integer pid;	
	private String p_name;
	private Double p_price;
	private Integer count;
	private String buyer;
	private String seller;

	private Blob coverImage;
	
	



	public Cart() {
		
	}





	public Cart(Integer pid, String p_name, Double p_price, Integer count, String buyer, String seller,
			Blob coverImage) {

		this.pid = pid;
		this.p_name = p_name;
		this.p_price = p_price;
		this.count = count;
		this.buyer = buyer;
		this.seller = seller;
		this.coverImage = coverImage;
	}





	public Cart(Integer pid, String buyer) {

		this.pid = pid;
		this.buyer = buyer;
	}





	public Cart(Integer cid, Integer pid, String p_name, Double p_price, Integer count, String buyer, String seller,
			Blob coverImage) {

		this.cid = cid;
		this.pid = pid;
		this.p_name = p_name;
		this.p_price = p_price;
		this.count = count;
		this.buyer = buyer;
		this.seller = seller;
		this.coverImage = coverImage;
	}





	public Integer getCid() {
		return cid;
	}





	public void setCid(Integer cid) {
		this.cid = cid;
	}





	public Integer getPid() {
		return pid;
	}





	public void setPid(Integer pid) {
		this.pid = pid;
	}





	public String getP_name() {
		return p_name;
	}





	public void setP_name(String p_name) {
		this.p_name = p_name;
	}





	public Double getP_price() {
		return p_price;
	}





	public void setP_price(Double p_price) {
		this.p_price = p_price;
	}





	public Integer getCount() {
		return count;
	}





	public void setCount(Integer count) {
		this.count = count;
	}





	public String getBuyer() {
		return buyer;
	}





	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}





	public String getSeller() {
		return seller;
	}





	public void setSeller(String seller) {
		this.seller = seller;
	}





	public Blob getCoverImage() {
		return coverImage;
	}





	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}












	
	
	
}
