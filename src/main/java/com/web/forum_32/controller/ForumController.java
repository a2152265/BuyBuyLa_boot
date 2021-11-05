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
	public String forumIndex(Model model,@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		forum(model,page);
		init(model);
		return "forum_32/forum";
	}
	
	// 首頁 標籤:新手賣家發問
	@GetMapping("/noviceSeller")
	public String noviceSellerIndex(Model model,@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		noviceSeller(model,page);
		init(model);
		return "forum_32/forum";
	}
	// 首頁 標籤:賣家閒聊討論
	@GetMapping("/sellerChat")
	public String sellerChatIndex(Model model,@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		sellerChat(model,page);
		init(model);
		return "forum_32/forum";
	}
	// 首頁 標籤:官方最新公告
	@GetMapping("/announcement")
	public String announcementIndex(Model model,@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		announcement(model,page);
		init(model);
		return "forum_32/forum";
	}
	// 首頁 標籤:社團精選話題
	@GetMapping("/featured")
	public String featuredIndex(Model model,@RequestParam(required = false,value="page",defaultValue = "0") Integer page) {
		featured(model,page);
		init(model);
		return "forum_32/forum";
	}

	@GetMapping({"/Page","/PageLeft","/PageRight"})
	public String forumPage(Model model,
			@RequestParam("tag") String tag,
			@RequestParam("page") Integer page ){
		if(tag.equals("forum")) {
			forum(model,page-1);
		}else if(tag.equals("noviceSeller")) {
			noviceSeller(model,page-1);
		}else if(tag.equals("sellerChat")) {
			sellerChat(model, page-1);
		}else if(tag.equals("featured")) {
			featured(model,page-1);
		}else if (tag.equals("announcement")) {
			announcement(model,page-1);
		}
		init(model);
		if(page==1) {
			model.addAttribute("leftPage",page);
		}else {
			model.addAttribute("leftPage",page-1);
		}
		model.addAttribute("rightPage",page+1);
		model.addAttribute("page",page);
		return "forum_32/forum";
	}
	
	public void forum(Model model,Integer page) {
		List<ForumBean> getAllArticles = forumService.getAllArticlesByPage(page, 5);
		model.addAttribute("tag","forum");
		model.addAttribute("pageSize", forumService.getAll());
		model.addAttribute("Breadcrumb","所有討論");
		model.addAttribute("Articles", getAllArticles);
	}
	public void announcement(Model model,Integer page) {
		model.addAttribute("tag","announcement");
		model.addAttribute("pageSize", forumService.getAllByTag("官方最新公告"));
		model.addAttribute("Breadcrumb","官方最新公告");
		model.addAttribute("Articles", forumService.getAllByTag("官方最新公告",page,5));
	}
	public void featured(Model model,Integer page) {
		model.addAttribute("tag","featured");
		model.addAttribute("pageSize", forumService.getAllByTag("社團精選話題"));
		model.addAttribute("Breadcrumb","社團精選話題");
		model.addAttribute("Articles", forumService.getAllByTag("社團精選話題",page,5));
	}
	public void sellerChat(Model model,Integer page) {
		model.addAttribute("tag","sellerChat");
		model.addAttribute("pageSize", forumService.getAllByTag("賣家閒聊討論"));
		model.addAttribute("Breadcrumb","賣家閒聊討論");
		model.addAttribute("Articles", forumService.getAllByTag("賣家閒聊討論",page,5));
	}
	public void noviceSeller(Model model,Integer page) {
		model.addAttribute("tag","noviceSeller");
		model.addAttribute("pageSize", forumService.getAllByTag("新手賣家發問"));
		model.addAttribute("Breadcrumb","新手賣家發問");
		model.addAttribute("Articles", forumService.getAllByTag("新手賣家發問", page, 5));
	}
	
	public void init (Model model) {
		model.addAttribute("page",1);
		model.addAttribute("leftPage",1);
		model.addAttribute("rightPage",2);
		model.addAttribute("addForumBean", new ForumBean());
		model.addAttribute("allSize", forumService.getAll().size());
		model.addAttribute("announcementSize",forumService.getAllByTag("官方最新公告").size());
		model.addAttribute("featuredSize",forumService.getAllByTag("社團精選話題").size());
		model.addAttribute("noviceSellerSize",forumService.getAllByTag("新手賣家發問").size());
		model.addAttribute("sellerChatSize",forumService.getAllByTag("賣家閒聊討論").size());
	}
	
	// 熱門文章
	@GetMapping("/getHotArticles")
	@ResponseBody
	public List<ForumBean> getHotArticles(){
		return forumService.findTop4ByOrderByViewQtyDesc();
	}
	// 最新帖子
	@GetMapping("/getNewArticles")
	@ResponseBody
	public List<ForumBean> getNewArticles(){
		return forumService.findTop4ByOrderByIdDesc();
	}
	
	
					/* 文章CRUD */
	
	// 新增 提交表單
	@PostMapping("/addNewForum")
//	@PostMapping({ "/forum","featuredSize", "/noviceSeller", "/sellerChat", "/announcement" })
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
