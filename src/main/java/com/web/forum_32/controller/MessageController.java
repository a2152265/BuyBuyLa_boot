package com.web.forum_32.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.forum_32.model.ForumBean;
import com.web.forum_32.model.MessageBean;
import com.web.forum_32.service.IForumService;
import com.web.forum_32.service.IMessageService;

@Controller
public class MessageController {

	IForumService forumService;
	IMessageService messageService;
	ServletContext servletContext;

	@Autowired
	public MessageController(IMessageService messageService, IForumService forumService,
			ServletContext servletContext) {
		this.forumService = forumService;
		this.messageService = messageService;
		this.servletContext = servletContext;
	}

	// 詳細
	@GetMapping("/detailed")
	public String detailed(Model model, @RequestParam(value = "id", required = false) Integer id,
			@ModelAttribute("messageBean") MessageBean messageBean) {
		if (id != null) {
			ForumBean forumBean = forumService.getContentById(id);
			model.addAttribute("fb", forumBean);
		}
		
//		List<MessageBean> messageList = messageService.getAllMessage();
		List<MessageBean> messageList = messageService.getAllMessageById(id);
		model.addAttribute("msg",messageList);
		
		model.addAttribute("forumId", id);
		model.addAttribute("messageBean", messageBean);
		model.addAttribute("updateForumBean", new ForumBean());
		return "forum_32/forum-detailed";
	}

	// 編輯
	@PostMapping("/detailed")
	public String processUpdNewFourmForm(@RequestParam(value = "id", required = false) Integer id,
			@ModelAttribute("updateForumBean") ForumBean updfb,
			@ModelAttribute("messageBean") MessageBean messageBean) {
		messageService.addMessageContent(messageBean);
		return "redirect:/detailed?id="+id;
	}

}
