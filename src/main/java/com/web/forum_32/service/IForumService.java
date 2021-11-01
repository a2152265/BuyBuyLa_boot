package com.web.forum_32.service;

import java.util.List;
import com.web.forum_32.model.ForumBean;


public interface IForumService {
	
	
	List<ForumBean> getAll();
	List<ForumBean> getAllArticles(int page, int size);
	
	void addOrEdit(ForumBean content);
	void delete (Integer id);
	public ForumBean getContentById(Integer id);
	
	List<ForumBean> getAllContentsByAnnouncement();
	List<ForumBean> getAllContentsByNoviceSeller();
	List<ForumBean> getAllContentsBySellerChat();
}