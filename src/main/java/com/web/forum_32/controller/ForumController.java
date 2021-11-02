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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	
	// 首頁
	@GetMapping("/forum")
	public String forum(Model model) {
		List<ForumBean> allList = forumService.getAllArticles();
		model.addAttribute("content", allList);
		model.addAttribute("addForumBean", new ForumBean());

		Size(model);

		return "forum_32/forum";
	}

	// 首頁 標籤:官方最新公告
	@GetMapping("/announcement")
	public String announcement(Model model) {
		List<ForumBean> announcementList = forumService.getAllContentsByAnnouncement();
		if (!announcementList.isEmpty()) {
			model.addAttribute("content", announcementList);
		} else {
			List<ForumBean> allList = forumService.getAllArticles();
			model.addAttribute("content", allList);
		}
		model.addAttribute("addForumBean", new ForumBean());
		
		Size(model);
		return "forum_32/forum";
	}

	// 首頁 標籤:新手賣家發問
	@GetMapping("/noviceSeller")
	public String noviceSeller(Model model) {
		List<ForumBean> noviceSellerList = forumService.getAllContentsByNoviceSeller();
		if (!noviceSellerList.isEmpty()) {
			model.addAttribute("content", noviceSellerList);
		} else {
			List<ForumBean> allList = forumService.getAllArticles();
			model.addAttribute("content", allList);
		}
		model.addAttribute("addForumBean", new ForumBean());
		
		Size(model);
		return "forum_32/forum";
	}

	// 首頁 標籤:賣家閒聊討論
	@GetMapping("/sellerChat")
	public String sellerChat(Model model) {
		List<ForumBean> sellerChatList = forumService.getAllContentsBySellerChat();
		if (!sellerChatList.isEmpty()) {
			model.addAttribute("content", sellerChatList);
		} else {
			List<ForumBean> allList = forumService.getAllArticles();
			model.addAttribute("content", allList);
		}
		model.addAttribute("addForumBean", new ForumBean());
		
		Size(model);
		return "forum_32/forum";
	}
	
	public void Size(Model model) {
		model.addAttribute("announcementSize",forumService.getAllContentsByAnnouncement().size());
		model.addAttribute("noviceSellerSize",forumService.getAllContentsByNoviceSeller().size());
		model.addAttribute("sellerChatSize",forumService.getAllContentsBySellerChat().size());
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

	/***************************** 後台管理 *****************************/

	// 後台頁面展示
	@GetMapping("/manager/forum")
	public String managerForumView(Model model) {
		List<ForumBean> allList = forumService.getAllArticles();
		model.addAttribute("content", allList);
		model.addAttribute("managerEditForumContentBean", new ForumBean());
		return "forum_32/forum-manager";
	}

	// 刪除
	@GetMapping("/manager/delete32")
	public String deleteById(
			@RequestParam("id") Integer id, 
			Model model) {
		forumService.delete(id);
		return "redirect:/manager/forum";
	}

	// 編輯
	@GetMapping(value = "/manager/editManager")
	@ResponseBody
	public ForumBean managerEdit(
			@RequestParam("id") Integer id, 
			@ModelAttribute("managerEditForumContentBean") ForumBean updfb,
			Model model) {
		updfb = forumService.getContentById(id);
		ForumBean fb = new ForumBean(updfb.getId(),updfb.getTag(),updfb.getTitle(),
				updfb.getContent(),updfb.getDate(),updfb.getPicId(),
				updfb.getUserName(),updfb.getUserEmail(),updfb.getUserNickname(),
				updfb.getIdentification(),updfb.getMessageQty(),updfb.getViewQty());
		return fb;
	}

	// 編輯>提交表單
	@PostMapping("/manager/forum")
	public String managerEdit(Model model, @ModelAttribute("updateManager") ForumBean updfb, BindingResult result) {
		forumService.addOrEdit(updfb);
		return "redirect:/manager/forum";
	}

	/************************** 後臺管理結束 ***************************/



}
