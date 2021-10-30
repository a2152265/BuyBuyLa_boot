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
	private Integer messageId;
	private Integer messageForumId;
	private String messageDate;
	private String messageContent;
	
	// 會員資料
	private Integer messagePicId;
	private String messageUserName;
	private String messageIdentification;
	private String messageUserEmail;
	
	public MessageBean() {
	}

	public MessageBean(Integer messageId, Integer messageForumId, String messageDate, String messageContent,
			Integer messagePicId, String messageUserName, String messageIdentification, String messageUserEmail) {
		this.messageId = messageId;
		this.messageForumId = messageForumId;
		this.messageDate = messageDate;
		this.messageContent = messageContent;
		this.messagePicId = messagePicId;
		this.messageUserName = messageUserName;
		this.messageIdentification = messageIdentification;
		this.messageUserEmail = messageUserEmail;
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Integer getMessageForumId() {
		return messageForumId;
	}

	public void setMessageForumId(Integer messageForumId) {
		this.messageForumId = messageForumId;
	}

	public String getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public Integer getMessagePicId() {
		return messagePicId;
	}

	public void setMessagePicId(Integer messagePicId) {
		this.messagePicId = messagePicId;
	}

	public String getMessageUserName() {
		return messageUserName;
	}

	public void setMessageUserName(String messageUserName) {
		this.messageUserName = messageUserName;
	}

	public String getMessageIdentification() {
		return messageIdentification;
	}

	public void setMessageIdentification(String messageIdentification) {
		this.messageIdentification = messageIdentification;
	}

	public String getMessageUserEmail() {
		return messageUserEmail;
	}

	public void setMessageUserEmail(String messageUserEmail) {
		this.messageUserEmail = messageUserEmail;
	}
	
	

	
	
}
