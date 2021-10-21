package com.web.cart_30.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="RIDCOUNT")
public class RidCount {
	@Id
	private Integer id;
	private Integer ridcount;
	
	public RidCount(Integer id, Integer ridcount) {
		this.id = id;
		this.ridcount = ridcount;
	}
	
	public RidCount() {
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRidcount() {
		return ridcount;
	}

	public void setRidcount(Integer ridcount) {
		this.ridcount = ridcount;
	}
	
	
}
