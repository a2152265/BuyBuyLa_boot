package com.web.celebrations_36.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Redeem")
public class Redeem {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private Integer productId;
	
	private Integer point;
	
	private String userEmail;
	
	private String redeemTime;
	
	private String productName;
	
	public Redeem() {
		super();
	}
	
	public Redeem(Integer productId, Integer point, String userEmail) {
		super();
		this.productId = productId;
		this.point = point;
		this.userEmail = userEmail;
	}
	
	
	public Redeem(Integer productId, Integer point, String userEmail, String redeemTime) {
		super();
		this.productId = productId;
		this.point = point;
		this.userEmail = userEmail;
		this.redeemTime = redeemTime;
	}

	
	public Redeem(Integer productId, Integer point, String userEmail, String redeemTime, String productName) {
		super();
		this.productId = productId;
		this.point = point;
		this.userEmail = userEmail;
		this.redeemTime = redeemTime;
		this.productName = productName;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public String getRedeemTime() {
		return redeemTime;
	}
	public void setRedeemTime(String redeemTime) {
		this.redeemTime = redeemTime;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
	
	
}
