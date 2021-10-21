package com.web.cart_30.model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="Cart")
public class Cart {
	@Id
	private Integer pid;	
	private String p_name;
	private Double p_price;
	private Integer count;
	private String buyer;
	private String seller;
	
	private Blob coverImage;
	
	
	
	
	public Blob getCoverImage() {
		return coverImage;
	}
	
	


//	public Cart(Integer pid, Blob blob, String string, Double double1, int i, String seller,
//			String string2) {
//		this.pid = pid;
//		this.p_name = blob;
//		this.p_price = string;
//		this.count = double1;
//		this.buyer = i;
//		this.seller = seller;
//		this.coverImage = string2;
//	}
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




	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}


	
	public Cart() {
	
	}


	public Cart(Integer pid) {

		this.pid = pid;
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
	
	


	
	
	
}
