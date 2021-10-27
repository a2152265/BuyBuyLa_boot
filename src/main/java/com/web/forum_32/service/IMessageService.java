package com.web.forum_32.service;

import java.util.List;

import com.web.forum_32.model.MessageBean;

public interface IMessageService {
	void addMessageContent(MessageBean mb);
	List<MessageBean> getAllMessage();
	List<MessageBean> getAllMessageById(Integer forumId);
}
