package com.web.forum_32.dao;

import java.util.List;

import com.web.forum_32.model.ForumBean;


public interface IForumDao {
	List<ForumBean> getAllContents();
	public ForumBean getContentByUsername(String userName);
	void addContent(ForumBean content);
	public ForumBean getContentById(int id);
	void deleteContent (int id);
	void updateContent(ForumBean fb);
	List<ForumBean> getAllContentsByChat();
	List<ForumBean> getAllContentsByBox();
	List<ForumBean> getAllContentsByOther();
	void updateContent2(ForumBean fb);
}