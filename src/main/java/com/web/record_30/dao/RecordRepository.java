package com.web.record_30.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.web.record_30.model.RecordBean;


public interface RecordRepository extends JpaRepository<RecordBean, Integer> {
	
	@Query(nativeQuery = true, value = "select * from Record where record_id=?1 order by pid")
    public List<RecordBean> findByRecord(int record_id );
	
	@Query(nativeQuery = true, value = "select * from Record where buyer=?1  order by record_id")
    public List<RecordBean> findByRecords(String buyer );
	
	@Query(nativeQuery = true, value = "select * from Record where seller=?1  order by record_id")
    public List<RecordBean> findBySellerRecords(String seller );
	
	@Query(nativeQuery = true, value = "select * from Record where record_id=?1 AND pid=?2")
    public RecordBean findByRecordPidAndRid(int record_id,int pid );
	
	
	@Modifying
	@Query(nativeQuery = true, value = "delete from Record  where record_id=?1 AND pid=?2")
    public void deleteRecord(int record_id,int pid);
	
	@Modifying
    @Query(nativeQuery = true,value="update Record  set transport_status = ?1 where record_id = ?2 AND PID=?3")
	public void update(String ts,Integer record_id, Integer PID);
	
	@Modifying
    @Query(nativeQuery = true,value="insert into Record (record_id,pid,p_name,p_price,pcount,buyer,seller,buy_time,transport_status,category,buyeraddress)"
    		+ "values("
    		+ ":record_id,"
    		+ ":pid,"
    		+ ":p_name,"
    		+ ":p_price,"
    		+ ":pcount,"
    		+ ":buyer,"
    		+ ":seller,"
    		+ ":buy_time,"
    		+ ":transport_status,"
    		+ ":category,"
    		+ ":buyeraddress)")
	 void insert(
			@Param("record_id") Integer record_id,
			@Param("pid") Integer pid,
			@Param("p_name") String p_name,
			@Param("p_price") Double p_price,
			@Param("pcount") Integer p_count,
			@Param("buyer")String buyer,
			@Param("seller") String seller,
			@Param("buy_time") String buy_time,
			@Param("transport_status")String transport_status,
			@Param("category")String category,
	 		@Param("buyeraddress")String buyeraddress);
	
	@Query(nativeQuery = true, value = "select * from Record where category='女生衣服'")
    public List<RecordBean> findFemaleRecord();
	
	@Query(nativeQuery = true, value = "select * from Record where category='男生衣服'")
    public List<RecordBean> findMaleRecord();
	
	@Query(nativeQuery = true, value = "select * from Record where category='寵物'")
    public List<RecordBean> findPetRecord();
	
	
	@Query(nativeQuery = true, value = "select * from Record where category='運動健身'")
    public List<RecordBean> findFitRecord();
	
	
	@Query(nativeQuery = true, value = "select * from Record where category='其他'")
    public List<RecordBean> findOtherRecord();
	

	
}
