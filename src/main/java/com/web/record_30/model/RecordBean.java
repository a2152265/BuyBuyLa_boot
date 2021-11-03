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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	
	private Integer record_id;	
	private Integer pid;
	private String p_name;
	private Double p_price;
	private String buy_time;
	private String buyer;
	private String seller;
	private Integer pcount;
	private String transport_status;
	private String buyeraddress;
	private String category;
	public RecordBean() {
		
	}
	
	

	



	public RecordBean(Integer id, Integer record_id, Integer pid, String p_name, Double p_price, String buy_time,
			String buyer, String seller, Integer pcount, String transport_status, String buyeraddress,
			String category) {
	
		this.id = id;
		this.record_id = record_id;
		this.pid = pid;
		this.p_name = p_name;
		this.p_price = p_price;
		this.buy_time = buy_time;
		this.buyer = buyer;
		this.seller = seller;
		this.pcount = pcount;
		this.transport_status = transport_status;
		this.buyeraddress = buyeraddress;
		this.category = category;
	}







	public String getCategory() {
		return category;
	}







	public void setCategory(String category) {
		this.category = category;
	}







	public String getTransport_status() {
		return transport_status;
	}





	public void setTransport_status(String transport_status) {
		this.transport_status = transport_status;
	}


	public String getBuyeraddress() {
		return buyeraddress;
	}





	public void setBuyeraddress(String buyeraddress) {
		this.buyeraddress = buyeraddress;
	}





	public Integer getId() {
		return id;
	}







	public void setId(Integer id) {
		this.id = id;
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
