package com.web.cart_30.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BuyerAddress")
public class BuyerAddress {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer address_id;
	private String buyer;
	private String buyerName;
	private String phone;
	private String email;
	private String city;
	private String address;
	
	public BuyerAddress() {

	}

	
	public BuyerAddress(Integer address_id, String buyer, String buyerName, String phone, String email, String city,
			String address) {

		this.address_id = address_id;
		this.buyer = buyer;
		this.buyerName = buyerName;
		this.phone = phone;
		this.email = email;
		this.city = city;
		this.address = address;
	}


	public Integer getAddress_id() {
		return address_id;
	}


	public void setAddress_id(Integer address_id) {
		this.address_id = address_id;
	}


	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
}
