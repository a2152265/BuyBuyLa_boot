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
	private String buyeraddress;
	private String transport_status;
	private String pay_status;
	
	
	public RecordList() {
	
	}

	

	public RecordList(Integer record_id, String buyer, Double totalprice, String buy_time, String buyeraddress,
			String transport_status, String pay_status) {

		this.record_id = record_id;
		this.buyer = buyer;
		this.totalprice = totalprice;
		this.buy_time = buy_time;
		this.buyeraddress = buyeraddress;
		this.transport_status = transport_status;
		this.pay_status = pay_status;
	}



	public String getTransport_status() {
		return transport_status;
	}



	public void setTransport_status(String transport_status) {
		this.transport_status = transport_status;
	}



	public String getPay_status() {
		return pay_status;
	}



	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}



	public Integer getRecord_id() {
		return record_id;
	}

	public void setRecord_id(Integer record_id) {
		this.record_id = record_id;
	}





	public String getBuyeraddress() {
		return buyeraddress;
	}

	public void setBuyeraddress(String buyeraddress) {
		this.buyeraddress = buyeraddress;
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
