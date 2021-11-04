package com.web.cart_30.model;



import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.web.product_11.model.Product;



@Entity
@Table(name="Cart")
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cid;
	

	private Integer count;
	private String buyer;

	
	 @ManyToOne(cascade=CascadeType.ALL)
	 @JoinColumn(name="ProductId_FK")
	 private Product product;	;



	public Cart() {
		
	}



	public Cart(Integer count, String buyer, Product product) {
	
		this.count = count;
		this.buyer = buyer;
		this.product = product;
	}



	public Cart(Integer cid, Integer count, String buyer, Product product) {

		this.cid = cid;
		this.count = count;
		this.buyer = buyer;
		this.product = product;
	}



	public Integer getCid() {
		return cid;
	}



	public void setCid(Integer cid) {
		this.cid = cid;
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



	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}




	



	






	
	









	
	
	
}
