package com.web.forum_32.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.forum_32.model.ForumBean;

public interface ForumRepository extends JpaRepository<ForumBean, Integer> {
//	findUserByNameIsLike
	
	public List<ForumBean> findAllByOrderByIdDesc();
	
	@Query(nativeQuery = true, value = "select * from forum_32 where tag='官方最新公告'")
	public List<ForumBean> findAnnouncement();
	
	@Query(nativeQuery = true, value = "select * from forum_32 where tag='新手賣家發問' order by id desc")
	public List<ForumBean> findNoviceSeller();
	
	@Query(nativeQuery = true, value = "select * from forum_32 where tag='賣家閒聊討論' order by id desc")
	public List<ForumBean> findSellerChat();
	
	@Query(nativeQuery = true, value = "select * from forum_32 where userName=:userName order by id desc")
	public List<ForumBean> findAllByUserName(String userName);
	
	@Query(nativeQuery = true, value = "select * from forum_32 where title=:title order by id desc")
	public List<ForumBean> findAllByTitle(String title);
	
	
}
