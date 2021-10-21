package com.web.celebrations_36.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.web.celebrations_36.model.Campaign;
import com.web.celebrations_36.service.CampaignService;

@Controller
public class CampaignController {
	
	CampaignService campaignService;
	ServletContext servletContext;
	
	@Autowired
	public CampaignController(CampaignService campaignService, ServletContext servletContext) {
		this.campaignService = campaignService;
		this.servletContext = servletContext;
	}
	
	@GetMapping({"/index.html"})
//	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index000() {
		return "index";
	}
	
	@GetMapping("/campaigns")
	public String list(Model model) {
		List<Campaign> beans = campaignService.findAll();
		model.addAttribute("campaigns",beans);
		return "celebrations_36/campaigns";
	}
	
	@GetMapping("/campaign/addCampaign")
	public String getAddNewCampaignForm(Model model) {
	    Campaign campaign = new Campaign();
	    model.addAttribute("Campaign", campaign);
	    return "celebrations_36/addCampaign";
	}
	
	@PostMapping("/campaign/addCampaign")
	public String processAddNewProductForm(
			@ModelAttribute("Campaign") Campaign campaign,
			BindingResult result 	
	) { 
		String[] suppressedFields = result.getSuppressedFields();
	    if (suppressedFields.length > 0) {
	        throw new RuntimeException("嘗試傳入不允許的欄位: " + 
	        StringUtils.arrayToCommaDelimitedString(suppressedFields));
	    }
		System.out.println("campaign=" + campaign);
		
		MultipartFile productImage = campaign.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		campaign.setFileName(originalFilename);
		//  建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty() ) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				campaign.setCoverImage(blob);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}		
		//==============================================
		campaignService.save(campaign);
		//===============================================
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = servletContext.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists()) imageFolder.mkdirs();
			File file = new File(imageFolder,"Campaign_"+ campaign.getId() + ext);
			productImage.transferTo(file);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		
	    return "redirect:/campaigns";
	}
	@InitBinder
	public void whiteListing(WebDataBinder binder) {
	    binder.setAllowedFields(
	    "name", 
	    "url", 
	    "description", 
	    "note", 
	    "productImage",
	    "date1"
	    );
	}
	
	@GetMapping("/getCampaignPicture/{campaignId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer campaignId) {
	    String filePath = "/resources/images/NoImage.jpg";

	    byte[] media = null;
	    HttpHeaders headers = new HttpHeaders();
	    String filename = "";
	    int len = 0;
	    Campaign bean = campaignService.findById(campaignId);
	    if (bean != null) {
	        Blob blob = bean.getCoverImage();
	        filename = bean.getFileName();
	        if (blob != null) {
	            try {
	                len = (int) blob.length();
	                media = blob.getBytes(1, len);
	            } catch (SQLException e) {
	                throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
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
	    System.out.println("mediaType =" + mediaType);
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
	
	@GetMapping("/campaign")
	public String getCampaignById(
			@RequestParam("id")	Integer id ,
			Model model) {
		System.out.println("id="+id);
		model.addAttribute("campaign",campaignService.findById(id));
		return "celebrations_36/campaign";
	}
	
	
	
	@GetMapping("/admincampaign")
	public String getAllCampaign(Model model) {
		List<Campaign> beans = campaignService.findAll();
		model.addAttribute("campaigns",beans);
		return "celebrations_36/admincampaigns";
	}
	
//	@GetMapping("/updatecampaign")
//	public String updateCampaignById(
//			@RequestParam("id")	Integer id ,
//			Model model) {
//		System.out.println("id="+id);
//		model.addAttribute("campaign",campaignService.findById(id));
//		return "celebrations_36/updatecampaign";
//	}
	
	@GetMapping("/updatecampaign")
	public String updateCampaingById(
			@RequestParam("id") Integer id, 
			Model model
	){
		System.out.println("id="+id);
		model.addAttribute("campaign",campaignService.findById(id));
	    return "celebrations_36/updatecampaign";
	}
	
	@PostMapping("/updatecampaign")
	public String processUpdateCampaingById(
			@RequestParam("id") Integer id,
			@ModelAttribute("campaign") Campaign campaign, 
			Model model
	){
		System.out.println("id="+campaign.getId());
		campaign.setId(id);
		
		if(!campaign.getProductImage().isEmpty()) {
		
		MultipartFile productImage = campaign.getProductImage();
		String originalFilename = productImage.getOriginalFilename();
		campaign.setFileName(originalFilename);
		//  建立Blob物件，交由 Hibernate 寫入資料庫
		if (productImage != null && !productImage.isEmpty() ) {
			try {
				byte[] b = productImage.getBytes();
				Blob blob = new SerialBlob(b);
				campaign.setCoverImage(blob);
			} catch(Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}	
		//===============================
		campaignService.update(campaign);
		//===============================
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = servletContext.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images");
			if (!imageFolder.exists()) imageFolder.mkdirs();
			File file = new File(imageFolder,"Campaign_"+ campaign.getId() + ext);
			productImage.transferTo(file);
		} catch(Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
		}
		
		}else if(campaign.getProductImage().isEmpty()){
			System.out.println("*****************************************");
			campaignService.updateWithoutImg(campaign);
		}
	    return "redirect:/admincampaign";
	}
	@GetMapping("/deletecampaign/{id}")
	public String deleteCampaignById(
			@PathVariable("id") Integer id, 
			Model model
	){
		System.out.println("id="+id);
		campaignService.delete(id);
	    return "redirect:/admincampaign";
	}
}
