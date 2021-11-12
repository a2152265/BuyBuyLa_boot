package com.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.cart_30.model.Cart;
import com.web.cart_30.service.CartService;
import com.web.celebrations_36.model.Campaign;
import com.web.celebrations_36.service.CampaignService;
import com.web.forum_32.model.ForumBean;
import com.web.forum_32.service.IForumService;
import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;
import com.web.product_11.model.Product;
import com.web.product_11.service.ProductCommentService;
import com.web.product_11.service.ProductService;

@Controller
@SessionAttributes({ "loginSession","cart","memberUiDefault","managerSession","OrderItemCount","count"})
public class HomeController {
	
	ProductService productservice;
	ProductCommentService productCommentService;
	CampaignService campaignService;
	ServletContext servletContext;
	CartService cartService;
	IForumService forumService;
	
	//member
	MemberService memberService;
	
	
	@Autowired
	public HomeController(ProductService productservice, ProductCommentService productCommentService,
			CampaignService campaignService, ServletContext servletContext, CartService cartService,
			IForumService forumService,MemberService memberService) {
		this.productservice = productservice;
		this.productCommentService = productCommentService;
		this.campaignService = campaignService;
		this.servletContext = servletContext;
		this.cartService = cartService;
		this.forumService = forumService;
		this.memberService=memberService;
	}
	



	@GetMapping({"/","index"})
	public String home0(@ModelAttribute("OrderItemCount") String buyer,
			Authentication authentication,
			Model model) throws ParseException {
		System.out.println("進入首頁La");
		System.out.println("haha");
		List<Product> allProduct = productservice.getAllProducts();
		System.out.println("首頁の商品列表展示中ing.....");
		model.addAttribute("products", allProduct);
		model.addAttribute("categoryList", productservice.getAllCategories());
		
		//商品顯示(依銷售量、上架顯示)
		
		
		//商品顯示(依照商品上傳時間、上架顯示)
		List<Product> ascProduct = productservice.productOrderByInsertTime();
		model.addAttribute("descProduct", ascProduct);
		
		//首頁輪播圖
		List<Campaign> campaigns =campaignService.findAll();
		Long timeStamp = System.currentTimeMillis();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
		String sd = sdf.format(new Date(Long.parseLong(String.valueOf(timeStamp))));
		Date currentDate = sdf.parse(sd);
		Date expiryDate;
		for (int i = 0; i < campaigns.size(); i++) {
		    
//			f=sd.compareTo(list.get(i).getExpiryDate());
			expiryDate = sdf.parse(campaigns.get(i).getDate1() + " " + "00:00:00");

			if (currentDate.after(expiryDate)) {
//			System.out.println(sdf.parse(list.get(i).getExpiryDate()+" "+ "00:00:00"));
			campaignService.updateCampaignstatus("已結束",campaigns.get(i).getId());
//			productservice.updateProductDiscount(1.0, "寵物");
			}
			
//			if (currentDate.before(expiryDate)||currentDate.equals(expiryDate)) {
////				System.out.println(sdf.parse(list.get(i).getExpiryDate()+" "+ "00:00:00"));
//				campaignService.updateCampaignstatus("進行中",campaigns.get(i).getId());
//
//				productservice.updateProductDiscount(0.8, "寵物");
//				}
			
			}
		
		
		
		String campaignStatus="進行中";
		List<Campaign> cambeans = campaignService.getCampaignsByCampaignstatus(campaignStatus);
		model.addAttribute("campaignss",cambeans);
		model.addAttribute("campaignsizes",cambeans.size());
		
		//登入狀態
		try {
			if (authentication.getName()!=null) {
				System.out.println("-authentication------------>"+authentication.getName());
				membershipInformationBean mb=new membershipInformationBean();
				mb=memberService.findMemberDataAll(authentication.getName());
				model.addAttribute("loginSession",mb);
				model.addAttribute("memberUiDefault",mb);
				model.addAttribute("sellerData",mb);
				System.out.println("-----------Index--------已登入------------------>"+mb.getUserEmail());
				System.out.println("-----------Index--------已登入(BC碼)------------------>"+mb.getUserPwd());
				
				if (memberService.memberOrManager(authentication.getName())==false) {
					mb.setUserName("管理員");
					model.addAttribute("managerSession",mb);
					System.out.println("---------------這傢伙是管理員");
				}
			}
		} catch (Exception e) {
			System.out.println("-----------Index--------目前尚未登入------------------>");
		}
		System.out.println("/*/*/*//*/*/*/*/*/*/*/*/*");
		System.out.println(buyer);
		//從購物車找該買家總購買商品數
		int count=0;
		List<Cart> cart = cartService.addToRecord(buyer);
		for(Cart c:cart) {
			
		count+=c.getCount();

		}
		System.out.println(count);
		model.addAttribute("count",count);	

		
		//討論區-官方最新公告
//		List<ForumBean> announcementList = forumService.getAllContentsByAnnouncement();
//		model.addAttribute("announcementList",announcementList);
	
		return "index";
	
	}
	
	@GetMapping("/adminHome")
	public String manageHome(Model model) {	
		return "Home/manageHome";	
	}
	
	

	@ModelAttribute("OrderItemCount")
	public String setbuyer(Model model) {
		String buyer = null;
		return buyer;
	}
	
	
}

