package com.web.forum_32.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.web.forum_32.dao.MessageReportRepository;
import com.web.forum_32.dao.MessageRepository;
import com.web.forum_32.model.MessageBean;
import com.web.forum_32.model.MessageReportBean;

@Service
public class MessageService implements IMessageService{

	@Autowired
	MessageRepository messageRepository;
	@Autowired
	MessageReportRepository messageReportRepository;
	
	@Override
	public List<MessageBean> getAllMessage(Integer messageForumId) {
		return messageRepository.findByMessageForumId(messageForumId);
	}
	@Override
	public List<MessageBean> getPagedMessagesByMessageForumId(
			Integer messageForumId, int page, int size) {
		Page<MessageBean> pageResult = messageRepository.findByMessageForumId(
				messageForumId, 
				        PageRequest.of(page,  // 查詢的頁數，從0起算
				                size, 			// 查詢的每頁筆數
				                Sort.by("messageId").descending()));
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
	@Override
	public void delete(Integer id) {
		messageRepository.deleteById(id);
		
	}
	@Override
	public MessageBean getById(Integer id) {
		return messageRepository.getById(id);
	}
	@Override
	public List<MessageBean> getAllByMessageForumId(Integer messageForumId) {
		return messageRepository.findAllByMessageForumId(messageForumId);
	}
	@Override
	public MessageReportBean saveReport(MessageReportBean mrb) {
		return messageReportRepository.save(mrb);
	}
	@Override
	public List<MessageReportBean> getAllReportMessage() {
		return messageReportRepository.findAllByOrderByReportStatusDesc();
	}
	@Override
	public void deleteMessageReport(Integer reportId) {
		messageReportRepository.deleteById(reportId);
	}
	@Override
	public MessageReportBean getMessageReportById(Integer id) {
		return messageReportRepository.getById(id);
	}
	@Override
	public void deleteByReportStatus(String status) {
		messageReportRepository.deleteByReportStatus(status);
		
	}

}
