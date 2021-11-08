package com.web.forum_32.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.forum_32.model.ForumLikeBean;

public interface ForumLikeRepository extends JpaRepository<ForumLikeBean,Integer> {
	
	public ForumLikeBean findByForumIdAndLoginUserName(Integer forumId,String loginUserName);
	
	List<ForumLikeBean> findByForumIdAndStatus(Integer forumId,boolean status);
}
