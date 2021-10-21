package com.infotran.springboot.model;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Customer_Table")
public class CustomerBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer customerId;
	private String name;
	private String password;
	@Transient
	private String password1;
	private String email;
	private Date birthday;
	private java.util.Date lastPostTime;
	private Timestamp registerTime;
	
	private Double totalPayment;
	
	public CustomerBean(Integer customerId, String name) {
		this.customerId = customerId;
		this.name = name;
	}

	public CustomerBean() {  
	}


	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CustomerBean [customerId=");
		builder.append(customerId);
		builder.append(", name=");
		builder.append(name);
		builder.append(", password=");
		builder.append(password);
		builder.append(", password1=");
		builder.append(password1);
		builder.append(", email=");
		builder.append(email);
		builder.append(", birthday=");
		builder.append(birthday);
		builder.append(", lastPostTime=");
		builder.append(lastPostTime);
		builder.append(", registerTime=");
		builder.append(registerTime);
		builder.append(", totalPayment=");
		builder.append(totalPayment);
		builder.append(", hashCode=");
		builder.append(hashCode());
		builder.append("]");
		return builder.toString();
	}

	public CustomerBean(Integer customerId, String name, String password, String password1, String email, Date birthday,
			java.util.Date lastPostTime, Timestamp registerTime, Double totalPayment) {
		this.customerId = customerId;
		this.name = name;
		this.password = password;
		this.password1 = password1;
		this.email = email;
		this.birthday = birthday;
		this.lastPostTime = lastPostTime;
		this.registerTime = registerTime;
		this.totalPayment = totalPayment;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public java.util.Date getLastPostTime() {
		return lastPostTime;
	}

	public void setLastPostTime(java.util.Date lastPostTime) {
		this.lastPostTime = lastPostTime;
	}

	public Timestamp getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Timestamp registerTime) {
		this.registerTime = registerTime;
	}

	public Double getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(Double totalPayment) {
		this.totalPayment = totalPayment;
	}

	

}
