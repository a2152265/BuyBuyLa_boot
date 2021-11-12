package com.web.celebrations_36.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.celebrations_36.dao.CouponRepository;
import com.web.celebrations_36.model.Coupon;
import com.web.celebrations_36.model.Point;
import com.web.celebrations_36.model.Redeem;
import com.web.celebrations_36.service.PointService;
import com.web.celebrations_36.service.RedeemService;
import com.web.member_25.model.membershipInformationBean;
import com.web.product_11.model.Product;
import com.web.product_11.service.ProductService;

@Controller
@SessionAttributes({"loginSession","memberUiDefault"})
public class PointController {
	
	PointService pointService;
	ProductService productservice;
	RedeemService redeemService;
	
//	@Autowired
//	public PointController(PointService pointService) {
//	this.pointService = pointService;
//}
//	@Autowired
//	public PointController(PointService pointService, ProductService productservice) {
//		this.pointService = pointService;
//		this.productservice = productservice;
//	}

	@Autowired
	public PointController(PointService pointService, ProductService productservice, RedeemService redeemService) {
	this.pointService = pointService;
	this.productservice = productservice;
	this.redeemService = redeemService;
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
	
	@GetMapping("/campaigns/insertPoint")
    public ResponseEntity<String> insertPoint(
    							@RequestParam ("point")String point,
    							@RequestParam ("userEmail")String userEmail
    			){
		int point1 =Integer.valueOf(point);
		pointService.addPointByUseremail(point1, userEmail);
		return new ResponseEntity<String>(HttpStatus.OK);
		
    }
	
	//兌換頁面
		@GetMapping("/campaigns/redeem") 
		public String redeem(Model model) {
			
			List<Product> allPoints = productservice.getAllPoints();
			model.addAttribute("products",allPoints);
			return "celebrations_36/redeem";
		}
		
	
	
//	@GetMapping("/redeempoint")
//	@ResponseBody
//	public String redeemPoint(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id ,@RequestParam Integer point ,Model model) {
//		System.out.println("c333333333333333333c= "+id);
//		System.out.println("c33333333333333333c= "+point);
//		Point findPointByUseremail = pointService.findByUseremail(mb.getUserEmail());
//		System.out.println(findPointByUseremail.getPoint());
//		if(findPointByUseremail.getPoint()<point) {
//			return "failure";
//		}else if(findPointByUseremail.getPoint()<point) {
//			return "success";
//		}
////		String buyer=mb.getUserEmail();
////		cartService.addItemByid(id,buyer);
////		model.addAttribute("OrderItemCount",buyer);
////		List<Cart> cart = cartService.addToRecord(buyer);
////		model.addAttribute("cart", cart);	
//		
//		return "redirect:/";
//	}
	
	@GetMapping("/redeempoint")
	@ResponseBody
	public ResponseEntity<String> redeemPoint(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id ,@RequestParam Integer point ,@RequestParam String productName,Model model) {
		System.out.println("c333333333333333333c= "+id);
		System.out.println("c33333333333333333c= "+point);
		System.out.println("dadasd"+productName);
		System.out.println(mb.getUserEmail());
		Point findPointByUseremail = pointService.findByUseremail(mb.getUserEmail());
		if(findPointByUseremail!=null) {
		if(findPointByUseremail.getPoint()<point) {
			
			 return new ResponseEntity<String>("failure",HttpStatus.OK);
 
		}else if(findPointByUseremail.getPoint()>point) {
			Long timeStamp = System.currentTimeMillis();  //获取当前时间戳
		    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp)))); 
		   
			Redeem redeem = new Redeem(id,point,mb.getUserEmail(),sd,productName);
			redeemService.save(redeem);
			pointService.minusPointByUseremail(findPointByUseremail.getPoint(), point, mb.getUserEmail());
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		}else {
			int point2=0;
			int usedpoint=0;
			Point point3=new Point(mb.getUserEmail(),point2,usedpoint);
			pointService.save(point3);
		}
		
		return new ResponseEntity<String>("N", HttpStatus.OK);
	}
	
	
	@GetMapping("/try/point") 
	public String pointAvailable(@ModelAttribute("loginSession") membershipInformationBean loginMb,Model model) {
		
		Point point = pointService.findByUseremail(loginMb.getUserEmail());
		if(point==null) {
			model.addAttribute("point", 0);
		}else {
			model.addAttribute("point", point.getPoint());
		}
		return "celebrations_36/pointavailable";
	}
	
	@GetMapping("/try/usedpoint")
	public String list1(@ModelAttribute("loginSession") membershipInformationBean loginMb, Model model) {
		Point point = pointService.findByUseremail(loginMb.getUserEmail());
		
		if(point==null) {
			model.addAttribute("point", 0);
		}else {
			List<Redeem> redeemlist = redeemService.findAllByUseremail(loginMb.getUserEmail());
//			List<Product> productlist=new ArrayList<>();;
//			List<Redeem> redeemlistList= new ArrayList<>();
//			for(int i=0;i<redeemlist.size();i++) {
//				Integer productId = redeemlist.get(i).getProductId();
//				Product productById = productservice.getProductById(productId);
//				Redeem redeem = new Redeem();
//				redeem.setId( redeemlist.get(i).getProductId());
//				redeem.setProductName(productById.getProductName());
//				
//					redeemService.save(redeem);
////				productlist.add(productById);
//			}
//			List<Redeem> redeemlist2 = redeemService.findAll();
//			model.addAttribute("redeemlst1", redeemlist);
			model.addAttribute("point", point.getUsedpoint());
			model.addAttribute("redeemlist", redeemlist);
//			model.addAttribute("redeemlist", productlist);
		}
		return "celebrations_36/pointused";
	}
}
