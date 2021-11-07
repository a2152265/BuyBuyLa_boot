package com.web.product_11.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.web.member_25.model.membershipInformationBean;

@Entity
@Table(name = "ProductFavorite")
public class ProductFavorite implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer FavoriteId;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="fk_product_id") //外鍵名稱
	Product product;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="fk_member_id") //外鍵名稱
	membershipInformationBean membershipInformationBean;

	public Integer getFavoriteId() {
		return FavoriteId;
	}

	public void setFavoriteId(Integer favoriteId) {
		FavoriteId = favoriteId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public membershipInformationBean getMembershipInformationBean() {
		return membershipInformationBean;
	}

	public void setMembershipInformationBean(membershipInformationBean membershipInformationBean) {
		this.membershipInformationBean = membershipInformationBean;
	}
	
	
}
