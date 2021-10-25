package com.web.cart_30.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.web.cart_30.model.RidCount;

public interface RidCountRepository extends JpaRepository<RidCount, Integer> {
	@Transactional
	@Modifying
    @Query(nativeQuery = true,value="update RidCount set ridcount = ?1 where id=?2")
	public void add(Integer count,Integer id);	
}
