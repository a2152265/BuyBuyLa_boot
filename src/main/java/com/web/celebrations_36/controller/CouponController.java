package com.web.celebrations_36.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.celebrations_36.model.Coupon;
import com.web.celebrations_36.model.Point;
import com.web.celebrations_36.service.CouponService;
import com.web.celebrations_36.service.PointService;
import com.web.member_25.model.membershipInformationBean;

@Controller
@SessionAttributes("loginSession")

public class CouponController {

	
	CouponService couponService;
	PointService pointService;

//	@Autowired
//	public CouponController(CouponService couponService) {
//		this.couponService = couponService;
//	}
	
	@Autowired
	public CouponController(CouponService couponService, PointService pointService) {
		this.couponService = couponService;
		this.pointService = pointService;
	}


//	@Autowired
//	public CouponController(PointService pointService) {
//	this.pointService = pointService;
//}

//	@GetMapping("/campaigns/login")
//    public ResponseEntity<String> processUserCheckAction(@ModelAttribute("loginSession") membershipInformationBean loginMb){
//		System.out.println("*****************"+loginMb.getUserEmail());
//		if(loginMb.getUserEmail()!=null) {
//			return new ResponseEntity<String>(HttpStatus.OK);
//		}
//		return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
//    }
//	
//
//
//
//
//
//
	@GetMapping("/campaigns/shippingVoucher") // 路徑變數{category}
	public String spinningWheel(Model model) {
//		 Coupon couponcountByUseremail = couponService.getCouponcountByUseremail(loginMb.getUserEmail(), 1);
//		 model.getAttribute("loginSession");
		 
//		 model.addAttribute("count",);
		return "celebrations_36/shippingVoucher";
	}

	@GetMapping("/campaigns/insertCoupon")
	public ResponseEntity<String> insertCoupon(@RequestParam("couponNumber") String couponNumber,
			@RequestParam("couponName") String couponName, @RequestParam("userEmail") String userEmail) {
		String couponStatus = "未使用";
		Integer count = 1;
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$" + couponStatus);
		couponService.save(new Coupon(userEmail, couponName, couponNumber, couponStatus, count));
		return new ResponseEntity<String>(HttpStatus.OK);

	}
//	
//	@GetMapping("/campaigns/insertPoint")
//    public ResponseEntity<String> insertPoint(
//    							@RequestParam ("point")String point,
//    							@RequestParam ("userEmail")String userEmail
//    			){
//		int point1 =Integer.valueOf(point);
//		pointService.addPointByUseremail(point1, userEmail);
//		return new ResponseEntity<String>(HttpStatus.OK);
//		
//    }

//	@GetMapping("/try/coupon/{userEmail}")
//	public String list(@PathVariable("userEmail") String userEmail, Model model) {
//		String couponStatus="未使用";
//		List<Coupon> couponList = couponService.getUsedCouponByUseremail(userEmail, couponStatus);
//		System.out.println(couponList);
//		model.addAttribute("couponList",couponList);
//		return "celebrations_36/coupon";
//	} 

//	@GetMapping("/try/coupon")
//	public String list1( Model model) {
//		
//		return "celebrations_36/couponavailable";
//	}

	
	
	
	
	
	
	
	@GetMapping("/try/coupon")
	public String list(@ModelAttribute("loginSession") membershipInformationBean loginMb, Model model) {
		
		String couponStatus = "未使用";
		List<Coupon> couponList = couponService.getCouponstatusByUseremail(loginMb.getUserEmail(), couponStatus);
		System.out.println(couponList);
		Point point = pointService.findByUseremail(loginMb.getUserEmail());
		if(point==null) {

			model.addAttribute("point", 0);
		}else {
			
			model.addAttribute("point", point.getPoint());
		}
		
		if(couponList==null) {
			model.addAttribute("couponList", "" );
		}else {
			model.addAttribute("couponList", couponList);
		}
		//model.addAttribute("couponList", couponList);
		return "celebrations_36/couponavailable";
	}

	@GetMapping("/try/usedcoupon")
	public String list1(@ModelAttribute("loginSession") membershipInformationBean loginMb, Model model) {
		String couponStatus = "已使用";
		List<Coupon> couponList = couponService.getCouponstatusByUseremail(loginMb.getUserEmail(), couponStatus);
		System.out.println(couponList);
		Point point = pointService.findByUseremail(loginMb.getUserEmail());
		
		if(point==null) {

			model.addAttribute("point", 0);
		}else {
			
			model.addAttribute("point", point.getUsedpoint());
		}
		
		if(couponList==null) {
			model.addAttribute("couponList", "" );
		}else {
			model.addAttribute("couponList", couponList);
		}
		return "celebrations_36/couponused";
	}
	
//	@GetMapping("/try/usedcoupon")
//	public String list1(@ModelAttribute("loginSession") membershipInformationBean loginMb, Model model) {
//		String couponStatus = "已使用";
//		List<Coupon> couponList = couponService.getCouponstatusByUseremail(loginMb.getUserEmail(), couponStatus);
//		System.out.println(couponList);
//		Point point = pointService.findByUseremail(loginMb.getUserEmail());
//		
//		
//		model.addAttribute("point", point.getUsedpoint());
//		model.addAttribute("couponList", couponList);
//		return "celebrations_36/couponused";
//	}

	
//	@GetMapping("/try/coupon/{userEmail}")
//	public String list(@PathVariable("userEmail") String userEmail, Model model) {
//		
//		return "celebrations_36/coupon";
//	} 

}
