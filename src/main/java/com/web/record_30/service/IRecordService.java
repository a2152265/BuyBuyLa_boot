package com.web.record_30.service;

import java.util.List;

import com.web.member_25.model.membershipInformationBean;
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
	
	membershipInformationBean getBuyerInfo(String buyer);
	
	
	//以下為管理者功能	
	List<RecordList> getAllMemberRecord();
	
	void deleteRecordList(int rid);
	
	RecordList getRecordByRid(int rid);
	
	void updateRecordList(RecordList recordList);
	
	Double findFemaleRecord();
	Double findMaleRecord();
	Double findPetRecord();
	Double findFitRecord();
	Double findOtherRecord();
	
}