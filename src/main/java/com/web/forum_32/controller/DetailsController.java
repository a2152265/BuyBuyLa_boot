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
import org.springframework.web.bind.annotation.ResponseBody;
import com.web.forum_32.model.ForumBean;
import com.web.forum_32.model.MessageBean;
import com.web.forum_32.service.IForumService;
import com.web.forum_32.service.IMessageService;

@Controller
public class DetailsController {

	IForumService forumService;
	IMessageService messageService;
	ServletContext servletContext;

	@Autowired
	public DetailsController(
			IForumService forumService,
			IMessageService messageService,
			ServletContext servletContext) {
		this.forumService = forumService;
		this.messageService = messageService;
		this.servletContext = servletContext;
	}

	/****************************  文章展示  ****************************/
	
	// Detailed
	@GetMapping("/detailed")
	public String detailed(Model model, 
			@RequestParam(value = "id", required = false) Integer id) {
		
		if (id != null) {
			ForumBean forumBean = forumService.getContentById(id);
			model.addAttribute("fb", forumBean);
		}
		List<ForumBean> allList = forumService.getAllArticles();
		ForumBean fTitle= forumService.getContentById(id);
		model.addAttribute("content", allList);
		model.addAttribute("forumId", id);
		model.addAttribute("fTitle", fTitle.getTitle());
		model.addAttribute("updateForumBean", new ForumBean());
		
		List<MessageBean> msgList = messageService.getAllMessage(id);
		model.addAttribute("msg",msgList);
		model.addAttribute("messageSize",messageService.getAllMessage(id).size());
		
		tagSize(model);
		
		return "forum_32/forum-detailed";
	}
	
	public void tagSize(Model model) {
		model.addAttribute("announcementSize",forumService.getAllContentsByAnnouncement().size());
		model.addAttribute("noviceSellerSize",forumService.getAllContentsByNoviceSeller().size());
		model.addAttribute("sellerChatSize",forumService.getAllContentsBySellerChat().size());
	}
	
	// 編輯
	@PostMapping("/detailed")
	public String processUpdNewFourmForm(@RequestParam("id") Integer id,
			@ModelAttribute("updateForumBean") ForumBean updfb) {
		if(updfb.getContent()!=null) {
		forumService.addOrEdit(updfb);
		}
		return "redirect:/detailed?id="+id;
	}
	
	// 編輯
	@GetMapping(value = "/editURL")
	@ResponseBody
	public ForumBean editUrl(@RequestParam("id") Integer id, 
			@ModelAttribute("updateForumBean") ForumBean updfb,
			Model model) {
		updfb = forumService.getContentById(id);
		ForumBean fb = new ForumBean(updfb.getId(),updfb.getTag(),updfb.getTitle(),
				updfb.getContent(),updfb.getDate(),updfb.getPicId(),
				updfb.getUserName(),updfb.getUserEmail(),updfb.getUserNickname(),
				updfb.getIdentification(),updfb.getMessageQty());
		
		return fb;
	}

	// 刪除
	@GetMapping("/delete32")
	public String deleteContentById(@RequestParam("id") Integer id, Model model) {
		forumService.delete(id);
		return "redirect:/forum";
	}
	
	// 發表評論
	@PostMapping(value = "/addMessage")
	@ResponseBody
	public void addMessage(MessageBean mb) {
		Integer forumId = mb.getMessageForumId();
		ForumBean fb= forumService.getContentById(forumId);
		fb.setMessageQty(messageService.getAllMessage(forumId).size()+1);
		forumService.addOrEdit(fb);
		messageService.addMessage(mb);
	}

}
