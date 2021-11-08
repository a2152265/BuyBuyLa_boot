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
	private String country;
	private Integer postalcode;
	private String address;
	private String record_id;
	
	
	
	
	public BuyerAddress() {

	}


	public BuyerAddress(String buyer, String buyerName, String phone, String email, String city, String country,
			Integer postalcode, String address, String record_id) {
		
		this.buyer = buyer;
		this.buyerName = buyerName;
		this.phone = phone;
		this.email = email;
		this.city = city;
		this.country = country;
		this.postalcode = postalcode;
		this.address = address;
		this.record_id = record_id;
	}


	public BuyerAddress(Integer address_id, String buyer, String buyerName, String phone, String email, String city,
			String country, Integer postalcode, String address, String record_id) {
	
		this.address_id = address_id;
		this.buyer = buyer;
		this.buyerName = buyerName;
		this.phone = phone;
		this.email = email;
		this.city = city;
		this.country = country;
		this.postalcode = postalcode;
		this.address = address;
		this.record_id = record_id;
	}


	public String getRecord_id() {
		return record_id;
	}


	public void setRecord_id(String record_id) {
		this.record_id = record_id;
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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Integer getPostalcode() {
		return postalcode;
	}

	public void setPostalcode(Integer postalcode) {
		this.postalcode = postalcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
}
