package com.web.cart_30.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.web.record_30.model.RecordList;

public interface RecordListRepository extends JpaRepository< RecordList, Integer> {
	@Query(nativeQuery = true, value = "select * from RecordList where buyer=?1")
    public List<RecordList> findRecordList(String buyer);
}
