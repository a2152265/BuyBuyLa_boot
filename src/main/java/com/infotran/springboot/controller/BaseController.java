package com.infotran.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {

	@GetMapping("/")
	public String home() {
		return "index";
	}
	
	@GetMapping("/customer_v1/index")
	public String mode06_home() {
		return "/customer_v1/index";
	}
	
	
}
