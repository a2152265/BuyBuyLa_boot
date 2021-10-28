package com.web.forum_32.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="forum_32")
public class ForumBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer id;
	
	private String userName;
	private String userEmail;
	private String tag;          // 標籤
	private String title;        // 標題
	private String content;      // 內容
	private Blob coverImage;     // 圖片
	private String fileName;     // 檔名
	private String date;         // 時間
	private Integer picId;
	
	@Transient
	private MultipartFile  image;

	public MultipartFile getImage() {
	    return image;
	}
	
	public ForumBean() {
	}
	
	public ForumBean(Integer id,String userName,String userEmail,String date,String tag,String title,String content,Blob coverImage,String fileName,Integer picId) {
	this.id=id;
	this.userName=userName;
	this.userEmail=userEmail;
	this.date=date;
	this.tag=tag;
	this.title=title;
	this.content=content;
	this.coverImage=coverImage;
	this.fileName=fileName;
	}
	
	public ForumBean(Integer id,String userName,String userEmail,String date,String tag,String title,String content) {
		this.id=id;
		this.userName=userName;
		this.userEmail=userEmail;
		this.date=date;
		this.tag=tag;
		this.title=title;
		this.content=content;
	}

	public void setImage(MultipartFile image) {
	    this.image = image;
	}
	
	
	public Integer getPicId() {
		return picId;
	}

	public void setPicId(Integer picId) {
		this.picId = picId;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	
}
