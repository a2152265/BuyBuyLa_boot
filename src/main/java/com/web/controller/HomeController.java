package com.web.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.product_11.model.Product;
import com.web.product_11.service.ProductService;

@Controller
public class HomeController {
	
	ProductService productservice;

	ServletContext servletContext;

	@Autowired
	public HomeController(ProductService productservice, ServletContext servletContext) {
		this.productservice = productservice;
		this.servletContext = servletContext;
	}


	@GetMapping("/")
	public String home0(Model model) {
		System.out.println("進入首頁La");
		List<Product> beans = productservice.getAllProducts();
		System.out.println("首頁の商品列表展示中ing.....");
		model.addAttribute("products", beans);
		model.addAttribute("categoryList", productservice.getAllCategories());
		return "product_11/products";
	
	}
	
	@GetMapping("/adminHome")
	public String manageHome(Model model) {
		
		return "Home/manageHome";
		
	}
	
	
}

