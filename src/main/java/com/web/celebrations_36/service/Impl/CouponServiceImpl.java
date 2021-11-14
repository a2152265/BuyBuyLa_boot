package com.web.celebrations_36.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.celebrations_36.dao.CouponRepository;
import com.web.celebrations_36.model.Coupon;
import com.web.celebrations_36.service.CouponService;

@Service
public class CouponServiceImpl implements CouponService {
	
	CouponRepository couponRepository;
	
	@Autowired
	public CouponServiceImpl(CouponRepository couponRepository) {
		this.couponRepository = couponRepository;
	}

	@Override
	public void save(Coupon coupon) {
		couponRepository.save(coupon);
	}

	@Override
	public List<Coupon> findAll() {
		return couponRepository.findAll();
	}

//	@Override
//	public List<Coupon> getCouponByUseremail(String useremail) {
//		return couponRepository.getCouponByUseremail(useremail);
//	}

	@Override
	public List<Coupon> getCouponstatusByUseremail(String userEmail, String couponStatus) {
		return couponRepository.getCouponstatusByUseremail(userEmail, couponStatus);
	}

	@Override
	public Coupon findByUserEmail(String userEmail) {
		return couponRepository.findByUserEmail(userEmail);
	}

	@Override
	public Coupon getCouponcountByUseremail(String userEmail, Integer count) {
		return couponRepository.getCouponcountByUseremail(userEmail, count);
	}

	@Override
	public List<Coupon> findAllByUseremail(String userEmail) {
		return couponRepository.findAllByUseremail(userEmail);
	}

	@Override
	public void updateCouponStatus(String couponStatus, String couponNumber) {
		couponRepository.updateCouponStatus(couponStatus, couponNumber);
		
	}

	@Override
	public List<Coupon> getCouponstatus(String couponStatus) {
		return couponRepository.getCouponstatus(couponStatus);
	}

	@Override
	public List<Coupon> getUserGender(String userGender) {
		return couponRepository.getUserGender(userGender);
	}

}
