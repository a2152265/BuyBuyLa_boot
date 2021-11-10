package com.web.celebrations_36.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.web.celebrations_36.model.Coupon;

public interface CouponRepository extends JpaRepository<Coupon, Integer> {
	
//	@Query("from Coupon c where c.userEmail=:userEmail")
//	List<Coupon> getCouponByUseremail(String userEmail);
	
	@Query("from Coupon c where c.userEmail=:userEmail and c.couponStatus=:couponStatus order by c.expiryDate ASC")
	List<Coupon> getCouponstatusByUseremail(String userEmail,String couponStatus);
	
//	@Query("from Coupon c where c.userEmail=:userEmail and c.couponStatus=:couponStatus")
//	List<Coupon> getUsedCouponByUseremail(String userEmail,String couponStatus);
	
	@Query("from Coupon c where c.userEmail=:userEmail and c.count=:count")
	Coupon getCouponcountByUseremail(String userEmail,Integer count);
	
	
	Coupon findByUserEmail(String userEmail);
	

	 @Query("from Coupon c where c.userEmail=:userEmail ")
	 List<Coupon> findAllByUseremail(String userEmail);
	
	 @Query("from Coupon c where c.couponStatus=:couponStatus ")
	 List<Coupon> getCouponstatus(String couponStatus);
	
	 @Modifying(clearAutomatically = true)
	 @Transactional
     @Query("update Coupon set couponStatus=:couponStatus where couponNumber = :couponNumber")
	 void updateCouponStatus(String couponStatus,String couponNumber);
}
