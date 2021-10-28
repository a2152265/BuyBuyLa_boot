package com.web.celebrations_36.service.Impl;

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
	
	
}
