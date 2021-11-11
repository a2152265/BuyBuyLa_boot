package com.web.celebrations_36.service;

import java.util.List;


import com.web.celebrations_36.model.Coupon;

public interface CouponService {
	
	void save(Coupon coupon);
	List<Coupon> findAll();
//	List <Coupon>getCouponByUseremail(String useremail);
	List<Coupon> getCouponstatusByUseremail(String userEmail,String couponStatus);
	Coupon findByUserEmail(String userEmail);
	Coupon getCouponcountByUseremail(String userEmail,Integer count);
	List<Coupon> findAllByUseremail(String userEmail);
	void updateCouponStatus(String couponStatus,String couponNumber);
	 List<Coupon> getCouponstatus(String couponStatus);

}
