package com.web.forum_32.service;

import java.util.List;

import com.web.forum_32.model.MessageBean;

public interface IMessageService {

	List<MessageBean> getAllMessage(Integer messageForumId);
	List<MessageBean> getPagedMessages(int page, int size);
	MessageBean addMessage(MessageBean mb);
}
