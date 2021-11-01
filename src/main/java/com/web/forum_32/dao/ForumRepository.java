package com.web.forum_32.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.web.forum_32.model.ForumBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer> {
	

	
	// 分頁全查詢
	public Page<ForumBean> findAll(Pageable pageable);
	// 全查詢
	public List<ForumBean> findAll();
	
	// 標籤分類
	public List<ForumBean> findByTagLikeOrderById(String tag);
	
	
	
	
}
