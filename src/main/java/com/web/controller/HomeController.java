package com.web.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.celebrations_36.model.Campaign;
import com.web.celebrations_36.service.CampaignService;
import com.web.product_11.model.Product;
import com.web.product_11.service.ProductService;

@Controller
public class HomeController {
	
	ProductService productservice;
	CampaignService campaignService;
	ServletContext servletContext;

	@Autowired
	public HomeController(ProductService productservice, CampaignService campaignService,
			ServletContext servletContext) {
		this.productservice = productservice;
		this.campaignService = campaignService;
		this.servletContext = servletContext;
	}
	


	@GetMapping("/")
	public String home0(Model model) {
		System.out.println("進入首頁La");
		System.out.println("haha");
		List<Product> beans = productservice.getAllProducts();
		System.out.println("首頁の商品列表展示中ing.....");
		model.addAttribute("products", beans);
		model.addAttribute("categoryList", productservice.getAllCategories());
		
		//首頁輪播圖
		List<Campaign> cambeans = campaignService.findAll();
		model.addAttribute("campaignss",cambeans);
		model.addAttribute("campaignsizes",cambeans.size());
		return "product_11/products";
	
	}
	
	@GetMapping("/adminHome")
	public String manageHome(Model model) {
		
		return "Home/manageHome";
		
	}
	
	
}

