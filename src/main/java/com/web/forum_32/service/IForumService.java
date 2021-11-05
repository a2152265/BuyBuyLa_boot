package com.web.forum_32.service;

import java.util.List;
import com.web.forum_32.model.ForumBean;


public interface IForumService {
	
	// 首頁展示
	List<ForumBean> getAll();
	List<ForumBean> getAllArticlesByPage(int page, int size);
	// 標籤分類
	List<ForumBean> getAllByTag(String tag,int page, int size);
	List<ForumBean> getAllByTag(String tag);
	
	
	// CRUD
	List<ForumBean> findUserNameContaining(String userName);
	public ForumBean getContentById(Integer id);
	void addOrEdit(ForumBean content);
	void delete (Integer id);
	
	// 熱門文章
	List<ForumBean> findTop4ByOrderByViewQtyDesc();
	// 最新帖子
	List<ForumBean> findTop4ByOrderByIdDesc();
	
}