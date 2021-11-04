package com.web.forum_32.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.web.forum_32.model.MessageReportBean;

public interface MessageReportRepository extends JpaRepository<MessageReportBean, Integer> {
	
}
