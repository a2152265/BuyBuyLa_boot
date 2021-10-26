package com.web.cart_30.controller;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.cart_30.model.Cart;

import com.web.cart_30.service.CartService;
import com.web.member_25.model.membershipInformationBean;
import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;




@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData" })
public class CartController {
	CartService cartService;

	@Autowired
	public CartController(CartService cartService) {

		this.cartService = cartService;
	}


	@GetMapping("/test")
	public String home(
//			@ModelAttribute("loginSession") membershipInformationBean mb,
			Model model) {

		 return "product_11/products";
		 
	}
	
	
	
	@GetMapping("/additem")
	public String additem(@RequestParam Integer id ,Model model) {
		System.out.println("PID cc= "+id);
	
		cartService.addItemByid(id,true);
		return "redirect:/products";
	}
	
	
	
	@GetMapping("/cart")
	public String cart(Model model) {
	List<Cart> cart = cartService.addToRecord();
	model.addAttribute("cart", cart);	
		 return "cart_30/cart";
	}
	
	
	@GetMapping("/deletecart")
	public String deletecart(@RequestParam Integer id ,Model model) {
		List<Cart> cart = cartService.addToRecord();
		model.addAttribute("cart", cart);	
		cartService.deletecart(id);

		 return "redirect:/cart";
	}
	
	@GetMapping("/add")
	public String add(@RequestParam Integer id,Model model) {
		System.out.println("starttttt===============");
		List<Cart> cart = cartService.addToRecord();
		model.addAttribute("cart", cart);
		cartService.add(id);	
		System.out.println("===============endddddddddddd");
	
		 return "redirect:/cart";
	}
	
	@GetMapping("/sub")
	public String sub(@RequestParam Integer id,Model model) {
		System.out.println("starttttt===============");
		List<Cart> cart = cartService.addToRecord();
		model.addAttribute("cart", cart);
		cartService.sub(id);	
		System.out.println("===============endddddddddddd");
	
		 return "redirect:/cart";
	}
	
	@GetMapping("/check")
	public String check(Model model) {
		List<Cart> cart = cartService.addToRecord();
		model.addAttribute("cart", cart);	
		 return "cart_30/check";
	}
	
	
	@GetMapping("/fin")
	public String fin(@ModelAttribute("loginSession") membershipInformationBean mb ,Model model) {
		List<Cart> cart = cartService.addToRecord();
		model.addAttribute("cart", cart);	
		int rc = cartService.getRidCount(1);
		RecordBean rb =new RecordBean();
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		String now = dtf.format(LocalDateTime.now());
		String account = mb.getUserEmail();
		System.out.println(now);
		double totalprice =0;
		for(Cart c:cart) {
						
			rb.setRecord_id(rc);
			rb.setPid(c.getPid());
			rb.setP_name(c.getP_name());
			rb.setP_price(c.getP_price());
			rb.setPcount(c.getCount());
			rb.setBuyer(account);
			rb.setSeller(c.getSeller());
			rb.setBuy_time(now);
			rb.setTransport_status("待出貨");
			System.out.println("****************************************************");
			System.out.println("***"+rb.getId()+"RID = "+rb.getRecord_id()+", PID = "+rb.getPid()+", NAME = "
					+ rb.getP_name()+", PRICE = "+rb.getP_price()+", CNT = "+rb.getPcount()
					+", BUYER = "+rb.getBuyer()+", SELLER = "+rb.getSeller());
			
			totalprice+=c.getP_price()*c.getCount();
			
			cartService.addToRecord2(rb);
			

		}
		RecordList  recordList = new RecordList(rc, account, totalprice,now);
		
		cartService.addToRecordList(recordList);
		cartService.addRidCount();
		 return "cart_30/fin";
	}
	
	@GetMapping("/removeAllCart")
	public String removeAllCart(Model model) {
		cartService.deleteAll();
		 return "redirect:/products";
	}
	
	
	
	
	
	
}
