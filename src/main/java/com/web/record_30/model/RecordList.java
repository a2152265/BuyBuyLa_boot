package com.web.record_30.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="RecordList")
public class RecordList {
	@Id
	private Integer record_id;	
	private String buyer;
	private Double totalprice;
	private String buy_time;
	
	
	public RecordList() {
	
	}

	public RecordList(Integer record_id, String buyer, Double totalprice, String buy_time) {
		this.record_id = record_id;
		this.buyer = buyer;
		this.totalprice = totalprice;
		this.buy_time = buy_time;
	}

	public Integer getRecord_id() {
		return record_id;
	}

	public void setRecord_id(Integer record_id) {
		this.record_id = record_id;
	}





	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	public String getBuy_time() {
		return buy_time;
	}

	public void setBuy_time(String buy_time) {
		this.buy_time = buy_time;
	}

	public Double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}
	
	
	
	
}
