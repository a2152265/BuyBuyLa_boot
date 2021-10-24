package com.web.record_30.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.web.record_30.model.RecordBean;


public interface RecordRepository extends JpaRepository<RecordBean, Integer> {
	
	@Query(nativeQuery = true, value = "select * from Record where buyer=?1 order by record_id")
    public List<RecordBean> findByRecord(String buyer);
	
	
	@Modifying
	@Query(nativeQuery = true, value = "delete from Record  where record_id=?1")
    public void delete(int record_id);
	
	@Modifying
    @Query(nativeQuery = true,value="update Record  set pcount = ?1 where record_id = ?2 AND PID=?3")
	void update(Integer pcount,Integer record_id, Integer PID);
	
}
