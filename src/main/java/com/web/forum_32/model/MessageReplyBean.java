package com.web.forum_32.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="message_reply_32")
public class MessageReplyBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer replyId;
	private Integer messageReplyId;
	private Integer replyForumId;
	private String replyDate;
	private String replyContent;
	
	// 會員
	private Integer replyPicId;
	private String replyUserName;
	private String replyIdentification;
	private String replyUserEmail;
	public MessageReplyBean() {
	}
	public MessageReplyBean(Integer replyId, Integer messageReplyId, Integer replyForumId, String replyDate,
			String replyContent, Integer replyPicId, String replyUserName, String replyIdentification,
			String replyUserEmail) {
		this.replyId = replyId;
		this.messageReplyId = messageReplyId;
		this.replyForumId = replyForumId;
		this.replyDate = replyDate;
		this.replyContent = replyContent;
		this.replyPicId = replyPicId;
		this.replyUserName = replyUserName;
		this.replyIdentification = replyIdentification;
		this.replyUserEmail = replyUserEmail;
	}
	public Integer getReplyId() {
		return replyId;
	}
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
	public Integer getMessageReplyId() {
		return messageReplyId;
	}
	public void setMessageReplyId(Integer messageReplyId) {
		this.messageReplyId = messageReplyId;
	}
	public Integer getReplyForumId() {
		return replyForumId;
	}
	public void setReplyForumId(Integer replyForumId) {
		this.replyForumId = replyForumId;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Integer getReplyPicId() {
		return replyPicId;
	}
	public void setReplyPicId(Integer replyPicId) {
		this.replyPicId = replyPicId;
	}
	public String getReplyUserName() {
		return replyUserName;
	}
	public void setReplyUserName(String replyUserName) {
		this.replyUserName = replyUserName;
	}
	public String getReplyIdentification() {
		return replyIdentification;
	}
	public void setReplyIdentification(String replyIdentification) {
		this.replyIdentification = replyIdentification;
	}
	public String getReplyUserEmail() {
		return replyUserEmail;
	}
	public void setReplyUserEmail(String replyUserEmail) {
		this.replyUserEmail = replyUserEmail;
	}
	
	
	

	
}
