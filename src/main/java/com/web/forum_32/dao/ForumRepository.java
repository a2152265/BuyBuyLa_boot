package com.web.forum_32.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.forum_32.model.ForumBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer> {
	
	// 文章顯示
	public List<ForumBean> findByTopArticleLikeOrderByIdDesc(String top);

	
	public List<ForumBean> findByTagLikeOrderById(String tag);
	
	@Query(nativeQuery = true, value = "select * from forum_32 where userName=:userName order by id desc")
	public List<ForumBean> findAllByUserName(String userName);
	
	@Query(nativeQuery = true, value = "select * from forum_32 where title=:title order by id desc")
	public List<ForumBean> findAllByTitle(String title);
	
	
}
