package com.web.record_30.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.cart_30.dao.RecordListRepository;
import com.web.record_30.dao.RecordRepository;
import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;
import com.web.record_30.service.IRecordService;

@Service
public class RecordService implements IRecordService {

//	IRecordDao recordDao;
	RecordRepository recordRepository;
	RecordListRepository recordListRepository;
	@Autowired
	public RecordService(RecordRepository recordRepository,RecordListRepository recordListRepository) {
		this.recordRepository = recordRepository;
		this.recordListRepository=recordListRepository;
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

}
