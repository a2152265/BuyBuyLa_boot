package com.web.forum_32.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.web.forum_32.model.MessageReportBean;

public interface MessageReportRepository extends JpaRepository<MessageReportBean, Integer> {
	
	public List<MessageReportBean> findAllByOrderByReportStatusDesc();
	
	@Transactional
	@Modifying
	@Query(value = "delete from message_report_32 where reportStatus = ?1",nativeQuery = true)
	void deleteByReportStatus(String reportStatus);
}
