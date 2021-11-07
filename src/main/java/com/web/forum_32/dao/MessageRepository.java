package com.web.forum_32.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.web.forum_32.model.MessageBean;

public interface MessageRepository extends JpaRepository<MessageBean, Integer>  {
	
	public List<MessageBean> findByMessageForumId(Integer messageForumId);
	
    public Page<MessageBean> findByMessageForumId(Integer messageForumId, Pageable pageable);
    
    public List<MessageBean> findAllByMessageForumId(Integer messageForumId);

	
}
