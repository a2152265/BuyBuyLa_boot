package com.web.forum_32.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.forum_32.model.ForumBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer> {
	
	
	public List<ForumBean> findAllByOrderByIdDesc();
	
	@Query(nativeQuery = true, value = "select * from forum_32 where tag='開箱文' order by id desc")
	public List<ForumBean> findByBox();
	
	@Query(nativeQuery = true, value = "select * from forum_32 where tag='忙裡偷閒聊' order by id desc")
	public List<ForumBean> findByChat();
	
	@Query(nativeQuery = true, value = "select * from forum_32 where tag='其他' order by id desc")
	public List<ForumBean> findByOrder();
	
}
