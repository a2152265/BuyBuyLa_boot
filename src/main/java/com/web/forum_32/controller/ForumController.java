package com.web.forum_32.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	// 首頁展示
	@GetMapping("/forum")
	public String forum(Model model) {
		List<ForumBean> allList = forumService.getAllContents();
		model.addAttribute("content", allList);
		model.addAttribute("forumBean", new ForumBean());
		model.addAttribute("updateForumBean", new ForumBean());
		model.addAttribute("tag", "所有討論");
		return "forum_32/forum";
	}
	
	// 詳細
	@GetMapping("/detailed")
	public String detailed(Model model,
					@RequestParam("id") Integer id) {
		ForumBean forumBean = forumService.getContentById(id);
		model.addAttribute("fb",forumBean);
		model.addAttribute("forumBean", new ForumBean());
		model.addAttribute("updateForumBean", new ForumBean());
		model.addAttribute("tag", "所有討論");
		return "forum_32/forum-detailed";
	}
	
	
	// 官方最新公告區
	@GetMapping("/announcement") //announcement
	public String chat(Model model) {
		
		List<ForumBean> announcementList = forumService.getAllContentsByAnnouncement();
		
		if(!announcementList.isEmpty()) {
		model.addAttribute("content", announcementList);
		model.addAttribute("tag", "官方最新公告區");
	}else {
		List<ForumBean> allList = forumService.getAllContents();
		model.addAttribute("content", allList);
		model.addAttribute("tag", "所有討論");
	}
		model.addAttribute("forumBean", new ForumBean());
		model.addAttribute("updateForumBean", new ForumBean());
		return "forum_32/forum";
	}

	// 新手賣家發問區
	@GetMapping("/noviceSeller")
	public String box(Model model) {
		List<ForumBean> noviceSellerList = forumService.getAllContentsByNoviceSeller();
		if(!noviceSellerList.isEmpty()) {
		model.addAttribute("content", noviceSellerList);
		model.addAttribute("tag", "新手賣家發問區");
	}else {
		List<ForumBean> allList = forumService.getAllContents();
		model.addAttribute("content", allList);
		model.addAttribute("tag", "所有討論");
	}
		model.addAttribute("forumBean", new ForumBean());
		model.addAttribute("updateForumBean", new ForumBean());
		return "forum_32/forum";
	}

	// 賣家閒聊討論區
	@GetMapping("/sellerChat")
	public String other(Model model) {
		List<ForumBean> sellerChatList = forumService.getAllContentsBySellerChat();
			if(!sellerChatList.isEmpty()) {
			model.addAttribute("content", sellerChatList);
			model.addAttribute("tag", "賣家閒聊討論區");
		}else {
			List<ForumBean> allList = forumService.getAllContents();
			model.addAttribute("content", allList);
			model.addAttribute("tag", "所有討論");
		}
		model.addAttribute("forumBean", new ForumBean());
		model.addAttribute("updateForumBean", new ForumBean());
		return "forum_32/forum";
	}

	// 編輯貼文
	@GetMapping(value = "/editURL")
	@ResponseBody
	public ForumBean Url(@RequestParam("id") Integer id, @ModelAttribute("updateForumBean") ForumBean f, Model model) {
		ForumBean fb = forumService.getContentById(id);
		f = new ForumBean(fb.getId(), fb.getUserName(), fb.getUserEmail(), fb.getDate(), fb.getTag(),fb.getTitle(), fb.getContent());
		return f;
	}

	// 刪除貼文
	@GetMapping("/delete32")
	public String deleteContentById(@RequestParam("id") Integer id, Model model) {
		System.out.println("id=id=id=id=" + id);
		forumService.delete(id);
		return "redirect:/forum";
	}

	// 新增貼文.編輯
	@PostMapping({"/forum","/noviceSeller","/sellerChat","/announcement"})
	public String processAddNewFourmForm(@ModelAttribute("updateForumBean") ForumBean updfb,
			@ModelAttribute("forumBean") ForumBean fb, BindingResult result) {
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
	

	// 白名單
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
		binder.setAllowedFields("title","userName", "userEmail", "tag", "id", "content", "image", "date", "files");
	}

	//
	@GetMapping("/forwardDemo")
	public String forward(Model model, HttpServletRequest request) {
		String uri = request.getRequestURI();
		model.addAttribute("modelData0", "這是以/forwardDemo送來的請求");
		model.addAttribute("uri0", uri);
		return "forward:/anotherFWD";
	}

	// 被轉發的方法，將與前一個方法共用同一個請求物件
	@GetMapping("/anotherFWD")
	public String forwardA(Model model, HttpServletRequest request) {
		String uri = request.getRequestURI();
		model.addAttribute("modelData1", "這是以/anotherFWD送來的請求");
		model.addAttribute("uri1", uri);
		return "forwardedPage";
	}

	//
	@GetMapping("/redirectDemo")
	public String redirect(Model model, RedirectAttributes redirectAttributes, HttpServletRequest request) {
		String uri = request.getRequestURI();
		model.addAttribute("modelData2", "這是以/redirectDemo送來的請求，即將通知瀏覽器對" + "新網址發出請求，但瀏覽器不會顯示這樣的訊息");
		model.addAttribute("uri2", uri);
		redirectAttributes.addFlashAttribute("modelData3", "這是加在RedirectAttributes" + "物件內的屬性物件，瀏覽器會顯示");
		redirectAttributes.addFlashAttribute("uri3", uri);
		return "redirect:/redirectAnother";
	}

	//
	@GetMapping("/redirectAnother")
	public String redirectA(Model model, HttpServletRequest request) {
		return "redirectedPage";
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
