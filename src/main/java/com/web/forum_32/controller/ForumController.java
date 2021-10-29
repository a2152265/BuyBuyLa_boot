package com.web.forum_32.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.forum_32.model.ForumBean;
import com.web.forum_32.service.IForumService;
import com.web.forum_32.service.IMessageService;

@Controller
public class ForumController {

	IForumService forumService;
	IMessageService messageService;
	ServletContext servletContext;

	@Autowired
	public ForumController(IMessageService messageService, IForumService forumService,
			ServletContext servletContext) {
		this.forumService = forumService;
		this.messageService = messageService;
		this.servletContext = servletContext;
	}

    /****************************  頁面展示  ****************************/
	
	// 首頁
	@GetMapping("/forum")
	public String forum(Model model) {
		List<ForumBean> allList = forumService.getAllContents();
		model.addAttribute("content", allList);
		model.addAttribute("forumBean", new ForumBean());
		model.addAttribute("updateForumBean", new ForumBean());
		List<ForumBean> announcementSize=forumService.getAllContentsByAnnouncement();
		List<ForumBean> noviceSellerSize=forumService.getAllContentsByNoviceSeller();
		List<ForumBean> sellerChatSize=forumService.getAllContentsBySellerChat();
		model.addAttribute("announcementSize",announcementSize.size());
		model.addAttribute("noviceSellerSize",noviceSellerSize.size());
		model.addAttribute("sellerChatSize",sellerChatSize.size());
		return "forum_32/forum";
	}
	
	// 首頁 標籤:官方最新公告
		@GetMapping("/announcement")
		public String announcement(Model model) {
			List<ForumBean> announcementList = forumService.getAllContentsByAnnouncement();
			if(!announcementList.isEmpty()) {
			model.addAttribute("content", announcementList);
		}else {
			List<ForumBean> allList = forumService.getAllContents();
			model.addAttribute("content", allList);
		}
			model.addAttribute("forumBean", new ForumBean());
			model.addAttribute("updateForumBean", new ForumBean());
			List<ForumBean> announcementSize=forumService.getAllContentsByAnnouncement();
			List<ForumBean> noviceSellerSize=forumService.getAllContentsByNoviceSeller();
			List<ForumBean> sellerChatSize=forumService.getAllContentsBySellerChat();
			model.addAttribute("announcementSize",announcementSize.size());
			model.addAttribute("noviceSellerSize",noviceSellerSize.size());
			model.addAttribute("sellerChatSize",sellerChatSize.size());
			return "forum_32/forum";
		}

		// 首頁 標籤:新手賣家發問
		@GetMapping("/noviceSeller")
		public String noviceSeller(Model model) {
			List<ForumBean> noviceSellerList = forumService.getAllContentsByNoviceSeller();
			if(!noviceSellerList.isEmpty()) {
			model.addAttribute("content", noviceSellerList);
		}else {
			List<ForumBean> allList = forumService.getAllContents();
			model.addAttribute("content", allList);
		}
			model.addAttribute("forumBean", new ForumBean());
			model.addAttribute("updateForumBean", new ForumBean());
			List<ForumBean> announcementSize=forumService.getAllContentsByAnnouncement();
			List<ForumBean> noviceSellerSize=forumService.getAllContentsByNoviceSeller();
			List<ForumBean> sellerChatSize=forumService.getAllContentsBySellerChat();
			model.addAttribute("announcementSize",announcementSize.size());
			model.addAttribute("noviceSellerSize",noviceSellerSize.size());
			model.addAttribute("sellerChatSize",sellerChatSize.size());
			return "forum_32/forum";
		}

		// 首頁 標籤:賣家閒聊討論
		@GetMapping("/sellerChat")
		public String sellerChat(Model model) {
			List<ForumBean> sellerChatList = forumService.getAllContentsBySellerChat();
				if(!sellerChatList.isEmpty()) {
				model.addAttribute("content", sellerChatList);
			}else {
				List<ForumBean> allList = forumService.getAllContents();
				model.addAttribute("content", allList);
			}
			model.addAttribute("forumBean", new ForumBean());
			model.addAttribute("updateForumBean", new ForumBean());
			List<ForumBean> announcementSize=forumService.getAllContentsByAnnouncement();
			List<ForumBean> noviceSellerSize=forumService.getAllContentsByNoviceSeller();
			List<ForumBean> sellerChatSize=forumService.getAllContentsBySellerChat();
			model.addAttribute("announcementSize",announcementSize.size());
			model.addAttribute("noviceSellerSize",noviceSellerSize.size());
			model.addAttribute("sellerChatSize",sellerChatSize.size());
			return "forum_32/forum";
		}

