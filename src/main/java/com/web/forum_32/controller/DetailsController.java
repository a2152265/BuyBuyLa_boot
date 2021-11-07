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
import com.web.forum_32.model.ForumLikeBean;
import com.web.forum_32.model.MessageBean;
import com.web.forum_32.model.MessageReplyBean;
import com.web.forum_32.model.MessageReportBean;
import com.web.forum_32.service.IForumService;
import com.web.forum_32.service.IMessageService;

@Controller
public class DetailsController {

	IForumService forumService;
	IMessageService messageService;
	ServletContext servletContext;
//
	@Autowired
	public DetailsController(IForumService forumService, IMessageService messageService,
			ServletContext servletContext) {
		this.forumService = forumService;
		this.messageService = messageService;
		this.servletContext = servletContext;
	}

	/**************************** 文章展示 ****************************/
//
	// Detailed
	@GetMapping("/detailed")
	public String detailedView(Model model, 
			@RequestParam(value = "id", required = false) Integer id) {
		
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
		model.addAttribute("getAll", forumService.getAll());
		model.addAttribute("tagFeatured", forumService.getAllByTag("社團精選話題"));
		model.addAttribute("forumId", id);
		model.addAttribute("editForumContent", new ForumBean());
		model.addAttribute("fTitle", forumService.getContentById(id).getTitle());
		model.addAttribute("messageSize", messageService.getAllMessage(id).size());
		model.addAttribute("msgSize", messageService.getAllMessage(id));
		tagSize(model);
		
		return "forum_32/forum-detailed";
	}
	
