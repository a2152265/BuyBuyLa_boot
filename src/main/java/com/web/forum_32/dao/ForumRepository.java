package com.web.forum_32.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.web.forum_32.model.ForumBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer> {
	

	
	// 分頁全查詢
	public Page<ForumBean> findAll(Pageable pageable);
	// 按照最新查詢
	public List<ForumBean> findByOrderById();
	// 作者關鍵字搜尋
	public List<ForumBean> findByUserNameContaining(String userName);
	
	// 標籤分類
	public List<ForumBean> findByTag(String tag);
	public Page<ForumBean> findByTagContaining(String tag,Pageable pageable);
	
	
	
	
}
