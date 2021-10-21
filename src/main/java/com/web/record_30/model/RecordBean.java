package com.web.record_30.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Record")
public class RecordBean {
private static final long serialVersionUID = 1L;
	
	@Id
	
	private Integer record_id;
	
	private Integer pid;
	private String p_name;
	private Double p_price;
	private String buy_time;
	private String buyer;
	private String seller;
	private Integer pcount;
	
	public RecordBean() {
		
	}
	
	

	public RecordBean(Integer record_id, Integer pid, String p_name, Double p_price, String buy_time, String buyer,
			String seller, Integer pcount) {
		this.record_id = record_id;
		this.pid = pid;
		this.p_name = p_name;
		this.p_price = p_price;
		this.buy_time = buy_time;
		this.buyer = buyer;
		this.seller = seller;
		this.pcount = pcount;
	}



	public Integer getRecord_id() {
		return record_id;
	}

	public void setRecord_id(Integer record_id) {
		this.record_id = record_id;
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

	public String getBuy_time() {
		return buy_time;
	}

	public void setBuy_time(String buy_time) {
		this.buy_time = buy_time;
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

	public Integer getPcount() {
		return pcount;
	}

	public void setPcount(Integer pcount) {
		this.pcount = pcount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
}
