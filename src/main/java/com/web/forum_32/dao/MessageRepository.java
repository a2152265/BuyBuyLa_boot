package com.web.forum_32.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.forum_32.model.MessageBean;

public interface MessageRepository extends JpaRepository<MessageBean, Integer>  {
	
	@Query(nativeQuery = true, value = "select * from message_32 where forumId=:forumId")
	public List<MessageBean> findAllByForumId(Integer forumId);
	
}
