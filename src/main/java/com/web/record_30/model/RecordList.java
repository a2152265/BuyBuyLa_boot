package com.web.record_30.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="RecordList")
public class RecordList {
	@Id
	private String record_id;	
	private String buyer;
	private Double totalprice;
	private String buy_time;
	private String buyeraddress;
	private String transport_status;
	private String pay_status;
	private String last_update_time;
	private String status;
	
	
	public RecordList() {
	
	}



	public RecordList(String record_id, String buyer, Double totalprice, String buy_time, String buyeraddress,
			String transport_status, String pay_status, String status) {
		this.record_id = record_id;
		this.buyer = buyer;
		this.totalprice = totalprice;
		this.buy_time = buy_time;
		this.buyeraddress = buyeraddress;
		this.transport_status = transport_status;
		this.pay_status = pay_status;
		this.status = status;
	}



	public RecordList(String record_id, String buyer, Double totalprice, String buy_time, String buyeraddress,
			String transport_status, String pay_status, String last_update_time, String status) {
	
		this.record_id = record_id;
		this.buyer = buyer;
		this.totalprice = totalprice;
		this.buy_time = buy_time;
		this.buyeraddress = buyeraddress;
		this.transport_status = transport_status;
		this.pay_status = pay_status;
		this.last_update_time = last_update_time;
		this.status = status;
	}






	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public RecordList(String record_id, String buyer, Double totalprice, String buy_time, String buyeraddress,
			String transport_status, String pay_status) {

		this.record_id = record_id;
		this.buyer = buyer;
		this.totalprice = totalprice;
		this.buy_time = buy_time;
		this.buyeraddress = buyeraddress;
		this.transport_status = transport_status;
		this.pay_status = pay_status;
	}





	public String getLast_update_time() {
		return last_update_time;
	}





	public void setLast_update_time(String last_update_time) {
		this.last_update_time = last_update_time;
	}





	public String getRecord_id() {
		return record_id;
	}


	public void setRecord_id(String record_id) {
		this.record_id = record_id;
	}


	public String getBuyer() {
		return buyer;
	}


	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}


	public Double getTotalprice() {
		return totalprice;
	}


	public void setTotalprice(Double totalprice) {
		this.totalprice = totalprice;
	}


	public String getBuy_time() {
		return buy_time;
	}


	public void setBuy_time(String buy_time) {
		this.buy_time = buy_time;
	}


	public String getBuyeraddress() {
		return buyeraddress;
	}


	public void setBuyeraddress(String buyeraddress) {
		this.buyeraddress = buyeraddress;
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

	

	
	
	
}
