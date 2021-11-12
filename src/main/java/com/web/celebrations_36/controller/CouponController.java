package com.web.celebrations_36.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import com.web.cart_30.model.Cart;
import com.web.celebrations_36.model.Coupon;
import com.web.celebrations_36.model.Point;
import com.web.celebrations_36.model.Redeem;
import com.web.celebrations_36.service.CouponService;
import com.web.celebrations_36.service.PointService;
import com.web.celebrations_36.service.RedeemService;
import com.web.member_25.model.membershipInformationBean;
import com.web.product_11.model.Product;
import com.web.product_11.service.ProductService;

@Controller
@SessionAttributes("loginSession")

public class CouponController {

	CouponService couponService;
	PointService pointService;
	ProductService productservice;
	RedeemService redeemService;
//	@Autowired
//	public CouponController(CouponService couponService, PointService pointService) {
//		this.couponService = couponService;
//		this.pointService = pointService;
//	}

	
	
//	@Autowired
//	public CouponController(CouponService couponService, PointService pointService, ProductService productservice) {
//		this.couponService = couponService;
//		this.pointService = pointService;
//		this.productservice = productservice;
//	}

	@Autowired
	public CouponController(CouponService couponService, PointService pointService, ProductService productservice,
			RedeemService redeemService) {
		this.couponService = couponService;
		this.pointService = pointService;
		this.productservice = productservice;
		this.redeemService = redeemService;
	}



	@GetMapping("/campaigns/voucher") 
	public String voucher(Model model) {
		return "celebrations_36/voucherstatics";
	}
//	@GetMapping("/campaigns/voucher1") 
//	public String voucher1(Model model) {
//		return "celebrations_36/voucherstatics2";
//	}

	@GetMapping("/campaigns/shippingVoucher") 
	public String spinningWheel(Model model) {
		return "celebrations_36/shippingVoucher";
	}

	@GetMapping("/campaigns/insertCoupon")
	public ResponseEntity<String> insertCoupon(@RequestParam("couponNumber") String couponNumber,
			@RequestParam("couponName") String couponName,
			@RequestParam("userEmail") String userEmail,
			@RequestParam("userGender") String userGender
			) {
		String couponStatus = "未使用";
		Integer count = 1;
		
		Date date = new Date();
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd ");
//	   String expiryDate = format.format(date);
	   //System.out.println("現在日期：" + currentdate);

	    Calendar ca = Calendar.getInstance();
	    ca.add(Calendar.DATE, 30);//
	    date = ca.getTime();
	    String expiryDate = format.format(date);
	   //System.out.println("到期日期：" + expiryDate);
		
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$" + couponStatus);
		couponService.save(new Coupon(userEmail, couponName, couponNumber, couponStatus, count,userGender,expiryDate));
		return new ResponseEntity<String>(HttpStatus.OK);

	}
	
	@GetMapping("/try/coupon")
	public String list(@ModelAttribute("loginSession") membershipInformationBean loginMb, Model model) throws ParseException {

		List<Coupon> list = couponService.findAllByUseremail(loginMb.getUserEmail());
		Long timeStamp = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
		String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp))));
		Date currentDate = sdf.parse(sd);
		Date expiryDate;
//	 	Date date2=sdf.parse(list.get(0).getExpiryDate()+" "+ "00:00:00");
//	 	System.out.println(sd);
//	 	Date a=sdf.parse(sd);
//	 	Date b=sdf.parse(sd1);
		System.out.println("list size" + list.size());
		
		for (int i = 0; i < list.size(); i++) {
	    
//		f=sd.compareTo(list.get(i).getExpiryDate());
		expiryDate = sdf.parse(list.get(i).getExpiryDate() + " " + "00:00:00");

		if (currentDate.after(expiryDate)) {
//		System.out.println(sdf.parse(list.get(i).getExpiryDate()+" "+ "00:00:00"));
		couponService.updateCouponStatus("已過期", list.get(i).getCouponNumber());
			}
//			System.out.println(i);
		}
		
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
			List<Redeem> redeemlist = redeemService.findAll();
			List<Product> productlist=new ArrayList<>();
			for(int i=0;i<redeemlist.size();i++) {
				Integer productId = redeemlist.get(i).getProductId();
				Product productById = productservice.getProductById(productId);
				productlist.add(productById);
			}
			model.addAttribute("point", point.getUsedpoint());
			model.addAttribute("redeemlist", productlist);
		}
		if(couponList==null) {
			model.addAttribute("couponList", "" );
		}else {
			model.addAttribute("couponList", couponList);
		}
		return "celebrations_36/couponused";
	}
	
	@GetMapping("/try/expiredcoupon")
	public String list2(@ModelAttribute("loginSession") membershipInformationBean loginMb, Model model) {
		String couponStatus = "已過期";
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
		return "celebrations_36/couponexpired";
	}
	
	
	@GetMapping("/campaigns/voucher1") 
	public String voucherStatic(Model model) {
		List<Coupon> totalnum = couponService.findAll();
		double size = totalnum.size();
		System.out.println(size);
		List<Coupon> couponstatus = couponService.getCouponstatus("已使用");
		double usenum=couponstatus.size();
		System.out.println(usenum);
		double userate=(usenum/size)*100;
		System.out.println(userate);
		model.addAttribute("size", size);
		model.addAttribute("userate", userate);
		return "celebrations_36/voucherstatics2";
	}

}
