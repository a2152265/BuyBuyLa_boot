package com.web.forum_32.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="message_report_32")
public class MessageReportBean implements Serializable {
	private static final long serialVersionUID = 1L;

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer reportId;
	
	private Integer reportForumId;
	private Integer reportMessageId;
	private String reportUserName;
	private String reportedUserName;
	private String reportedUserEmail;
	private String reportReason;
	private String reportContent;
	private String reportDate;
	private String reportStatus;
	private String warningContent;
	
	
	public MessageReportBean() {
	}


	public MessageReportBean(Integer reportId,Integer reportForumId, Integer reportMessageId, String reportUserName, String reportedUserEmail,String reportedUserName,
			String reportReason, String reportContent, String reportDate, String reportStatus,String warningContent) {
		this.reportId = reportId;
		this.reportForumId=reportForumId;
		this.reportMessageId = reportMessageId;
		this.reportUserName = reportUserName;
		this.reportedUserName = reportedUserName;
		this.reportReason = reportReason;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportStatus=reportStatus;
		this.warningContent=warningContent;
	}


	public Integer getReportId() {
		return reportId;
	}


	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}


	public Integer getReportForumId() {
		return reportForumId;
	}


	public void setReportForumId(Integer reportForumId) {
		this.reportForumId = reportForumId;
	}


	public Integer getReportMessageId() {
		return reportMessageId;
	}


	public void setReportMessageId(Integer reportMessageId) {
		this.reportMessageId = reportMessageId;
	}


	public String getReportUserName() {
		return reportUserName;
	}


	public void setReportUserName(String reportUserName) {
		this.reportUserName = reportUserName;
	}


	public String getReportedUserName() {
		return reportedUserName;
	}


	public void setReportedUserName(String reportedUserName) {
		this.reportedUserName = reportedUserName;
	}


	public String getReportedUserEmail() {
		return reportedUserEmail;
	}


	public void setReportedUserEmail(String reportedUserEmail) {
		this.reportedUserEmail = reportedUserEmail;
	}


	public String getReportReason() {
		return reportReason;
	}


	public void setReportReason(String reportReason) {
		this.reportReason = reportReason;
	}


	public String getReportContent() {
		return reportContent;
	}


	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}


	public String getReportDate() {
		return reportDate;
	}


	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}


	public String getReportStatus() {
		return reportStatus;
	}


	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}


	public String getWarningContent() {
		return warningContent;
	}


	public void setWarningContent(String warningContent) {
		this.warningContent = warningContent;
	}

	
	
	
	
	
	
}
