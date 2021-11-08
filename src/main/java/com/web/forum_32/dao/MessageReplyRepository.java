package com.web.forum_32.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.forum_32.model.MessageReplyBean;

public interface MessageReplyRepository extends JpaRepository<MessageReplyBean,Integer>{
	public List<MessageReplyBean> findByMessageReplyId(Integer messageReplyId);
}