	/**************************  頁面展示結束 ***************************/
	
		
		
		
	/***************************** 後台管理 *****************************/
	
	// 後台頁面展示
	@GetMapping("/manager/forum")
	public String forumManager(Model model) {
		List<ForumBean> allList = forumService.getAllContents();
		model.addAttribute("content", allList);
		model.addAttribute("updateManager", new ForumBean());
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
	public ForumBean managerUpdUrl(@RequestParam("id") Integer id, 
			@ModelAttribute("updateManager") ForumBean updfb, 
			Model model) {
		ForumBean fb = forumService.getContentById(id);
		updfb = new ForumBean(fb.getId(), fb.getUserName(), fb.getUserEmail(), fb.getDate(), fb.getTag(),fb.getTitle(), fb.getContent(),fb.getPicId());
		return updfb;
	}
	
	// 編輯>提交表單
	@PostMapping("/manager/forum")
	public String managerForm(
			Model model,
			@ModelAttribute("updateManager") ForumBean updfb,
			BindingResult result) {
				forumService.update(updfb);
		return "redirect:/manager/forum";
	}
	
	/**************************  後臺管理結束 ***************************/

	
	
	
	
	
	/***************************** 文章CRUD *****************************/
	
	// 編輯
	@GetMapping(value = "/editURL")
	@ResponseBody
	public ForumBean Url(@RequestParam("id") Integer id, 
			@ModelAttribute("updateForumBean") ForumBean updfb, 
			Model model) {
		ForumBean fb = forumService.getContentById(id);
		updfb = new ForumBean(fb.getId(), fb.getUserName(), fb.getUserEmail(), fb.getDate(), fb.getTag(),fb.getTitle(), fb.getContent(),fb.getPicId());
		return updfb;
	}
	

	// 搜尋
	@GetMapping(value = "/search")
	@ResponseBody
	public List<ForumBean> searchUrl(@RequestParam("title") String title, Model model) {
		List<ForumBean> fb = forumService.findAllByTitle(title);
		model.addAttribute("content", fb);
		return fb;
	}

	// 刪除
	@GetMapping("/delete32")
	public String deleteContentById(@RequestParam("id") Integer id, Model model) {
		forumService.delete(id);
		return "redirect:/forum";
	}
	
	// 新增.編輯文章 提交表單
	@PostMapping({"/forum","/noviceSeller","/sellerChat","/announcement"})
	public String processAddNewFourmForm(
			Model model,
			@ModelAttribute("updateForumBean") ForumBean updfb,
			@ModelAttribute("forumBean") ForumBean fb, 
			BindingResult result) {
			if (updfb.getId() != null) {
				if (!updfb.getImage().isEmpty()) {
				MultipartFile image = updfb.getImage();
				String originalFilename = image.getOriginalFilename();
				updfb.setFileName(originalFilename);
				if (image != null && !image.isEmpty()) {
					try {
						byte[] b = image.getBytes();
						Blob blob = new SerialBlob(b);
						updfb.setCoverImage(blob);
					} catch (Exception e) {
						e.printStackTrace();
						throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
					}
				}
				forumService.update(updfb);
			} else if (updfb.getImage().isEmpty()) {
				ForumBean imgIsEmpty = forumService.getContentById(updfb.getId());
				updfb.setCoverImage(imgIsEmpty.getCoverImage());
				updfb.setFileName(imgIsEmpty.getFileName());
				forumService.update(updfb);
			}
		} else {
			String[] suppressedFields = result.getSuppressedFields();
			if (suppressedFields.length > 0) {
				throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
			}
			MultipartFile image = fb.getImage();
			String originalFilename = image.getOriginalFilename();
			fb.setFileName(originalFilename);
			if (image != null && !image.isEmpty()) {
				try {
					byte[] b = image.getBytes();
					Blob blob = new SerialBlob(b);
					fb.setCoverImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			forumService.addContent(fb);
		}
		return "redirect:/forum";
	}
	
	/*************************** 文章CRUD結束 ***************************/

	// 白名單
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields("picId","id","content","title", "date",  "tag",   "image", "files","userEmail","userName");
	}

	// 首頁顯示圖片
	@GetMapping("/getPicture32/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
		String filePath = "/resources/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ForumBean bean = forumService.getContentById(id);
		if (bean != null) {
			Blob blob = bean.getCoverImage();
			filename = bean.getFileName();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ForumController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = servletContext.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = servletContext.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = servletContext.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

}
