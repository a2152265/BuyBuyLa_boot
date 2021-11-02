package com.web.forum_32.service;

import java.util.List;
import com.web.forum_32.model.ForumBean;


public interface IForumService {
	
	// 首頁展示
	List<ForumBean> getAll();
	List<ForumBean> getAllArticles(int page, int size);
	
	// CRUD
	List<ForumBean> findUserNameContaining(String userName);
	public ForumBean getContentById(Integer id);
	void addOrEdit(ForumBean content);
	void delete (Integer id);
	
	// 標籤分類
	List<ForumBean> getAllByTag(String tag,int page, int size);
	List<ForumBean> getAllByTag(String tag);
//	List<ForumBean> getAllContentsByNoviceSeller(String tag,int page, int size);
//	List<ForumBean> getAllContentsBySellerChat(String tag,int page, int size);
//	List<ForumBean> getAllContentsByFeatured(String tag,int page, int size);
}