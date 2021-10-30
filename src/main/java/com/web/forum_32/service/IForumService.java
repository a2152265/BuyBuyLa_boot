package com.web.forum_32.service;

import java.util.List;
import java.util.Optional;

import com.web.forum_32.model.ForumBean;


public interface IForumService {
	List<ForumBean> getAllArticles();
	public List<ForumBean> getPagedArticles(int page, int size);
	void addOrEdit(ForumBean content);
	public ForumBean getContentById(Integer id);
	public Optional<ForumBean> findContentById(Integer id);
	void delete (Integer id);
	List<ForumBean> getAllContentsByAnnouncement();
	List<ForumBean> getAllContentsByNoviceSeller();
	List<ForumBean> getAllContentsBySellerChat();
	List<ForumBean> findAllByTitle(String title);
	List<ForumBean> findAllByUserName(String userName);
}