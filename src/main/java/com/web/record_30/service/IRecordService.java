package com.web.record_30.service;

import java.util.List;

import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;

public interface IRecordService {
	List<RecordBean> getAllRecord(int record_id);
	List<RecordBean> getAllRecords(String buyer );
	void deleteById(int record_id);
	void update(RecordBean recordBean );
	List<RecordList> getAllRecordList(String buyer);
}