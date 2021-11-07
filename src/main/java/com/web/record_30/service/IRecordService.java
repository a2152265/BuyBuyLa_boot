package com.web.record_30.service;

import java.util.List;

import com.web.cart_30.model.BuyerAddress;
import com.web.member_25.model.membershipInformationBean;
import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;

public interface IRecordService {
	List<RecordBean> getAllRecord(String record_id);
	List<RecordBean> getAllRecords(String buyer );
	
	void deleteRecord(String record_id,int pid);
	void updateRecordListTotalPrice(String record_id,int pid);
	void deleteRecordListById(String record_id);
	
	void update(String rid,int pid,String ts);
	List<RecordList> getAllRecordList(String buyer);
	List<RecordBean> getAllSellerRecords(String seller );
	
	BuyerAddress getBuyerInfo(String buyer);
	
	
	//以下為管理者功能	
	List<RecordList> getAllMemberRecord();
	
	void deleteRecordList(String rid);
	
	RecordList getRecordByRid(String rid);
	
	void updateRecordList(RecordList recordList);
	
	void deleteAllRecordByRid(String rid);
	
	Double findFemaleRecord();
	Double findMaleRecord();
	Double findPetRecord();
	Double findFitRecord();
	Double findOtherRecord();
	
}