package com.infotran.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.infotran.springboot.model.CustomerBean;
import com.infotran.springboot.service.CustomerService;

@Controller
public class CustomerController {
	CustomerService customerService;

	@Autowired
	public CustomerController(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	
	@GetMapping("customer_v1/ShowCustomers")
	public String showCustomer(
			Model model) {		
		List<CustomerBean> customerBeanList= customerService.getCustomers();
		model.addAttribute(customerBeanList);
		return "customer_v1/ShowCustomers";		
	}

}
