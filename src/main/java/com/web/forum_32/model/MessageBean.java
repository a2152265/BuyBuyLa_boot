package com.web.forum_32.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="message_32")
public class MessageBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer id;
	
	private Integer forumId;
	private String userName;
	private String userEmail;
	private String messageContent;
	private String date;
	private Integer picId;
	
	
	public MessageBean() {
	}
	
	
	public MessageBean(Integer id, Integer forumId, String userName,String userEmail,String messageContent,String date,Integer picId) {
		this.id = id;
		this.forumId = forumId;
		this.userName = userName;
		this.userEmail=userEmail;
		this.messageContent=messageContent;
		this.date = date;
		this.picId=picId;
	}


	
	public String getMessageContent() {
		return messageContent;
	}


	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
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
	public Integer getForumId() {
		return forumId;
	}
	
	
	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public void setForumId(Integer forumId) {
		this.forumId = forumId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
