package com.web.cart_30.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.web.record_30.model.RecordList;

public interface RecordListRepository extends JpaRepository< RecordList, Integer> {
	
	@Query(nativeQuery = true, value = "select * from RecordList where buyer=?1")
    public List<RecordList> findRecordList(String buyer);
	
	@Transactional
	@Modifying
    @Query(nativeQuery = true,value="update RecordList  set totalprice= ?1 where record_id = ?2")
	public void updateRecordListTotalPrice(double totalprice,String record_id);
	

	@Transactional
	@Modifying
    @Query(nativeQuery = true,value="delete from RecordList where record_id = ?1")
	public void deleteByRid(String record_id);
	
	@Query(nativeQuery = true, value = "select * from RecordList where record_id = ?1")
    public RecordList getById(String record_id);

	
	
	

	
	
	
}