package com.web.forum_32.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.web.forum_32.dao.MessageRepository;
import com.web.forum_32.model.MessageBean;

@Service
public class MessageService implements IMessageService{

	@Autowired
	MessageRepository messageRepository;
	
	@Override
	public List<MessageBean> getAllMessage(Integer messageForumId) {
		return messageRepository.findAllByForumId(messageForumId);
	}
	@Override
	public List<MessageBean> getPagedMessagesByMessageForumId(
			Integer messageForumId, int page, int size) {
		Page<MessageBean> pageResult = messageRepository.findByMessageForumId(messageForumId, 
				        PageRequest.of(page,  // 查詢的頁數，從0起算
				                size, 			// 查詢的每頁筆數
				                Sort.by("messageForumId").ascending()));
						
						pageResult.getNumberOfElements(); // 本頁筆數
						pageResult.getSize();             // 每頁筆數 
						pageResult.getTotalElements();    // 全部筆數
						pageResult.getTotalPages();       // 全部頁數
						
						List<MessageBean> messageList =  pageResult.getContent();
		return messageList;
	}
	
	@Override
	public MessageBean addMessage(MessageBean mb) {
		return messageRepository.save(mb);
	}

}
