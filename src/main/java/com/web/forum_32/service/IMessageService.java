package com.web.forum_32.service;

import java.util.List;


import com.web.forum_32.model.MessageBean;
import com.web.forum_32.model.MessageReplyBean;
import com.web.forum_32.model.MessageReportBean;

public interface IMessageService {
	// 評論
	List<MessageBean> getAllMessage(Integer messageForumId);
	List<MessageBean> getAllByMessageForumId(Integer messageForumId);
	List<MessageBean> getPagedMessagesByMessageForumId(Integer messageForumId, int page,int size);
	MessageBean addMessage(MessageBean mb);
	void delete(Integer id);
	public MessageBean getById(Integer id) ;
	
	// 回覆評論
	MessageReplyBean addReplyMessage(MessageReplyBean mrb);
	List<MessageReplyBean> findByMessageReplyId(Integer messageReplyId);
	void deleteReply(Integer id);
	public MessageReplyBean getByReplyId(Integer replyId);
	
	// 檢舉
	public MessageReportBean getMessageReportById(Integer id);
	MessageReportBean saveReport(MessageReportBean mrb);
	List<MessageReportBean> getAllReportMessage();
	void deleteMessageReport(Integer reportId);
	void deleteByReportStatus(String status);
	
}
