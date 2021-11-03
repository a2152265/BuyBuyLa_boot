package com.web.cart_30.controller;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.cart_30.model.BuyerAddress;
import com.web.cart_30.model.Cart;

import com.web.cart_30.service.CartService;
import com.web.member_25.model.membershipInformationBean;
import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;




@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData" ,"cart"})
public class CartController {
	CartService cartService;

	@Autowired
	public CartController(CartService cartService) {

		this.cartService = cartService;
	}


//	@GetMapping("/test")
//	public String home(
////			@ModelAttribute("loginSession") membershipInformationBean mb,
//			Model model) {
//
//		 return "product_11/products";
//		 
//	}
	
	
	
	@GetMapping("/additem")
	public String additem(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id ,Model model) {
		System.out.println("PID cc= "+id);
		String buyer=mb.getUserEmail();
		cartService.addItemByid(id,buyer);
		return "redirect:/products";
	}
	
	
	
	@GetMapping("/cart")
	public String cart(@ModelAttribute("loginSession") membershipInformationBean mb,Model model) {
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);	
		 	return "cart_30/cart2";
	}
	
	
	@GetMapping("/deletecart")
	public String deletecart(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id ,Model model) {
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);	
		cartService.deletecart(id,buyer);

		 return "redirect:/cart";
	}
	
//	@GetMapping("/add")
//	public Integer add(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id,Model model) {
//		System.out.println("starttttt===============");
//		String buyer=mb.getUserEmail();	
//		List<Cart> cart = cartService.addToRecord(buyer);
//		model.addAttribute("cart", cart);
//		int cnt =cartService.add(id,buyer);	
//
//		System.out.println("===============endddddddddddd");
//		System.out.println(cnt);
//		 return cnt;
//	}
//	
	@GetMapping("/add")
	public String add(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id,Model model) {
		System.out.println("starttttt===============");
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);
		int cnt =cartService.add(id,buyer);	

		System.out.println("===============endddddddddddd");
		System.out.println(cnt);
		 return "redirect:/cart";
	}
	
	@GetMapping("/sub")
	public String sub(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id,Model model) {
		System.out.println("starttttt===============");
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);
		cartService.sub(id,buyer);	
		System.out.println("===============endddddddddddd");
	
		 return "redirect:/cart";
	}
	
	@GetMapping("/check")
	public String check(@ModelAttribute("loginSession")  membershipInformationBean mb,Model model) {
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);
	
		List<BuyerAddress> ba = cartService.selectAllBuyerAddressByBuyer(buyer);
		System.out.println("**********************");
		System.out.println(ba.size()+"////////////////////////");
		model.addAttribute("BuyerAddressList",ba);
		model.addAttribute("BuyerAddress",new BuyerAddress());
		
		 return "cart_30/check2";
	}
	
	
	@PostMapping("/check")
	public String insertAddress(@ModelAttribute("loginSession")  membershipInformationBean mb ,@ModelAttribute("BuyerAddress") BuyerAddress ba,BindingResult br,Model model) {
		String account = mb.getUserEmail();
		ba.setBuyer(account);
		cartService.insertAddress(ba);
		List<Cart> cart = cartService.addToRecord(account);
		model.addAttribute("cart", cart);
		 return "redirect:/check";
	}
	
	
	@Autowired
	JavaMailSender mailSender;
	
	
	@GetMapping("/addaddress")
	@ResponseBody
	public void addaddress(@RequestParam("address")String address, @ModelAttribute("loginSession") membershipInformationBean mb ) {
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);	
		Integer rc = cartService.getRidCount(1);
		RecordBean rb=new RecordBean();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		String now = dtf.format(LocalDateTime.now());
		double totalprice =0;
		System.out.println(address+"////////////////////");
		for(Cart c:cart) {
			
			rb.setRecord_id(rc);
			rb.setPid(c.getPid());
			rb.setP_name(c.getP_name());
			rb.setP_price(c.getP_price());
			rb.setPcount(c.getCount());
			rb.setBuyer(buyer);
			rb.setSeller(c.getSeller());
			rb.setBuy_time(now);
			rb.setTransport_status("待出貨");
			rb.setCategory(c.getCategory());
			rb.setBuyeraddress(address);
			System.out.println("****************************************************");
			System.out.println("***"+rb.getId()+"RID = "+rb.getRecord_id()+", PID = "+rb.getPid()+", NAME = "
					+ rb.getP_name()+", PRICE = "+rb.getP_price()+", CNT = "+rb.getPcount()
					+", BUYER = "+rb.getBuyer()+", SELLER = "+rb.getSeller());
			System.out.println(address+"////////////////////");
			System.out.println(rb.getBuyeraddress());
			totalprice+=c.getP_price()*c.getCount();
			
			cartService.addToRecord2(rb);
			

		}
		RecordList  recordList = new RecordList(rc, buyer, totalprice,now,address,"未付款","待出貨");
		SimpleMailMessage message =new SimpleMailMessage();
		message.setTo(buyer);
		message.setSubject("BuyBuyLa Verification 最懂你的購物商城");
		message.setText("您在BuyBuyLA 線上商城購買成功");
		
		mailSender.send(message); 
		System.out.println("------------------已寄出------------------ --->");
		cartService.addToRecordList(recordList);
		cartService.addRidCount();
		
		
	}
	
	
	
	
	
	@GetMapping("/fin")
	public String fin(@ModelAttribute("address") String address ,@ModelAttribute("loginSession") membershipInformationBean mb ,Model model) {
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);	
		 return "cart_30/fin2";
	}
	
	
	@GetMapping("/removeAllCart")
	public String removeAllCart(@ModelAttribute("loginSession") membershipInformationBean mb,Model model) {
		String buyer = mb.getUserEmail();
		System.out.println("start**************");
		cartService.deleteAll(buyer);
		System.out.println("end**************");
		 return "redirect:/products";
	}
	


	// 使用者地址管理
		@GetMapping("/addressLsit")
		public String addressLsit(@ModelAttribute("loginSession") membershipInformationBean mb,Model model) {
			String buyer = mb.getUserEmail();
			List<BuyerAddress> address = cartService.selectAllBuyerAddressByBuyer(buyer);
			model.addAttribute("buyer",buyer);
			model.addAttribute("address",address);
			return "cart_30/address/addressList";
		}
		
		@GetMapping("/deleteAddress")
		public String deleteAddress(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam int aid,Model model) {
			cartService.deleteAddress(aid);
			String buyer = mb.getUserEmail();
			List<BuyerAddress> address = cartService.selectAllBuyerAddressByBuyer(buyer);
			model.addAttribute("buyer",buyer);
			model.addAttribute("address",address);

			return "cart_30/address/addressList";
		}
	
}
