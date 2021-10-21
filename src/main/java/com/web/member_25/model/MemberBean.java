package com.web.member_25.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MemberHLab01")
public class MemberBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer pk;
	String id;
	String pswd;
	String name;
	Date birthday;
	Double Salary;
	
	public Double getSalary() {
		return Salary;
	}
	public void setSalary(Double salary) {
		Salary = salary;
	}
	public MemberBean() {
		super();
	}
	public MemberBean(String id, String pswd, String name) {
		super();
		this.id = id;
		this.pswd = pswd;
		this.name = name;
	}
	
	public MemberBean(Integer pk, String id, String pswd, String name) {
		super();
		this.pk = pk;
		this.id = id;
		this.pswd = pswd;
		this.name = name;
	}
	public MemberBean(Integer ipk) {
		this.pk = ipk;
	}
	public Integer getPk() {
		return pk;
	}
	public void setPk(Integer pk) {
		this.pk = pk;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
}