	@GetMapping(value="/addViewQty")
	public void addViewQty (@RequestParam("id") Integer id) {
		ForumBean view = forumService.getContentById(id);
		view.setViewQty(view.getViewQty()+1);
		forumService.addOrEdit(view);
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
		ForumBean editFb= forumService.getContentById(id);
		updfb.setViewQty(editFb.getViewQty());
		updfb.setTopArticle(editFb.getTopArticle());
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
				editBean.getIdentification(), editBean.getMessageQty(), editBean.getViewQty(),editBean.getLikeQty(),editBean.getTopArticle());
	}

	// 刪除
	@GetMapping("/delete32")
	public String deleteContentById(@RequestParam("id") Integer id, Model model) {
		forumService.delete(id);
		return "redirect:/forum";
	}
	
	// 讚讚Status
	@GetMapping("getLike")
	@ResponseBody
	public ForumLikeBean getLike(
			@RequestParam("forumId") Integer forumId,
			@RequestParam(value="loginUserName",required = false) String loginUserName) {
		if(loginUserName=="") {
			return null;
		}else {
			ForumLikeBean flb = forumService.findAllByForumIdAndLoginUserName(forumId, loginUserName);
			if(flb==null) {
				ForumLikeBean flb1=new ForumLikeBean();
				flb1.setForumId(forumId);
				flb1.setLoginUserName(loginUserName);
				flb1.setStatus(false);
				forumService.likeSave(flb1);
				return flb1;
			}else {
				return flb;
			}
		}
	}
	// 讚讚Qty
	@GetMapping("/getLikeQty")
	@ResponseBody
	public Integer getLikeQty(
			@RequestParam("forumId") Integer forumId) {
		Integer qty=forumService.findByForumIdAndStatus(forumId,true).size();
		if(qty!=0) {
			return qty;
		}else {
			return 0;
		}
	}
	
	// 讚讚Click
	@GetMapping("/like")
	@ResponseBody
	public boolean like(
			@RequestParam("forumId") Integer forumId,
			@RequestParam("loginUserName") String loginUserName,
			@RequestParam("status") boolean status) {
		ForumLikeBean flb1 = forumService.findAllByForumIdAndLoginUserName(forumId, loginUserName);
		ForumBean fb =forumService.getContentById(forumId);
		if(status==true) {
			fb.setLikeQty(fb.getLikeQty()-1);
		}else if ( status ==false) {
			fb.setLikeQty(fb.getLikeQty()+1);
		}
		forumService.addOrEdit(fb);
		if(flb1!=null) {
			flb1.setStatus(!status);
			forumService.likeSave(flb1);
			return flb1.getStatus();
		}else {
			ForumLikeBean flb = new ForumLikeBean();
			flb.setForumId(forumId);
			flb.setLoginUserName(loginUserName);
			flb.setStatus(!status);
			forumService.likeSave(flb);
			return flb.getStatus();
		}
	}

	// 發表評論
	@PostMapping(value = "/addMessage")
	@ResponseBody
	public void addMessage(MessageBean mb) {
		Integer forumId = mb.getMessageForumId();
		ForumBean fb = forumService.getContentById(forumId);
		fb.setMessageQty(messageService.getAllMessage(forumId).size() + 1);
		forumService.addOrEdit(fb);
		mb.setMessageIdentification("member");
		messageService.addMessage(mb);
	}
	// 編輯評論
	@GetMapping(value = "/editMessage")
	@ResponseBody
	public MessageBean editMessage(@RequestParam("id") Integer id) {
		MessageBean mb = messageService.getById(id);
		return new MessageBean(mb.getMessageId(),mb.getMessageForumId(),mb.getMessageDate(),mb.getMessageContent(),
				mb.getMessagePicId(),mb.getMessageUserName(),mb.getMessageIdentification(),mb.getMessageUserEmail());
	}
	
	// 編輯評論送出
	@PostMapping(value = "/editMessageFin")
	@ResponseBody
	public void editMessageFin(MessageBean mb) {
		messageService.addMessage(mb);
	}
	
	// 刪除評論
	@GetMapping(value = "/deleteMessage")
	public void deleteMessage(@RequestParam("id") Integer id,
			@RequestParam("forumId") Integer forumId) {
		
		ForumBean updateMessageQty =forumService.getContentById(forumId);
		updateMessageQty.setMessageQty(updateMessageQty.getMessageQty()-1);
		forumService.addOrEdit(updateMessageQty);
		messageService.delete(id);
	}
	// 刪除評論
	@GetMapping(value = "/deleteReplyMessage")
	public void deleteReplyMessage(@RequestParam("id") Integer id,
			@RequestParam("forumId") Integer forumId) {
		
		ForumBean updateMessageQty =forumService.getContentById(forumId);
		updateMessageQty.setMessageQty(updateMessageQty.getMessageQty()-1);
		forumService.addOrEdit(updateMessageQty);
		messageService.deleteReply(id);
	}
	// 回覆評論
	@GetMapping(value="/addReplyMessage")
	@ResponseBody
	public void addReplyMessage(
			@RequestParam("messageReplyId") Integer messageReplyId,
			@RequestParam("replyForumId") Integer replyForumId,
			@RequestParam("replyDate") String replyDate,
			@RequestParam("replyContent") String replyContent,
			@RequestParam("replyPicId") Integer replyPicId,
			@RequestParam("replyUserName") String replyUserName,
			@RequestParam("replyIdentification") String replyIdentification,
			@RequestParam("replyUserEmail") String replyUserEmail) {
		MessageReplyBean mrb= new MessageReplyBean();
		mrb.setMessageReplyId(messageReplyId);
		mrb.setReplyContent(replyContent);
		mrb.setReplyDate(replyDate);
		mrb.setReplyForumId(replyForumId);
		mrb.setReplyIdentification(replyIdentification);
		mrb.setReplyPicId(replyPicId);
		mrb.setReplyUserEmail(replyUserEmail);
		mrb.setReplyUserName(replyUserName);
		ForumBean fb = forumService.getContentById(replyForumId);
		fb.setMessageQty(messageService.getAllMessage(replyForumId).size() + 1);
		forumService.addOrEdit(fb);
		messageService.addReplyMessage(mrb);
	}
	// 評論顯示
	@GetMapping(value="/getReply")
	@ResponseBody
	public List<MessageReplyBean> getReply(
			@RequestParam("messageId") Integer messageId){
		return messageService.findByMessageReplyId(messageId);
	}
	// 檢舉評論
	@GetMapping(value="/reprotMessage")
	@ResponseBody
	public void reprotMessage(
			@RequestParam("reportUserName") String reportUserName,
			@RequestParam("reportedUserName") String reportedUserName,
			@RequestParam("reportedContent") String reportedContent,
			@RequestParam("reportForumId") Integer reportForumId,
			@RequestParam("reportMessageId") Integer reportMessageId,
			@RequestParam("reportReason") String reportReason,
			@RequestParam("reportDate") String reportDate,
			@RequestParam("reportedUserEmail") String reportedUserEmail){
		MessageReportBean mrb = new MessageReportBean();
		mrb.setReportedUserEmail(reportedUserEmail);
		mrb.setReportContent(reportedContent);
		mrb.setReportDate(reportDate);
		mrb.setReportedUserName(reportedUserName);
		mrb.setReportForumId(reportForumId);
		mrb.setReportMessageId(reportMessageId);
		mrb.setReportReason(reportReason);
		mrb.setReportUserName(reportUserName);
		mrb.setWarningContent(reportedContent);
		mrb.setReportStatus("待審核");
		messageService.saveReport(mrb);
	}
	// 檢舉評論
	@GetMapping(value="/reprotReplyMessage")
	@ResponseBody
	public void reprotReplyMessage() {
	}
	// reply取值
	@GetMapping(value="/getReplyBean")
	@ResponseBody
	public MessageReplyBean getReplyBean(@RequestParam("replyId") Integer replyId) {
		MessageReplyBean mrb =  messageService.getByReplyId(replyId);
		return new MessageReplyBean(mrb.getReplyId(),mrb.getMessageReplyId(),mrb.getReplyForumId(),mrb.getReplyDate(),
				mrb.getReplyContent(),mrb.getReplyPicId(),mrb.getReplyUserName(),mrb.getReplyIdentification(),mrb.getReplyUserEmail());
	}
	// reply編輯評論送出
	@PostMapping(value = "/editReplyFin")
	@ResponseBody
	public void editReplyFin(MessageReplyBean mrb) {
		messageService.addReplyMessage(mrb);
	}
	public void tagSize(Model model) {
		model.addAttribute("allSize", forumService.getAll().size());
		model.addAttribute("announcementSize",forumService.getAllByTag("官方最新公告").size());
		model.addAttribute("featuredSize",forumService.getAllByTag("社團精選話題").size());
		model.addAttribute("noviceSellerSize",forumService.getAllByTag("新手賣家發問").size());
		model.addAttribute("sellerChatSize",forumService.getAllByTag("賣家閒聊討論").size());
	}

}