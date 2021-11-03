package com.web.forum_32.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.web.forum_32.model.ForumBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer> {
	

	
	// 分頁全查詢
	public Page<ForumBean> findAll(Pageable pageable);
	// 標籤查詢
	public List<ForumBean> findByTag(String tag);
	// 全查詢
	public List<ForumBean> findByOrderById();
	// 作者關鍵字搜尋
	public List<ForumBean> findByUserNameContaining(String userName);
	// 最新帖子
	public List<ForumBean> findByOrderByIdDesc();
	// 熱門文章
	public List<ForumBean> findByOrderByViewQtyDesc();
	// 標籤分類
	public Page<ForumBean> findByTagContaining(String tag,Pageable pageable);
	
	
	
	
}
