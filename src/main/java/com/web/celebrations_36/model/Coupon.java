package com.web.celebrations_36.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="coupon")
public class Coupon {
		
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name="userEmail")
	private String userEmail;
	@Column(name="couponName")
	private String couponName;
	@Column(name="couponNumber")
	private String couponNumber;
	
	@Column(name="couponStatus")
	private String couponStatus;
	@Column(name="count")
	private Integer count;
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getCouponStatus() {
		return couponStatus;
	}
	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public String getCouponNumber() {
		return couponNumber;
	}
	public void setCouponNumber(String couponNumber) {
		this.couponNumber = couponNumber;
	}
	public Coupon(String userEmail, String couponName, String couponNumber,String couponStatus) {
		super();
		this.userEmail = userEmail;
		this.couponName = couponName;
		this.couponNumber = couponNumber;
		this.couponStatus=couponStatus;
	}
	public Coupon() {
	}
	
	public Coupon(String userEmail, String couponName, String couponNumber, String couponStatus, Integer count) {
		super();
		this.userEmail = userEmail;
		this.couponName = couponName;
		this.couponNumber = couponNumber;
		this.couponStatus = couponStatus;
		this.count = count;
	}
	
	
}
