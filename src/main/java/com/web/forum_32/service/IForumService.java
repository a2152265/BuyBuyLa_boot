package com.web.forum_32.service;

import java.util.List;
import java.util.Optional;

import com.web.forum_32.model.ForumBean;


public interface IForumService {
	List<ForumBean> getAllContents();
	void addContent(ForumBean content);
	
	public ForumBean getContentByUsername(String userName);
	public ForumBean getContentById(Integer id);
	public Optional<ForumBean> findContentById(Integer id);
	void delete (Integer id);
	void update (ForumBean fb);
	List<ForumBean> getAllContentsByAnnouncement();
	List<ForumBean> getAllContentsByNoviceSeller();
	List<ForumBean> getAllContentsBySellerChat();
}