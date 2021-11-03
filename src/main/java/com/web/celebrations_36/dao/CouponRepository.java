package com.web.celebrations_36.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.celebrations_36.model.Campaign;
import com.web.celebrations_36.model.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Integer> {
	
//	@Query("from Coupon c where c.userEmail=:userEmail")
//	List<Coupon> getCouponByUseremail(String userEmail);
	
	@Query("from Coupon c where c.userEmail=:userEmail and c.couponStatus=:couponStatus")
	List<Coupon> getCouponstatusByUseremail(String userEmail,String couponStatus);
	
//	@Query("from Coupon c where c.userEmail=:userEmail and c.couponStatus=:couponStatus")
//	List<Coupon> getUsedCouponByUseremail(String userEmail,String couponStatus);
	
	@Query("from Coupon c where c.userEmail=:userEmail and c.count=:count")
	Coupon getCouponcountByUseremail(String userEmail,Integer count);
	
	
	Coupon findByUserEmail(String userEmail);

}
