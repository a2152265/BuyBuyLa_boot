package com.web.cart_30.controller;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.annotation.security.PermitAll;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.cart_30.model.BuyerAddress;
import com.web.cart_30.model.Cart;
import com.web.cart_30.service.CartService;
import com.web.member_25.model.membershipInformationBean;
import com.web.product_11.service.ProductService;
import com.web.record_30.model.RecordBean;
import com.web.record_30.model.RecordList;
import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;




@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData" ,"cart","OrderItemCount","count","recordID"})
public class CartController {

	CartService cartService;
	ProductService productService;
	
	@Autowired
	public CartController(CartService cartService, ProductService productService) {
		this.cartService = cartService;
		this.productService = productService;
	}




//加入購物車	
	@GetMapping("/additem")
	public String additem(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id ,Model model) {
		System.out.println("PID cc= "+id);
		String buyer=mb.getUserEmail();
		cartService.addItemByid(id,buyer);
		model.addAttribute("OrderItemCount",buyer);
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);	
		//從購物車找該買家總購買商品數
			

		return "redirect:/";
	}
	
	
//單一商品加入購物車	
	@GetMapping("/additemFromproduct")
	public String additemFromproduct(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer qty,@RequestParam Integer id ,Model model) {
		System.out.println("PID cc= "+id+"qty========"+qty);
		String buyer=mb.getUserEmail();
		cartService.addItemByidAndQty(id,buyer,qty);
//		model.addAttribute("OrderItemCount",buyer);
//		List<Cart> cart = cartService.addToRecord(buyer);
//		model.addAttribute("cart", cart);	
//		
		return "redirect:/";
	}
	
	
	//到購物車
	@GetMapping("/cart")
	public String cart(@ModelAttribute("loginSession") membershipInformationBean mb,Model model) {
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);	
		model.addAttribute("OrderItemCount",buyer);
		 	return "cart_30/cart2";
	}
	
	//在購物車刪商品
	@GetMapping("/deletecart")
	public String deletecart(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id ,Model model) {
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);	
		cartService.deletecart(id,buyer);

		 return "redirect:/cart";
	}
	
	
	//+
	@GetMapping("/add")
	@ResponseBody
	public Integer add(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id,Model model) {
		System.out.println("starttttt===============");
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);
		int cnt =cartService.add(id,buyer);	

		System.out.println("===============endddddddddddd");
		System.out.println(cnt);
		 return cnt;
	}
	
	
	
	
	//-
	@GetMapping("/sub")
	@ResponseBody
	public String sub(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam Integer id,Model model) {
		System.out.println("starttttt===============");
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		model.addAttribute("cart", cart);
		cartService.sub(id,buyer);	
		System.out.println("===============endddddddddddd");
	
		 return "redirect:/cart";
	}
	
	@GetMapping("/getDiscount")
	@ResponseBody
	public int getDiscount(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam String discountCode,Model model) {
		System.out.println("starttttt===============");
		String buyer=mb.getUserEmail();	
		
		//重活動資料庫找折扣碼對應之折扣
		
		int discount = cartService.getDiscount(discountCode);
		
		List<Cart> cart = cartService.addToRecord(buyer);
		
		boolean exist =	cartService.discountRepeat(buyer);
		System.out.println(exist+"999999999");
		
		
		if(exist==true){
			int qq =8/0;
			return qq ;
		}
	
		cartService.addDiscountToCart(discount,buyer);
		
		
		
		System.out.println(cart.get(0).getDiscount()+"===============endddddddddddd");
		model.addAttribute("cart", cart);
		
		System.out.println("===============endddddddddddd");
	
		 return discount;
	}
	
	

	
	//到checkout畫面
	@GetMapping("/check")
	public String check(@ModelAttribute("loginSession")  membershipInformationBean mb,Model model) {
		String buyer=mb.getUserEmail();	
		List<Cart> cart = cartService.addToRecord(buyer);
		
		model.addAttribute("cart", cart);
		
		int discount=cart.get(0).getDiscount();
		if(discount<0) {
			discount=0;
		}
		model.addAttribute("discount", discount);
		List<BuyerAddress> ba = cartService.selectAllBuyerAddressByBuyer(buyer);
		System.out.println("**********************");
		System.out.println(ba.size()+"////////////////////////");
		model.addAttribute("BuyerAddressList",ba);
		model.addAttribute("BuyerAddress",new BuyerAddress());
		
		 return "cart_30/checkout";
	}
	
	

	

	
	

