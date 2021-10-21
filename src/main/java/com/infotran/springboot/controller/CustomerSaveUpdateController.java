package com.infotran.springboot.controller;  //本類別所屬套件會自動掃描 所以自己不用定義去哪掃

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.infotran.springboot.model.CustomerBean;
import com.infotran.springboot.service.CustomerService;
import com.infotran.springboot.validate.CustomerValidator;

@Controller
public class CustomerSaveUpdateController {

	CustomerService customerService;

	@Autowired
	public CustomerSaveUpdateController(CustomerService customerService) {
		this.customerService = customerService;
	}

	@GetMapping("/Customers")
	 public String sendEmptyForm() { 
	  return "customer_v1/InsertCustomerForm";
	 }

	@GetMapping("customer_v1/insertCustomer")
	public String sendEmptyForm(Model model) {
		
//		model.addAttribute("customerBean",new CustomerBean());
		return "customer_v1/InsertCustomerForm";
	}
	
	
	@PostMapping("/customer_v1/customers")
	public String save(@ModelAttribute CustomerBean bean,
			BindingResult bindingResult) {
		new CustomerValidator().validate(bean, bindingResult);
		System.out.println("修改會員(PUT, 11-05): " + bean);
		if (bindingResult.hasErrors()) {
			System.out.println("======================");
			List<ObjectError> list = bindingResult.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			System.out.println("======================");
			return "customer_v1/InsertCustomerForm";
		}
		customerService.save(bean);
		return "redirect:/customer_v1/ShowCustomers";
	}
	
	@ModelAttribute
	public CustomerBean m1() {
		CustomerBean bean=new CustomerBean(); 
		bean.setBirthday(Date.valueOf("1997-04-26"));
		bean.setName("cathy");
		bean.setTotalPayment(72100.0);
		bean.setPassword("35cathc");
		bean.setPassword1("35cathc");
		int num = (int)(Math.random()*50000000)+1000;
		System.out.println("num========>"+num);
		bean.setEmail("Ca"+num+"@gmail.com");
		System.out.println("gmail------------->"+bean.getEmail());
		 bean.setLastPostTime(new java.util.Date(num));
		 System.out.println("gmail------------->"+bean.getLastPostTime());
		return bean;
	}
	
	
	
	
}
