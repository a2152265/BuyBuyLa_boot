package com.web.product_11.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name = "Product")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
	private String productName;
	private Double price; 
	private String category;
	private Integer stock;
	private String productInfo;
	private String productNo;
	private String fileName;
	private String seller;
	private String insertTime;

	
	@Transient
	private MultipartFile productImage;
	private Blob coverImage;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Product(Integer productId, String productName, Double price, String category, Integer stock,
			String productInfo, String productNo, String fileName, String seller, MultipartFile productImage,
			Blob coverImage) {
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.category = category;
		this.stock = stock;
		this.productInfo = productInfo;
		this.productNo = productNo;
		this.fileName = fileName;
		this.seller = seller;
		this.productImage = productImage;
		this.coverImage = coverImage;
	}


	



	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSerller() {
		return seller;
	}

	public void setSerller(String seller) {
		this.seller = seller;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String getSeller() {
		return seller;
	}



	public void setSeller(String seller) {
		this.seller = seller;
	}



	public String getInsertTime() {
		return insertTime;
	}



	public void setInsertTime(String insertTime) {
		this.insertTime = insertTime;
	}


}
