package com.web.celebrations_36.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name="campaign")
public class Campaign implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String url;
	private String category;
	private String name;
	private String description;
	private String note;
//	@DateTimeFormat(pattern="yyyy-MM-dd") 
	private String date1;
	private Blob coverImage;
	private String fileName;
	private String campaignStatus;
	@Transient
	private MultipartFile  productImage;
	
	

	public Campaign(int id, String url, String name, String description, String note, Blob coverImage,
			String fileName,String date1, MultipartFile productImage) {
		super();
		this.id = id;
		this.url = url;
		this.name = name;
		this.description = description;
		this.note = note;
		this.coverImage = coverImage;
		this.fileName = fileName;
		this.productImage = productImage;
		this.date1=date1;
	}

	
	@Override
	public String toString() {
		return "Campaign [id=" + id + ", url=" + url + ", category=" + category + ", name=" + name + ", description="
				+ description + ", note=" + note + ", date1=" + date1 + ", coverImage=" + coverImage + ", fileName="
				+ fileName + ", productImage=" + productImage + "]";
	}


	public Campaign() {

	}





	public Campaign(int id, String url, String category, String name, String description, String note, String date1,
			Blob coverImage, String fileName, MultipartFile productImage) {
		super();
		this.id = id;
		this.url = url;
		this.category = category;
		this.name = name;
		this.description = description;
		this.note = note;
		this.date1 = date1;
		this.coverImage = coverImage;
		this.fileName = fileName;
		this.productImage = productImage;
	}
	

	public Campaign(int id, String url, String category, String name, String description, String note, String date1,
			Blob coverImage, String fileName, String campaignStatus, MultipartFile productImage) {
		super();
		this.id = id;
		this.url = url;
		this.category = category;
		this.name = name;
		this.description = description;
		this.note = note;
		this.date1 = date1;
		this.coverImage = coverImage;
		this.fileName = fileName;
		this.campaignStatus = campaignStatus;
		this.productImage = productImage;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getDate1() {
		return date1;
	}


	public void setDate1(String date1) {
		this.date1 = date1;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public Blob getCoverImage() {
		return coverImage;
	}


	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public MultipartFile getProductImage() {
		return productImage;
	}


	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}


	public String getCampaignStatus() {
		return campaignStatus;
	}


	public void setCampaignStatus(String campaignStatus) {
		this.campaignStatus = campaignStatus;
	}

}