package com.web.forum_32.service;

import java.util.List;

import com.web.forum_32.model.ForumBean;


public interface IForumService {
	List<ForumBean> getAllContents();
	void addContent(ForumBean content);
	
	public ForumBean getContentByUsername(String userName);
	public ForumBean getContentById(Integer id);
	void delete (Integer id);
	void update (ForumBean fb);
	List<ForumBean> getAllContentsByChat();
	List<ForumBean> getAllContentsByBox();
	List<ForumBean> getAllContentsByOther();
}