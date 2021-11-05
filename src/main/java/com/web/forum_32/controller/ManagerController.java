package com.web.forum_32.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.forum_32.model.ForumBean;
import com.web.forum_32.model.MessageBean;
import com.web.forum_32.model.MessageReportBean;
import com.web.forum_32.service.IForumService;
import com.web.forum_32.service.IMessageService;

@Controller
public class ManagerController {

	IForumService forumService;
	IMessageService messageService;
	ServletContext servletContext;

	@Autowired
	public ManagerController(IForumService forumService, IMessageService messageService,
			ServletContext servletContext) {
		this.messageService = messageService;
		this.forumService = forumService;
		this.servletContext = servletContext;
	}

	@Autowired
	JavaMailSender mailSender;

	/***************************** 後台管理 *****************************/

	// 後台頁面展示
	@GetMapping("/manager/forum")
	public String managerForumView(Model model) {
		model.addAttribute("content", forumService.getAll());
		model.addAttribute("reportMessage", messageService.getAllReportMessage());
		model.addAttribute("managerAddForumContentBean", new ForumBean());
		model.addAttribute("managerEditForumContentBean", new ForumBean());
		return "forum_32/forum-manager";
	}

	// 刪除
	@GetMapping("/manager/delete32")
	public String deleteById(@RequestParam("id") Integer id, Model model) {
		forumService.delete(id);
		return "redirect:/manager/forum";
	}

	// 編輯
	@GetMapping(value = "/manager/editManager")
	@ResponseBody
	public ForumBean managerEdit(@RequestParam("id") Integer id,
			@ModelAttribute("managerEditForumContentBean") ForumBean editBean, Model model) {
		editBean = forumService.getContentById(id);
		return new ForumBean(editBean.getId(), editBean.getTag(), editBean.getTitle(), editBean.getContent(),
				editBean.getDate(), editBean.getPicId(), editBean.getUserName(), editBean.getUserEmail(),
				editBean.getUserNickname(), editBean.getIdentification(), editBean.getMessageQty(),
				editBean.getViewQty(), editBean.getTopArticle());
	}

	// 編輯>提交表單
	@PostMapping("/manager/forum")
	public String managerEdit(Model model, @ModelAttribute("updateManager") ForumBean updfb, BindingResult result) {
		forumService.addOrEdit(updfb);
		return "redirect:/manager/forum";
	}

	// 查詢所有留言
	@GetMapping(value = "/manager/findAllMessage")
	@ResponseBody
	public List<MessageBean> findAllMessage(@RequestParam("id") Integer messageForumId) {
		return messageService.getAllByMessageForumId(messageForumId);
	}

	// 留言管理 得到標題
	@GetMapping(value = "/manager/getForumTitle")
	@ResponseBody
	public String getForumTitle(@RequestParam("id") Integer id) {
		return forumService.getContentById(id).getTitle();
	}

	// 刪除評論
	@GetMapping(value = "/manager/deleteMessageById")
	@ResponseBody
	public void deleteMessageById(@RequestParam("id") Integer id,
			@RequestParam("messageForumId") Integer messageForumId) {
		ForumBean fb = forumService.getContentById(messageForumId);
		fb.setMessageQty(fb.getMessageQty() - 1);
		forumService.addOrEdit(fb);
		messageService.delete(id);
	}

	/************************** 檢舉評論 ***************************/
	// 復原
	@GetMapping(value = "/manager/retest")
	@ResponseBody
	public void retest(@RequestParam("reportId") Integer reportId, @RequestParam("messageId") Integer messageId) {
		MessageReportBean mrb = messageService.getMessageReportById(reportId);
		mrb.setReportStatus("待審核");
		mrb.setReportContent(mrb.getWarningContent());
		MessageBean mb = messageService.getById(messageId);
		mb.setMessageContent(mrb.getWarningContent());
		messageService.addMessage(mb);
		messageService.saveReport(mrb);
	}

	// 忽略
	@GetMapping(value = "/manager/ignoreReprot")
	@ResponseBody
	public void ignoreReprot(@RequestParam("reportId") Integer reportId) {
		MessageReportBean mrb = messageService.getMessageReportById(reportId);
		mrb.setReportStatus("已完成");
		messageService.saveReport(mrb);
	}

	// 警告
	@GetMapping(value = "/manager/warning")
	@ResponseBody
	public void warning(@RequestParam("reportId") Integer reportId, 
			@RequestParam("messageId") Integer messageId,
			@RequestParam("userEmail") String userEmail) {

		MessageBean mb = messageService.getById(messageId);
		mb.setMessageContent("此評論已被刪除");
		MessageReportBean mrb = messageService.getMessageReportById(reportId);
		mrb.setReportContent("此評論已被刪除");
		mrb.setReportStatus("已完成");
		messageService.addMessage(mb);
		messageService.saveReport(mrb);
		
//		SimpleMailMessage message = new SimpleMailMessage();
//		message.setTo("hyprocrite1631@gmail.com");
//		message.setSubject("你的留言遭到檢舉");
//		message.setText("你的留言遭到檢舉 \r\n 內容:"+mrb.getWarningContent());
//		mailSender.send(message);

	}

	// 清除
	@GetMapping(value = "/manager/clear")
	@ResponseBody
	public void clear() {
		messageService.deleteByReportStatus("已完成");
	}

	/***************************************************************/

	/************************** 後臺管理結束 ***************************/
}
