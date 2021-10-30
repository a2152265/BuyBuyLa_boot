package com.web.record_30.service;

import java.util.List;

import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;

public interface IRecordService {
	List<RecordBean> getAllRecord(int record_id);
	List<RecordBean> getAllRecords(String buyer );
	
	void deleteRecord(int record_id,int pid);
	void updateRecordListTotalPrice(int record_id,int pid);
	void deleteRecordListById(int record_id);
	
	void update(int rid,int pid,String ts);
	List<RecordList> getAllRecordList(String buyer);
	List<RecordBean> getAllSellerRecords(String seller );
	
}