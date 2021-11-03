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
	public void pageInit (Model model) {
		model.addAttribute("page",1);
		model.addAttribute("leftPage",1);
		model.addAttribute("rightPage",2);
	}
	
	// 首頁
	@GetMapping("/forum")
	public String forum(Model model,
			@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		pageInit(model);
		allArticles(model,0);
		tagSize(model);
		model.addAttribute("Breadcrumb","所有討論");
		return "forum_32/forum";
	}
	public void allArticles(Model model,Integer pages) {
		List<ForumBean> getAllArticles = forumService.getAllArticles(pages, 5);
		model.addAttribute("getAllArticles", getAllArticles);
		model.addAttribute("Articles", getAllArticles);
		model.addAttribute("tagFeatured", forumService.getAllByTag("社團精選話題"));
		model.addAttribute("getAll", forumService.getAll());
		model.addAttribute("getAllOrderByIdDesc", forumService.getAllOrderByIdDesc());
		model.addAttribute("addForumBean", new ForumBean());
		model.addAttribute("getAllHot",forumService.findByOrderByViewQtyDesc());
		
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
		tagSize(model);
		model.addAttribute("page",page);
		model.addAttribute("Breadcrumb","所有討論");
		return "forum_32/forum";
	}

	// 首頁 標籤:官方最新公告
	@GetMapping("/announcement")
	public String announcement(Model model,
			@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		List<ForumBean> announcementList = forumService.getAllByTag("官方最新公告", 0, 5);
		if (!announcementList.isEmpty()) {
			pageInit(model);
			model.addAttribute("getAll", forumService.getAllByTag("官方最新公告"));
			model.addAttribute("Articles", announcementList);
			model.addAttribute("addForumBean", new ForumBean());
			model.addAttribute("Breadcrumb","官方最新公告");
			model.addAttribute("getAllOrderByIdDesc", forumService.getAllOrderByIdDesc());
		} else {
			allArticles(model,0);
		}
		tagSize(model);
		return "forum_32/forum";
	}
	// 首頁 標籤:社團精選話題
	@GetMapping("/featured")
	public String featured(Model model,
			@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		List<ForumBean> announcementList = forumService.getAllByTag("社團精選話題", 0, 5);
		if (!announcementList.isEmpty()) {
			pageInit(model);
			model.addAttribute("getAll", forumService.getAllByTag("社團精選話題"));
			model.addAttribute("Articles", announcementList);
			model.addAttribute("addForumBean", new ForumBean());
			model.addAttribute("Breadcrumb","社團精選話題");
			model.addAttribute("getAllOrderByIdDesc", forumService.getAllOrderByIdDesc());
		} else {
			model.addAttribute("tagFeatured", forumService.getAllByTag("社團精選話題"));
			model.addAttribute("addForumBean", new ForumBean());
			model.addAttribute("getAll", forumService.getAll());
		}
		tagSize(model);
		return "forum_32/forum";
	}
	// 首頁 標籤:新手賣家發問
	@GetMapping("/noviceSeller")
	public String noviceSeller(Model model,
			@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		List<ForumBean> announcementList = forumService.getAllByTag("新手賣家發問", 0, 5);
		if (!announcementList.isEmpty()) {
			pageInit(model);
			model.addAttribute("getAll", forumService.getAllByTag("新手賣家發問"));
			model.addAttribute("Articles", announcementList);
			model.addAttribute("addForumBean", new ForumBean());
			model.addAttribute("getAllOrderByIdDesc", forumService.getAllOrderByIdDesc());
			model.addAttribute("Breadcrumb","新手賣家發問");
		} else {
			allArticles(model,0);
		}
		tagSize(model);
		return "forum_32/forum";
	}
	// 首頁 標籤:賣家閒聊討論
	@GetMapping("/sellerChat")
	public String sellerChat(Model model,
			@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		List<ForumBean> announcementList = forumService.getAllByTag("賣家閒聊討論", 0, 5);
		if (!announcementList.isEmpty()) {
			pageInit(model);
			model.addAttribute("getAll", forumService.getAllByTag("賣家閒聊討論"));
			model.addAttribute("Articles", announcementList);
			model.addAttribute("addForumBean", new ForumBean());
			model.addAttribute("Breadcrumb","賣家閒聊討論");
			model.addAttribute("getAllOrderByIdDesc", forumService.getAllOrderByIdDesc());
		} else {
			allArticles(model,0);
		}
		tagSize(model);
		return "forum_32/forum";
	}
	
	public void tagSize(Model model) {
		model.addAttribute("allSize", forumService.getAll().size());
		model.addAttribute("announcementSize",forumService.getAllByTag("官方最新公告").size());
		model.addAttribute("featuredSize",forumService.getAllByTag("社團精選話題").size());
		model.addAttribute("noviceSellerSize",forumService.getAllByTag("新手賣家發問").size());
		model.addAttribute("sellerChatSize",forumService.getAllByTag("賣家閒聊討論").size());
	}
	
	
					/* 文章CRUD */
	
	// 新增 提交表單
	@PostMapping({ "/forum","featuredSize", "/noviceSeller", "/sellerChat", "/announcement" })
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
