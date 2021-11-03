package com.web.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.web.product_11.model.Product;
import com.web.product_11.service.ProductCommentService;
import com.web.product_11.service.ProductService;

@Controller
@SessionAttributes({ "loginSession","cart"})
public class HomeController {
	
	ProductService productservice;
	ProductCommentService productCommentService;
	CampaignService campaignService;
	ServletContext servletContext;
	CartService cartService;
	IForumService forumService;
	
	
	@Autowired
	public HomeController(ProductService productservice, ProductCommentService productCommentService,
			CampaignService campaignService, ServletContext servletContext, CartService cartService,
			IForumService forumService) {
		this.productservice = productservice;
		this.productCommentService = productCommentService;
		this.campaignService = campaignService;
		this.servletContext = servletContext;
		this.cartService = cartService;
		this.forumService = forumService;
	}
	


	@GetMapping("/")
	public String home0(Model model) {
		System.out.println("進入首頁La");
		System.out.println("haha");
		List<Product> allProduct = productservice.getAllProducts();
		System.out.println("首頁の商品列表展示中ing.....");
		model.addAttribute("products", allProduct);
		model.addAttribute("categoryList", productservice.getAllCategories());
		
		//商品顯示(依照商品上傳時間、上架顯示)
		List<Product> ascProduct = productservice.productOrderByInsertTime();
		model.addAttribute("ascProduct", ascProduct);
		
		//首頁輪播圖
		List<Campaign> cambeans = campaignService.findAll();
		model.addAttribute("campaignss",cambeans);
		model.addAttribute("campaignsizes",cambeans.size());
		
		//討論區-官方最新公告
		List<ForumBean> announcementList = forumService.getAllContentsByAnnouncement();
		model.addAttribute("announcementList",announcementList);
		
		
		return "index";
		
		
	
	}
	



	@GetMapping("/adminHome")
	public String manageHome(Model model) {
		
		return "Home/manageHome";
		
	}
	
	
}

