package com.web.forum_32.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.forum_32.dao.ForumDao;
import com.web.forum_32.model.ForumBean;



@Service
@Transactional
public class ForumService implements IForumService {

	ForumDao forumDao;
	
	
	@Autowired
	public void setDao(ForumDao forumDao) {
		this.forumDao = forumDao;
	}

	@Override
	public List<ForumBean> getAllContents() {
		return forumDao.getAllContents();
	}

	@Override
	public ForumBean getContentByUsername(String userName) {
		// TODO Auto-generated method stub
		return forumDao.getContentByUsername(userName);
	}

	@Override
	public void addContent(ForumBean content) {
		forumDao.addContent(content);
	}
	
	@Override
	public ForumBean getContentById(int id) {
		return forumDao.getContentById(id);
	}
	
	@Override
	public void deleteContent(int id) {
		forumDao.deleteContent(id);
	}

	@Override
	public void updateContent(ForumBean fb) {
		forumDao.updateContent(fb);
	}
	
	@Override
	public List<ForumBean> getAllContentsByChat() {
		return forumDao.getAllContentsByChat();
	}

	@Override
	public List<ForumBean> getAllContentsByBox() {
		return forumDao.getAllContentsByBox();
	}

	@Override
	public List<ForumBean> getAllContentsByOther() {
		return forumDao.getAllContentsByOther();
	}

	@Override
	public void updateContent2(ForumBean fb) {
		forumDao.updateContent2(fb);
	}
	
	

}
