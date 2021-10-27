package com.web.forum_32.service;

import java.util.List;
import java.util.Optional;

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
	public List<ForumBean> getAllContentsByAnnouncement() {
		return forumRepository.findAnnouncement();
	}
	
	@Override
	public List<ForumBean> getAllContentsByNoviceSeller() {
		return forumRepository.findNoviceSeller();
	}

	@Override
	public List<ForumBean> getAllContentsBySellerChat() {
		return forumRepository.findSellerChat();
	}

	@Override
	public Optional<ForumBean> findContentById(Integer id) {
		return forumRepository.findById(id);
	}


	
	

}
