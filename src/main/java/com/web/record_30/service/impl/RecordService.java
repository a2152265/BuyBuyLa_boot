package com.web.record_30.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.cart_30.dao.RecordListRepository;
import com.web.member_25.dao.MembertRepository;
import com.web.member_25.model.membershipInformationBean;
import com.web.record_30.dao.RecordRepository;
import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;
import com.web.record_30.service.IRecordService;

@Service
public class RecordService implements IRecordService {

//	IRecordDao recordDao;@Autowired
	MembertRepository membertRepository;
	RecordRepository recordRepository;
	RecordListRepository recordListRepository;
	@Autowired
	public RecordService(RecordRepository recordRepository,RecordListRepository recordListRepository,MembertRepository membertRepository) {
		this.recordRepository = recordRepository;
		this.recordListRepository=recordListRepository;
		this.membertRepository=membertRepository;
	}


//	@Transactional
	@Override
	public List<RecordBean> getAllRecord(int record_id) {
		
		return recordRepository.findByRecord(record_id);
	}
	

	
	@Transactional
	@Override
	public void deleteRecord(int record_id,int pid) {
		System.out.println("**********"+record_id);
		recordRepository.deleteRecord(record_id,pid);
		
	}
	
	@Override
	public void updateRecordListTotalPrice(int record_id, int pid) {
		RecordBean rb =recordRepository.findByRecordPidAndRid(record_id, pid);
		double price=rb.getP_price();
		int count =rb.getPcount();
		double totalprice =price*count;
		recordListRepository.updateRecordListTotalPrice(totalprice,record_id);
		
	}
	
	@Override
	public void deleteRecordListById(int record_id) {
		recordListRepository.deleteById(record_id);
		
	}
	
	@Transactional
	@Override
	public void update(int rid,int pid,String ts) {
	
		 recordRepository.update(ts,rid,pid);
	}


	@Override
	public List<RecordList> getAllRecordList(String buyer) {
		// TODO Auto-generated method stub
		return recordListRepository.findRecordList(buyer);
	}


	@Override
	public List<RecordBean> getAllRecords(String buyer) {
		
		return recordRepository.findByRecords(buyer);

	}


	@Override
	public List<RecordBean> getAllSellerRecords(String seller) {

		return recordRepository.findBySellerRecords(seller);
	}


	@Override
	public membershipInformationBean getBuyerInfo(String buyer) {
		
		return membertRepository.findByUserEmail(buyer);
	}

//
	
	//以下為管理者功能
	@Override
	public List<RecordList> getAllMemberRecord() {
	
		return recordListRepository.findAll();
	}


	@Override
	public void deleteRecordList(int rid) {
		recordListRepository.deleteById(rid);
		
	}


	@Override
	public RecordList getRecordByRid(int rid) {
		
		return recordListRepository.getById(rid);
	}


	@Override
	public void updateRecordList(RecordList recordList) {
		recordListRepository.save(recordList);
		
	}


	@Override
	public Double findFemaleRecord() {
//		recordRepository.findFemaleRecord();
		return 0.0;
	}


	




}
