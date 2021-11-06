package com.web.forum_32.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="forum_32")
public class ForumBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String tag;        
	private String title;
	@Column(name="content",length = Integer.MAX_VALUE)
	private String content;      
	private String date;
	private Integer messageQty;
	private Integer viewQty;
	private Integer likeQty;
	private String topArticle;
	
	// 會員資料
	private Integer picId;
	private String userName;
	private String userEmail;
	private String userNickname;
	private String identification;
	
	public ForumBean() {
	}

	public ForumBean(Integer id, String tag, String title, String content, String date, Integer picId, String userName,
			String userEmail, String userNickname, String identification,Integer messageQty,Integer viewQty,Integer likeQty,String topArticle) {
		this.id = id;
		this.tag = tag;
		this.title = title;
		this.content = content;
		this.date = date;
		this.picId = picId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userNickname = userNickname;
		this.identification = identification;
		this.messageQty=messageQty;
		this.viewQty=viewQty;
		this.likeQty=likeQty;
		this.topArticle=topArticle;
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
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getUserNickname() {
		return userNickname;
	}
	
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getIdentification() {
		return identification;
	}

	public void setIdentification(String identification) {
		this.identification = identification;
	}

	public Integer getMessageQty() {
		return messageQty;
	}

	public void setMessageQty(Integer messageQty) {
		this.messageQty = messageQty;
	}

	public Integer getViewQty() {
		return viewQty;
	}

	public void setViewQty(Integer viewQty) {
		this.viewQty = viewQty;
	}

	
	public Integer getLikeQty() {
		return likeQty;
	}

	public void setLikeQty(Integer likeQty) {
		this.likeQty = likeQty;
	}

	public String getTopArticle() {
		return topArticle;
	}

	public void setTopArticle(String topArticle) {
		this.topArticle = topArticle;
	}
	
	
}
