package com.web.record_30.dao;

import java.util.List;

import com.web.record_30.model.RecordBean;



public interface IRecordDao {

	List<RecordBean> getAllRecords(String buyer);
	void deleteById(int record_id);
	RecordBean update(RecordBean recordBean );

}