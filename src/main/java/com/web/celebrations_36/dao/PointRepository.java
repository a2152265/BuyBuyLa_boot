package com.web.celebrations_36.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.web.celebrations_36.model.Campaign;
import com.web.celebrations_36.model.Point;

public interface PointRepository extends JpaRepository<Point, Integer> {
	
	@Transactional
	@Modifying
    @Query(nativeQuery = true,value="update point set point = ?1 where userEmail=?2")
	public void add(Integer point,String userEmail);	
	
	Point findByUserEmail(String userEmail);
}