//確認付費，導到綠界
	@PostMapping("/check")
	@ResponseBody
	public String ecpay(@ModelAttribute("BuyerAddress") BuyerAddress address,@ModelAttribute("loginSession") membershipInformationBean mb,HttpServletRequest request,HttpServletResponse response ,Model model) {
		String buyer=mb.getUserEmail();	
		String buyeraddress =address.getCity()+address.getCountry()+address.getAddress();
		
		
		
		

		List<Cart> cart = cartService.addToRecord(buyer);	
		
		RecordBean rb=new RecordBean();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		
		String now = dtf.format(LocalDateTime.now());
		
		String str="ATXH";
		
		
		str = str+now.substring(0,4)+now.substring(5,7)+now.substring(8,10)
		+now.substring(11,13)+now.substring(14,16)+now.substring(17,19);
		System.out.println("....................................");
		System.out.println(str);
	
		
		
		double totalprice =0;
//		System.out.println(address+"////////////////////");
		for(Cart c:cart) {
			
			rb.setRecord_id(str);
			rb.setPid(c.getProduct().getProductId());
			rb.setP_name(c.getProduct().getProductName());
			rb.setP_price(c.getProduct().getPrice()*c.getProduct().getDiscount());
			rb.setPcount(c.getCount());
			rb.setBuyer(buyer);
			rb.setSeller(c.getProduct().getSeller());
			rb.setBuy_time(now);
			rb.setTransport_status("待出貨");
			rb.setCategory(c.getProduct().getCategory());
//			rb.setBuyeraddress(address);
			System.out.println("****************************************************");
			System.out.println("***"+rb.getId()+"RID = "+rb.getRecord_id()+", PID = "+rb.getPid()+", NAME = "
					+ rb.getP_name()+", PRICE = "+rb.getP_price()+", CNT = "+rb.getPcount()
					+", BUYER = "+rb.getBuyer()+", SELLER = "+rb.getSeller());
//			System.out.println(address+"////////////////////");
			System.out.println(rb.getBuyeraddress());
			totalprice+=c.getProduct().getPrice()*c.getCount()*c.getProduct().getDiscount();
			
			
					
			cartService.addToRecord2(rb);
			int stock =c.getProduct().getStock()-rb.getPcount();
			cartService.updateStock(rb.getPid(),stock);
			
			int sales=c.getProduct().getSales()+rb.getPcount();
			productService.updateSales(c.getProduct().getProductId(), sales);
			
		}
		int discount = cart.get(0).getDiscount();	
		totalprice=totalprice-discount+60;
		System.out.println(discount+"  weqqeweqewqewqe0");
		RecordList  recordList = new RecordList(str, buyer, totalprice,now,buyeraddress,"待出貨","已付款","OK");
		
		BuyerAddress buyerinfo=new BuyerAddress();
		buyerinfo.setRecord_id(str);
		buyerinfo.setBuyer(buyer);
		buyerinfo.setBuyerName(address.getBuyerName());
		buyerinfo.setPhone(address.getPhone());
		buyerinfo.setEmail(address.getEmail());
		buyerinfo.setCountry(address.getCountry());
		buyerinfo.setCity(address.getCity());
		buyerinfo.setAddress(address.getAddress());
		buyerinfo.setPostalcode(address.getPostalcode());
		cartService.insertAddress(buyerinfo);
		
		
		//綠界	
		int totalAmount =(int) totalprice;
		String totalAmount2 =""+totalAmount;
		AllInOne all=new AllInOne("");
		AioCheckOutALL obj = new AioCheckOutALL();
		obj.setMerchantTradeNo(str);
		obj.setMerchantTradeDate(now);
		obj.setTotalAmount(totalAmount2);
		obj.setTradeDesc("BuyBuyLa Demo");
		obj.setItemName("BuyBuyLa 商品一批X1");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setClientBackURL("http://localhost:8080/BuyBuyla_boot/fin");
		String form = all.aioCheckOut(obj, null);

		model.addAttribute("recordID",str);
		
		
		
		cartService.addToRecordList(recordList);
	System.out.println("----------------buy-----done-------------------------");
		return form;
		
	}
	
	
	

	
	
//	@GetMapping("/removeAllCart")
//	public String removeAllCart(@ModelAttribute("loginSession") membershipInformationBean mb,Model model) {
//		String buyer = mb.getUserEmail();
//		System.out.println("start**************");
//		cartService.deleteAll(buyer);
//		System.out.println("end**************");
//		 return "redirect:/";
//	}
//	


//	// 使用者地址管理
//		@GetMapping("/addressLsit")
//		public String addressLsit(@ModelAttribute("loginSession") membershipInformationBean mb,Model model) {
//			String buyer = mb.getUserEmail();
//			List<BuyerAddress> address = cartService.selectAllBuyerAddressByBuyer(buyer);
//			model.addAttribute("buyer",buyer);
//			model.addAttribute("address",address);
//			return "cart_30/address/addressList";
//		}
//		
//		@GetMapping("/deleteAddress")
//		public String deleteAddress(@ModelAttribute("loginSession") membershipInformationBean mb,@RequestParam int aid,Model model) {
//			cartService.deleteAddress(aid);
//			String buyer = mb.getUserEmail();
//			List<BuyerAddress> address = cartService.selectAllBuyerAddressByBuyer(buyer);
//			model.addAttribute("buyer",buyer);
//			model.addAttribute("address",address);
//
//			return "cart_30/address/addressList";
//		}
	
}
