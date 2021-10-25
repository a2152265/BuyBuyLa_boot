package com.web.record_30.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.web.record_30.dao.RecordRepository;
import com.web.record_30.model.RecordBean;
import com.web.record_30.service.IRecordService;

@Service
public class RecordService implements IRecordService {

//	IRecordDao recordDao;
	RecordRepository recordRepository;
	@Autowired
	public RecordService(RecordRepository recordRepository) {
		this.recordRepository = recordRepository;
	}


//	@Transactional
	@Override
	public List<RecordBean> getAllRecords(String buyer) {
		// TODO Auto-generated method stub
		
		return recordRepository.findByRecord(buyer);
	}
	

	
	@Transactional
	@Override
	public void deleteById(int record_id) {
		System.out.println("**********"+record_id);
		recordRepository.delete(record_id);
		
	}
	
	@Transactional
	@Override
	public void update(RecordBean recordBean) {
	
		 recordRepository.update(recordBean.getPcount(),recordBean.getRecord_id(),recordBean.getPid());
	}

}
