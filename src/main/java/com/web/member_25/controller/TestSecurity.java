package com.web.member_25.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.member_25.service.MemberService;

@Controller
@RequestMapping("/test")
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData","changePwd" })
public class TestSecurity {
	
	MemberService memberService;
	ServletContext servletContext; // get pic用

	@Autowired
	public TestSecurity(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	}
	
	
	@GetMapping("add")
	public String hello() {
		return "hello";
	}

}
