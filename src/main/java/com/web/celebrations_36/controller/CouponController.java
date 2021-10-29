package com.web.celebrations_36.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.celebrations_36.model.Coupon;
import com.web.celebrations_36.service.CouponService;
import com.web.member_25.model.membershipInformationBean;

@Controller
@SessionAttributes("loginSession")

public class CouponController {
	
	CouponService couponService;
	
	
	@Autowired
	public CouponController(CouponService couponService) {
		this.couponService = couponService;
	}

	@GetMapping("/campaigns/login")
    public ResponseEntity<String> processUserCheckAction(@ModelAttribute("loginSession") membershipInformationBean loginMb){
		System.out.println("*****************"+loginMb.getUserEmail());
		if(loginMb.getUserEmail()!=null) {
			return new ResponseEntity<String>(HttpStatus.OK);
		}
		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
    }
	
	@GetMapping("/campaigns/spinningwheel") // 路徑變數{category}
	public String spinningWheel(Model model) {
		return "celebrations_36/spinningwheel";
	}
	
	@GetMapping("/campaigns/insertCoupon")
    public ResponseEntity<String> insertCoupon(
    							@RequestParam ("couponNumber")String couponNumber,
    							@RequestParam ("couponName")String couponName,
    							@RequestParam ("userEmail")String userEmail
    			){
		
		couponService.save(new Coupon(userEmail, couponName, couponNumber));
		return new ResponseEntity<String>(HttpStatus.OK);
		
    }
	
}
