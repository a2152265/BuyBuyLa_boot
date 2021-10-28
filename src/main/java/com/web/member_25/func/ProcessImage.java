package com.web.member_25.func;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Blob;


import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;

@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData" })
public class ProcessImage {
	String noImage = "/images/NoImage2.png";
	MemberService memberService;
	ServletContext servletContext; // get pic用

	@Autowired
	public ProcessImage(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	}

	
	
	
	
	public ProcessImage() {
		
	}





	//上傳圖片
	//回傳一個做好的bean->
	
	//原先的bean-->originMb
	//處理好的bean-->dataMb
	public membershipInformationBean uploadImage(membershipInformationBean dataMb,membershipInformationBean originMb) {
		System.out.println("------------------進入處裡圖片方法---------------");
		System.out.println("-----------dataMb大頭貼----------------->"+dataMb.getHead_shot());
		System.out.println("----------dataMb檔名------------------>"+dataMb.getFileName());
		System.out.println("------------dataMb買家名稱---------------->"+dataMb.getUserName());
		System.out.println("-----------dataMb買家暱稱----------------->"+dataMb.getUserNickname());		
		// ==============存圖片的方法================================================
				// 1.存進資料庫(只需要備份一次) 2.存去系統的資料夾中(減輕DB負擔)

				// 方法1.存進資料庫
				// 上面做完存玩後 再來搬檔案
				// 為了要自定義檔案(圖片)名稱+主鍵				
		MultipartFile memberImage = originMb.getProductImage();
		
		if (memberImage.getSize()==0) {
			
			System.out.println("----------------判斷沒圖片上傳哦---------------");
			//未選圖片
		}else {
			String originalFilename=memberImage.getOriginalFilename();
			if (originalFilename.length()>0&&originalFilename.lastIndexOf(".") > -1) {
				originMb.setFileName(originalFilename);
				
				dataMb.setFileName(originalFilename);
				System.out.println("originalFilename--黨名--------?"+originalFilename);
			}
			//再去建建一個blob物件
			if (memberImage!=null&&!memberImage.isEmpty()) {
				try {
					byte[] b=memberImage.getBytes();
					Blob blob=new SerialBlob(b);
					originMb.setHead_shot(blob);
					
					dataMb.setHead_shot(blob);
					System.out.println("blob===2進轉完圖片======>"+blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("膽案上傳發生錯誤 in processImage 90");
				}
			}
		}	
		return dataMb;	
	}
	
		//----------------載入圖片----------------
		// 加入存取圖片
		// 把表格欄位的圖片抓出來往前端送
		// 要怎麼把blob抓出來改成byte陣列(圖片、檔案)
//		@GetMapping("/getPicturefromMemberORIGIN/{id}")
//		public ResponseEntity<byte[]> getPicture(HttpServletResponse resp,
//				@ModelAttribute("memberUiDefault") membershipInformationBean mb) {
//			System.out.println("------------------/getPicture/{id}------------------------id->" + mb.getId());
//			// 萬一找不到圖的預設圖片
//			String filePath = "/images/NoImage2.jpg";
//			// 要放的byte陣列
//			byte[] media = null;
//			// media - headers(表投)
//			HttpHeaders headers = new HttpHeaders();
//			String filename = "";
//			int len = 0;
//			// 用ID找到所有資料
//			Optional<membershipInformationBean> bean2 = memberService.findById(mb.getId());
//			membershipInformationBean bean=bean2.get();
//			//		if (bean.getFileName() != null ||  !bean.getFileName().equals("")) {
////				Blob blob = bean.getHead_shot();
////				filename = bean.getFileName();
////				if (blob != null) { // 有圖片時
////					try { // 找長度
////						len = (int) blob.length();
////						media = blob.getBytes(1, len); // 地1個位元組(JDBC都是從1開始 0會掛掉)-最後一個取出放入
////						System.out.println("----------------有圖片哦------------blob------->" + blob);
////						System.out.println("----------------有圖片哦------------filename--->" + filename);
////					} catch (SQLException e) {
////						System.out.println("----------------圖片錯誤-------------");
////						throw new RuntimeException("MemberController的getPicture()發生SQLException: " + e.getMessage());
////					}
////					
////				} else { // 直接把檔案轉成byte放到media 然後放預設圖片上去
////					media = toByteArray(filePath);
////					filename = filePath;
////					System.out.println("----------------直接把檔案轉成byte放到media 然後放預設圖片上去-------------");
////				}
////			} 	
////			else {
////				media = toByteArray(filePath);
////				filename = filePath;
////				System.out.println("----------------直接把檔案轉成byte放到media 然後放預設圖片上去22-------------");
//	//
////			}
//			
//			
//			if (bean.getFileName() == null ||  bean.getFileName().equals("")) {
//				Blob blob = bean.getHead_shot();
//				filename = bean.getFileName();
//				
//				System.out.println("blob--------->"+blob);
//				System.out.println("filename--------->"+filename);
//				media = fileToByteArray(filePath);
//				filename = filePath;
//				System.out.println("----------------直接把檔案轉成byte放到media 然後放預設圖片上去22-------------");			
//			} 	
//			else {
//				Blob blob = bean.getHead_shot();
//				if (blob != null) { // 有圖片時
//					try { // 找長度
//						len = (int) blob.length();
//						media = blob.getBytes(1, len); // 地1個位元組(JDBC都是從1開始 0會掛掉)-最後一個取出放入
//						System.out.println("----------------有圖片哦------------blob------->" + blob);
//						System.out.println("----------------有圖片哦------------filename--->" + filename);
//					} catch (SQLException e) {
//						System.out.println("----------------圖片錯誤-------------");
//						throw new RuntimeException("MemberController的getPicture()發生SQLException: " + e.getMessage());
//					}
//					
//				} else { // 直接把檔案轉成byte放到media 然後放預設圖片上去
//					media = fileToByteArray(filePath);
//					filename = filePath;
//					System.out.println("----------------直接把檔案轉成byte放到media 然後放預設圖片上去-------------");
//				}
//			}			
//			
//			System.out.println("===================測試中=====================");
//			System.out.println("filename最終版---------------->"+filePath);
//			// 不要放去快取區
//			System.out.println("----------------快取前-------------");
//			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
//			System.out.println("----------------快取後-------------");
//
//			// 由黨名傳回對應的MimeType(image/jpg)
//			String mimeType = servletContext.getMimeType(filename);
//			System.out.println("----------------getMimeType後------------->" + mimeType);
//			// spring要得式MediaType 所以用valueOf轉成要得東西
//			MediaType mediaType;
//			if (mimeType!=null) {
//				 mediaType = MediaType.valueOf(mimeType);
//			}else {
//				mediaType = MediaType.valueOf("image/jpg");
//			}
//			System.out.println("----------------getMimeType 轉MediaType後-------------");
//			System.out.println("mediaTypeForm member =" + mediaType);
//
//			headers.setContentType(mediaType);
//			// 開始建立
//			ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
//			return responseEntity;
//		}
//
//		// 把路徑轉成位元組陣列
//		private byte[] toByteArray(String filepath) {
//			byte[] b = null;
//			// 取出真的路徑 -------------------->
//			String realPath = servletContext.getRealPath(filepath);
//			   System.out.println("-----------開始讀取照片-----realPath-----"+realPath);
//			try {
//				File file = new File(realPath);
//				long size = file.length();
//				b = new byte[(int) size]; // 建立byte
//				InputStream fis = servletContext.getResourceAsStream(filepath);
//				fis.read(b); // 全部讀出
//			} catch (FileNotFoundException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			return b;
//		}
//		
//		
//		private byte[] fileToByteArray(String path) {
//			byte[] result = null;
//			try (InputStream is = servletContext.getResourceAsStream(path);
//					ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
//				byte[] b = new byte[819200];
//				int len = 0;
//				while ((len = is.read(b)) != -1) {
//					baos.write(b, 0, len);
//				}
//				result = baos.toByteArray();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return result;
//		}
//	
	
	
	
	
	
	

}
