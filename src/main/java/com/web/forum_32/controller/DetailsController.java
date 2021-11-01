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
	public DetailsController(IForumService forumService, IMessageService messageService,
			ServletContext servletContext) {
		this.forumService = forumService;
		this.messageService = messageService;
		this.servletContext = servletContext;
	}

	/**************************** 文章展示 ****************************/

	// Detailed
	@GetMapping("/detailed")
	public String detailedView(Model model, @RequestParam(value = "id", required = false) Integer id) {

		List<ForumBean> articlesList = forumService.getAll();
		for (int i = 0; i < articlesList.size(); i++) {
			if (id == articlesList.get(i).getId()) {
				if (i + 1 < articlesList.size()) {
					Integer previousId = articlesList.get(i + 1).getId();
					ForumBean previous = forumService.getContentById(previousId);
					model.addAttribute("previous", previous);
				} else {
					model.addAttribute("previousFail","previousFail");
				}
				
				if (i > 0) {
					Integer afterId = articlesList.get(i-1).getId();
					ForumBean after = forumService.getContentById(afterId);
					model.addAttribute("after", after);
				} else {
					model.addAttribute("afterFail","afterFail");
				}
			}
		}

		model.addAttribute("forumContent", forumService.getContentById(id));
		model.addAttribute("content", forumService.getAll());
		model.addAttribute("forumId", id);
		model.addAttribute("editForumContent", new ForumBean());
		model.addAttribute("fTitle", forumService.getContentById(id).getTitle());
		model.addAttribute("messageSize", messageService.getAllMessage(id).size());
		model.addAttribute("msgSize", messageService.getAllMessage(id));
		tagSize(model);

		return "forum_32/forum-detailed";
	}

	// Ajax 留言顯示
	@GetMapping(value = "/message")
	@ResponseBody
	public List<MessageBean> messageView(@RequestParam("id") Integer id, @RequestParam("page") Integer page,
			Model model) {
		List<MessageBean> msgPageList = messageService.getPagedMessagesByMessageForumId(id, page, 4);
		return msgPageList;
	}

	// Ajax 分頁
	@GetMapping({ "/page", "/pageLeft", "/pageRight" })
	@ResponseBody
	public List<MessageBean> pageMove(@RequestParam("id") Integer id, @RequestParam("page") Integer page, Model model) {
		return messageService.getPagedMessagesByMessageForumId(id, page, 4);
	}

	// 編輯
	@PostMapping("/detailed")
	public String editDedailed(@RequestParam("id") Integer id, @ModelAttribute("editForumContent") ForumBean updfb) {
		if (updfb.getContent() != null) {
			forumService.addOrEdit(updfb);
		}
		return "redirect:/detailed?id=" + id;
	}

	// 編輯塞值
	@GetMapping(value = "/editIntoVal")
	@ResponseBody
	public ForumBean editIntoVal(@RequestParam("id") Integer id,
			@ModelAttribute("managerEditForumContent") ForumBean editBean, Model model) {
		editBean = forumService.getContentById(id);
		return new ForumBean(editBean.getId(), editBean.getTag(), editBean.getTitle(), editBean.getContent(), editBean.getDate(),
				editBean.getPicId(), editBean.getUserName(), editBean.getUserEmail(), editBean.getUserNickname(),
				editBean.getIdentification(), editBean.getMessageQty(), editBean.getViewQty(),editBean.getTopArticle());
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
		ForumBean fb = forumService.getContentById(forumId);
		fb.setMessageQty(messageService.getAllMessage(forumId).size() + 1);
		forumService.addOrEdit(fb);
		messageService.addMessage(mb);
	}

	public void tagSize(Model model) {
		model.addAttribute("announcementSize", forumService.getAllContentsByAnnouncement().size());
		model.addAttribute("noviceSellerSize", forumService.getAllContentsByNoviceSeller().size());
		model.addAttribute("sellerChatSize", forumService.getAllContentsBySellerChat().size());
	}

}
