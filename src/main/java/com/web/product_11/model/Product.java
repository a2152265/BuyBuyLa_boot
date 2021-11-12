package com.web.product_11.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
	private String status;
	private Integer sales;

	private Integer count;
	private Integer views;
	private Integer point;
	private Double discount;
	
	@Transient
	private MultipartFile productImage;
	private Blob coverImage;
	
	@OneToMany(mappedBy = "product",fetch = FetchType.LAZY) //本類別無外鍵 
	Set<ProductFavorite> productFavorites=new HashSet<>();
	
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

	
	public Product(Integer productId, String productName, Double price, String category, Integer stock,
			String productInfo, String productNo, String fileName, String seller, String insertTime, String status,
			Integer sales, Integer count, MultipartFile productImage, Blob coverImage,
			Set<ProductFavorite> productFavorites) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.category = category;
		this.stock = stock;
		this.productInfo = productInfo;
		this.productNo = productNo;
		this.fileName = fileName;
		this.seller = seller;
		this.insertTime = insertTime;
		this.status = status;
		this.sales = sales;
		this.count = count;
		this.productImage = productImage;
		this.coverImage = coverImage;
		this.productFavorites = productFavorites;
	}



	public Product(Integer productId, String productName, Double price, String category, Integer stock,
			String productInfo, String productNo, String fileName, String seller, String insertTime, String status,
			Integer sales, Double discount, MultipartFile productImage, Blob coverImage) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.category = category;
		this.stock = stock;
		this.productInfo = productInfo;
		this.productNo = productNo;
		this.fileName = fileName;
		this.seller = seller;
		this.insertTime = insertTime;
		this.status = status;
		this.sales = sales;
		this.discount = discount;
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



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public Integer getSales() {
		return sales;
	}



	public void setSales(Integer sales) {
		this.sales = sales;
	}


	public Set<ProductFavorite> getProductFavorites() {
		return productFavorites;
	}



	public void setProductFavorites(Set<ProductFavorite> productFavorites) {
		this.productFavorites = productFavorites;
	}



	public Integer getCount() {
		return count;
	}



	public void setCount(Integer count) {
		this.count = count;
	}



	public Integer getViews() {
		return views;
	}


	public void setViews(Integer views) {
		this.views = views;
	}
	
	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;

	}



	public Integer getPoint() {
		return point;
	}



	public void setPoint(Integer point) {
		this.point = point;
	}

	
	
}
