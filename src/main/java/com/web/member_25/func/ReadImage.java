package com.web.member_25.func;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;

import javax.servlet.ServletContext;
import java.io.ByteArrayOutputStream;

import java.io.InputStream;
import java.sql.Blob;
import java.util.Optional;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;

@Controller
public class ReadImage {
	
	@Value("classpath:static/images/NoImage2.jpeg")
	private Resource resource;
	
	String noImage = "/images/NoImage2.jpeg";


MemberService memberService;
ServletContext servletContext; // get pic用


@Autowired
ServletContext context;

@Autowired
public ReadImage(MemberService memberService, ServletContext servletContext) {
	this.memberService = memberService;
	this.servletContext = servletContext;
}




@GetMapping("/getPicturefromMember/{id}")
public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
	System.out.println("開始載入圖片");
	byte[] body = null;
	ResponseEntity<byte[]> re = null;
	MediaType mediaType = null;
	HttpHeaders headers = new HttpHeaders();
	headers.setCacheControl(CacheControl.noCache().getHeaderValue());

	Optional<membershipInformationBean> memberData = memberService.findById(id);
	membershipInformationBean member =memberData.get();
	//判斷ID是否存在
	if (member == null) {
		return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
	}
	
	
	//開始解析圖片
	String filename = member.getFileName();
//	System.out.println("---------------->"+);
	System.out.println("---filename------------->"+filename);
	
	
	
	//test
	mediaType = MediaType.valueOf(context.getMimeType("NoImage2.jpg"));
	System.out.println("無圖片的mediaType="+mediaType);
	headers.setContentType(mediaType);
	
	if (filename==""||filename==null) {
//		mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
	mediaType = MediaType.valueOf(context.getMimeType("NoImage2.jpg"));
		System.out.println("無圖片的mediaType="+mediaType);
		headers.setContentType(mediaType);
	}
	
	//有檔名時抓出表頭
	if (filename != null) {
//		if (filename.toLowerCase().endsWith("jfif")) {
		if (filename.length()==0) {
//			mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			System.out.println("抓表頭1");
		mediaType = MediaType.valueOf(context.getMimeType(noImage));
			System.out.println("無圖片的mediaType="+mediaType);
		} else {
			System.out.println("抓表頭2");
			mediaType = MediaType.valueOf(context.getMimeType(filename));
			headers.setContentType(mediaType);
			System.out.println("有圖片的mediaType="+mediaType);
			System.out.println("有圖片的mediaType="+mediaType);
		}
	}
	
	
	//測試
	Blob blob = member.getHead_shot();
	if (blob != null) {
		body = blobToByteArray(blob);
		System.out.println("----------->有圖片");
		//無檔案時
	} else {
		String path = null;
		if (member.getFileName() == null || member.getFileName().length() == 0) {
			path = noImage;
			System.out.println("--------->noImage"+path);
		} 
		System.out.println("開始做讀取預設圖片");
		body = fileToByteArray(path);
	}
	
	
	//抓出圖片
//	Blob blob = member.getHead_shot();
//	if (blob != null) {
//		body = blobToByteArray(blob);
//		System.out.println("----------->有圖片");
//		//無檔案時
//	} else {
//		String path = null;
//		if (member.getFileName() == null || member.getFileName().length() == 0) {
//			path = noImage;
//			System.out.println("--------->noImage"+path);
//		} 
//		System.out.println("開始做讀取預設圖片");
//		body = fileToByteArray(path);
//	}
	re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

	return re;
}


private byte[] fileToByteArray(String path) {
	
	
	Resource resource = new ClassPathResource("static/images/NoImage2.jpeg");
	System.out.println("resource=====>"+resource);
	byte[] result = null;
	
	
	 try {
		InputStream in = resource.getInputStream();

		
		
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
			System.out.println("is=--------------->"+in);
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = in.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		System.out.println("result---------->"+result);
		return result;
		
		
	} catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	 System.out.println("方法結束");
	 return result;

//	
//	byte[] result = null;
//	try (InputStream is = context.getResourceAsStream(path);
//			ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
//		System.out.println("is=--------------->"+is);
//		byte[] b = new byte[819200];
//		int len = 0;
//		while ((len = is.read(b)) != -1) {
//			baos.write(b, 0, len);
//		}
//		result = baos.toByteArray();
//	} catch (Exception e) {
//		e.printStackTrace();
//	}
//	return result;
}

public byte[] blobToByteArray(Blob blob) {
	byte[] result = null;
	try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
		byte[] b = new byte[819200];
		int len = 0;
		while ((len = is.read(b)) != -1) {
			baos.write(b, 0, len);
		}
		result = baos.toByteArray();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return result;
}


}
