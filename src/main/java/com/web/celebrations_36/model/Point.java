package com.web.celebrations_36.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Point")
public class Point {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="userEmail")
	private String userEmail;
	
	@Column(name="point")
	private Integer point;
	
	@Column(name="usedpoint")
	private Integer usedpoint;
	
	
	public Integer getUsedpoint() {
		return usedpoint;
	}

	public void setUsedpoint(Integer usedpoint) {
		this.usedpoint = usedpoint;
	}

	public Point() {
		super();
	}

	
	
	public Point(String userEmail, Integer point, Integer usedpoint) {
		this.userEmail = userEmail;
		this.point = point;
		this.usedpoint = usedpoint;
	}

	public Point(String userEmail, Integer point) {
		this.userEmail = userEmail;
		this.point = point;
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

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}
	
	
	
}
