package com.web.cart_30.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.cart_30.service.CartService;
import com.web.member_25.model.membershipInformationBean;
import com.web.record_30.model.RecordList;

@Controller
@SessionAttributes("recordID")
public class EmailController {

	
	CartService cartService;

	@Autowired
	public EmailController(CartService cartService) {
	
		this.cartService = cartService;
	}
	
	
	
	
	@Autowired
	JavaMailSender mailSender;
	
	//綠界做完導回首頁+寄信
		@GetMapping("/fin")
		public String fin(@ModelAttribute("recordID") String recordId ,SessionStatus sessionStatus ,Model model) {
			
			RecordList record=cartService.findRecordByRecordId(recordId);
			String buyer=record.getBuyer();	
			cartService.deleteAll(buyer);
			String buyTime = record.getBuy_time();
			double totalprice = record.getTotalprice();
			
			
			
//			SimpleMailMessage message =new SimpleMailMessage();
//			message.setTo(buyer);
//			message.setSubject("BuyBuyLa Verification 最懂你的購物商城");
//			message.setText("您已於"+buyTime+"，完成訂單編號為"+recordId+"之交易，消費金額為"+totalprice+"元\n"
//			+"謝謝您的惠顧，祝您有愉快的一天 :)");
//			
//			mailSender.send(message); 
			System.out.println("------------------已寄出------------------ --->");
			sessionStatus.setComplete();
			 return "cart_30/buysuccess";
		}
}
