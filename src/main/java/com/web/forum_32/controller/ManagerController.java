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
public class ManagerController {

	IForumService forumService;
	ServletContext servletContext;

	@Autowired
	public ManagerController(IForumService forumService, ServletContext servletContext) {
		this.forumService = forumService;
		this.servletContext = servletContext;
	}
	
	/***************************** 後台管理 *****************************/

	// 後台頁面展示
	@GetMapping("/manager/forum")
	public String managerForumView(Model model) {
		List<ForumBean> allList = forumService.getAll();
		model.addAttribute("content", allList);
		model.addAttribute("managerAddForumContentBean", new ForumBean());
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
			@ModelAttribute("managerEditForumContentBean") ForumBean editBean,
			Model model) {
		editBean = forumService.getContentById(id);
		ForumBean data = new ForumBean(editBean.getId(),editBean.getTag(),editBean.getTitle(),
				editBean.getContent(),editBean.getDate(),editBean.getPicId(),
				editBean.getUserName(),editBean.getUserEmail(),editBean.getUserNickname(),
				editBean.getIdentification(),editBean.getMessageQty(),editBean.getViewQty(),editBean.getTopArticle());
		return data;
	}

	// 編輯>提交表單
	@PostMapping("/manager/forum")
	public String managerEdit(Model model, 
			@ModelAttribute("updateManager") ForumBean updfb, 
			BindingResult result) {
		forumService.addOrEdit(updfb);
		return "redirect:/manager/forum";
	}

	/************************** 後臺管理結束 ***************************/
}
