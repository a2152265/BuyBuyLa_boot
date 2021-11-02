package com.web.forum_32.controller;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.web.forum_32.model.ForumBean;
import com.web.forum_32.service.IForumService;

@Controller
public class ForumController {

	IForumService forumService;
	ServletContext servletContext;

	@Autowired
	public ForumController(IForumService forumService, ServletContext servletContext) {
		this.forumService = forumService;
		this.servletContext = servletContext;
	}

	/**************************** 頁面展示 ****************************/
	
	public void allArticles(Model model,Integer pages) {
		List<ForumBean> getAllArticles = forumService.getAllArticles(pages, 5);
		model.addAttribute("getAllArticles", getAllArticles);
		model.addAttribute("Articles", getAllArticles);
		model.addAttribute("forumSize", forumService.getAll());
		model.addAttribute("addForumBean", new ForumBean());
	}
	
	// 首頁
	@GetMapping("/forum")
	public String forum(Model model,
			@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		model.addAttribute("page",1);
		model.addAttribute("rightPage",2);
		allArticles(model,0);
		Size(model);
		return "forum_32/forum";
	}
	// 分頁
	@GetMapping({"/forumPage","/forumPageLeft","/forumPageRight"})
	public String forumPage(
			@RequestParam("page") Integer page,
			Model model) {
		Integer leftPage=page;
		Integer rightPage=page;
		
		if(leftPage-1==0) {
			model.addAttribute("leftPage",page);
		}else {
			model.addAttribute("leftPage",leftPage-1);
		}
		if(rightPage>forumService.getAll().size()/5) {
			model.addAttribute("rightPage",rightPage);
		}else {
			model.addAttribute("rightPage",rightPage+1);
		}
		allArticles(model,page-1);
		Size(model);
		model.addAttribute("page",page);
		return "forum_32/forum";
	}

	// 首頁 標籤:官方最新公告
	@GetMapping("/announcement")
	public String announcement(Model model) {
		List<ForumBean> announcementList = forumService.getAllByTag("", 0, 999);
		System.out.println("test="+announcementList.size());
		if (!announcementList.isEmpty()) {
			model.addAttribute("Articles", announcementList);
			model.addAttribute("addForumBean", new ForumBean());
		} else {
			allArticles(model,0);
		}
		
		Size(model);
		return "forum_32/forum";
	}
	// 首頁 標籤:社團精選話題
//	@GetMapping("/featured")
//	public String featured(Model model) {
//		List<ForumBean> featuredList = forumService.getAllContentsByFeatured();
//		if (!featuredList.isEmpty()) {
//			model.addAttribute("Articles", featuredList);
//			model.addAttribute("addForumBean", new ForumBean());
//		} else {
//			allArticles(model,0);
//		}
//		
//		Size(model);
//		return "forum_32/forum";
//	}

	// 首頁 標籤:新手賣家發問
//	@GetMapping("/noviceSeller")
//	public String noviceSeller(Model model) {
//		List<ForumBean> noviceSellerList = forumService.getAllContentsByNoviceSeller();
//		if (!noviceSellerList.isEmpty()) {
//			model.addAttribute("Articles", noviceSellerList);
//		} 
//		model.addAttribute("addForumBean", new ForumBean());
//		
//		Size(model);
//		return "forum_32/forum";
//	}

	// 首頁 標籤:賣家閒聊討論
//	@GetMapping("/sellerChat")
//	public String sellerChat(Model model) {
//		List<ForumBean> sellerChatList = forumService.getAllContentsBySellerChat();
//		if (!sellerChatList.isEmpty()) {
//			model.addAttribute("Articles", sellerChatList);
//		}
//		model.addAttribute("addForumBean", new ForumBean());
//		
//		Size(model);
//		return "forum_32/forum";
//	}
	
	public void Size(Model model) {
//		model.addAttribute("announcementSize",forumService.getAllContentsByAnnouncement().size());
//		model.addAttribute("noviceSellerSize",forumService.getAllContentsByNoviceSeller().size());
//		model.addAttribute("sellerChatSize",forumService.getAllContentsBySellerChat().size());
	}
	
	
					/* 文章CRUD */
	
	// 新增 提交表單
	@PostMapping({ "/forum", "/noviceSeller", "/sellerChat", "/announcement" })
	public String processAddNewFourmForm(Model model,
			@ModelAttribute("addForumBean") ForumBean fb, 
			BindingResult result) {
			fb.setMessageQty(0);
			fb.setViewQty(0);
			forumService.addOrEdit(fb);
		return "redirect:/detailed?id="+fb.getId();
	}
	
					/* CRUD結束 */

	/************************** 頁面展示結束 ***************************/

}
