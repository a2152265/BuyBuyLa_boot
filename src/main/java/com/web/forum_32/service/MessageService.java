package com.web.forum_32.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.forum_32.dao.MessageRepository;
import com.web.forum_32.model.MessageBean;

@Service
public class MessageService implements IMessageService{

	@Autowired
	MessageRepository messageRepository;
	
	@Override
	public void addMessageContent(MessageBean mb) {
		messageRepository.save(mb);
	}

	@Override
	public List<MessageBean> getAllMessage() {
		return messageRepository.findAll();
	}

	@Override
	public List<MessageBean> getAllMessageById(Integer forumId) {
		return messageRepository.findAllByForumId(forumId);
	}

}
