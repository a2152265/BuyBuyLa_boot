package com.web.forum_32.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.forum_32.dao.ForumRepository;
import com.web.forum_32.model.ForumBean;



@Service
public class ForumService implements IForumService {
	
	@Autowired
	ForumRepository forumRepository;
	

	@Override
	public List<ForumBean> getAllContents() {
		return forumRepository.findAllByOrderByIdDesc();
	}
    
	@Override
	public ForumBean getContentByUsername(String userName) {
//		return forumRepository.findByName(userName);
		return null;
	}

	@Override
	public void addContent(ForumBean content) {
		forumRepository.save(content);
	}
	
	@Override
	public ForumBean getContentById(Integer id) {
		return forumRepository.getById(id);
	}
	
	@Override
	public void delete(Integer id) {
		forumRepository.deleteById(id);
	}

	@Override
	public void update(ForumBean fb) {
		forumRepository.save(fb);
	}
	
	@Override
	public List<ForumBean> getAllContentsByChat() {
		return forumRepository.findByChat();

	}

	@Override
	public List<ForumBean> getAllContentsByBox() {
		return forumRepository.findByBox();

	}

	@Override
	public List<ForumBean> getAllContentsByOther() {
		return forumRepository.findByOrder();
	}


	
	

}
