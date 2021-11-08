package com.web.forum_32.controller;


import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.forum_32.service.IForumService;
import com.web.forum_32.service.IMessageService;

@Controller
public class MemberController {

	IForumService forumService;
	IMessageService messageService;
	ServletContext servletContext;

	@Autowired
	public MemberController(IForumService forumService, IMessageService messageService,ServletContext servletContext) {
		this.messageService=messageService;
		this.forumService = forumService;
		this.servletContext = servletContext;
	}
	
	// 使用者端管理頁面展示
	@GetMapping("/member/forum")
	public String managerForumView(Model model) {
		return "forum_32/forum-member";
	}
}
