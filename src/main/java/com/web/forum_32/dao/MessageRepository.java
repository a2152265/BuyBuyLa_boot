package com.web.forum_32.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.forum_32.model.MessageBean;

public interface MessageRepository extends JpaRepository<MessageBean, Integer>  {
	
	@Query(nativeQuery = true, value = "select * from message_32 where messageForumId=:messageForumId")
	public List<MessageBean> findAllByForumId(Integer messageForumId);
    public Page<MessageBean> findByMessageForumId(Integer messageForumId, Pageable pageable);

	
}
