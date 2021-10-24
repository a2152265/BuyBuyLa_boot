package com.web.member_25.controller;

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
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;
import com.web.member_25.validate.MemberValidator;

@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData" })
public class TestLoginController {

	MemberService memberService;
	ServletContext servletContext; // get pic用

	@Autowired
	public TestLoginController(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	}

//	@GetMapping("/zxczc")   //改
//	public String indexDefault() {
//		System.out.println("回首頁");
//		return "member_25/tryIndex";
//	}

	@GetMapping("/try/index")
	public String index(@ModelAttribute("loginSession") membershipInformationBean mb, Model model) {
		System.out.println("login後回首頁GetMapping");
		membershipInformationBean mb2 = new membershipInformationBean();
		mb2.setUserEmail(mb.getUserEmail());
		mb2.setUserPwd(mb.getUserPwd());
		mb2.setUserName(mb.getUserName());
		model.addAttribute("loginSession", mb2);
		System.out.println("首頁的getmapping ----------->getUserEmail =" + mb.getUserName());

		return "cart_30/TotalHome";
	}

	@PostMapping("/try/index")
	public String processIndex(@ModelAttribute("loginSession") membershipInformationBean mb, Model model) {
		System.out.println("有進到POST Index哦-------->UserEmail " + mb.getUserEmail());
		System.out.println("有進到POST Index哦-------->");

		return "cart_30/TotalHome";
	}

	@GetMapping("/try/add")
	public String trySignUp(Model model) {
//		MemberBean mb=new MemberBean();
		membershipInformationBean mb = new membershipInformationBean();
		// 設定預設值
		mb.setUserEmail("c123@gmail.com");
		mb.setUserPwd("c123456");
		mb.setUserPhone("0912345678");
		mb.setIdentification("member");
		model.addAttribute("loginBeanDefault", mb);
		return "member_25/trySignUpPage";
	}

	@PostMapping("/try/add")
	public String processtrySignUp(@ModelAttribute("loginBeanDefault") membershipInformationBean mb,
			BindingResult result, // 老爸 is errors (表單有任何錯誤都放到這裡)
			Model model) {
		
		new MemberValidator().validate(mb, result);
		System.out.println("修改會員(PUT, 11-05): " + mb);
		if (result.hasErrors()) {
			System.out.println("======================");
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			System.out.println("======================");
			return "member_25/trySignUpPage";
		}
		
		

		System.out.println("-------------表單檢查無錯誤-------------");
		System.out.println("-------> mb = " + mb);
		System.out.println("---->mb.ID=" + mb.getId());
		System.out.println("---->mb.ID=" + mb.getUserEmail());
		System.out.println("---->mb.getIdentification=" + mb.getIdentification());

		Boolean loginResult=false;
		
		loginResult = memberService.overlappedAccount(mb.getUserEmail());
		if (loginResult ==false) {
			System.out.println("帳號重複  ----->");

			return "member_25/trySignUpPage";

		} else if (loginResult == true) {

			System.out.println("無人使用此帳號 已註冊  ----->");
			mb.setIdentification("member");
			memberService.save(mb);
			return "product_11/products";
		}
		return "member_25/trySignUpPage";
	}

	@GetMapping("/try/login")
	public String tryLogin(Model model) {

//			membershipInformationBean mb=new membershipInformationBean();
//			mb.setUserEmail("");
//			mb.setUserPwd(""); 
//			model.addAttribute("loginSession",mb);

		model.addAttribute("loginSession", new membershipInformationBean());
		return "member_25/tryLoginPage";
	}

	@PostMapping("/try/login")
	public String processtryLogin(@ModelAttribute("loginSession") membershipInformationBean mb, BindingResult result,
			RedirectAttributes redirectAttributes, Model model) {

		// -------------------------------------------
		// 檢查有沒有違法欄位
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " +
			// 把陣列裡面的元素用,隔開並轉成字串
					StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}

		System.out.println("==========進入processMemberLogin=====================");
		membershipInformationBean mb2 = new membershipInformationBean();

		int loginResult = 0; 

		String userEmail = null, userPwd = null;
		userEmail = mb.getUserEmail();
		userPwd = mb.getUserPwd();
		System.out.println("登入表單的userEmail ======>" + userEmail);
		
		
		//登入結果   // 0錯誤 1成功 2無帳號 3重複帳號(除了自己+的應該不會出現這個可能)
		loginResult = memberService.login(userEmail, userPwd);
		
		
		
		if (loginResult == 1) {

			Boolean isMamber = true;
			isMamber = memberService.memberOrManager(userEmail); // 判斷是使用者還是管理者
			System.out.println("isMamber------------>>管理者?----->" + isMamber);
			if (isMamber == false) {
				mb2.setUserEmail(userEmail);
				mb2.setUserPwd(userPwd);
				model.addAttribute("managerSession", mb2);
				return "redirect:/try/manager";
			}
			System.out.println("登入成功 userEmail  ----->" + userEmail);
			mb2.setUserEmail(userEmail);
			mb2.setUserPwd(userPwd);
			model.addAttribute("loginSession", mb2);

			return "redirect:/products"; // 登入成功

		} else if (loginResult == 2) {
			System.out.println("查無帳號  ----->");
			return "member_25/loginFailPage";
		} else if (loginResult == 3) {
			System.out.println("帳號重複  ----->");
			return "member_25/loginFailPage";
		}

		return "member_25/tryLoginPage";
	}

	@RequestMapping("/try/logout")
	public String tologout(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			SessionStatus sessionStatus) {
		session.removeAttribute("loginSession");
		session.removeAttribute("memberUiDefault");
		session.removeAttribute("managerSession");
		System.out.println("logout:" + session.getAttribute("loginSession"));
		sessionStatus.setComplete();
		System.out.println("已清除 登入狀態loginSession+managerSession+memberUiDefault");
		return "redirect:/"; // 回乾淨首頁成功 讚
	}

	// 老師範例
	@RequestMapping("/try/logout2")
	public String tologout2(SessionStatus sessionStatus) {

		sessionStatus.setComplete(); // 讓本controller的sessionAtribute中的物件全部失效(也就是其他sessionAtribute創出來的物件不會刪到)
		System.out.println("已清除 所有登入狀態");
		return "redirect:/"; // 回乾淨首頁成功 讚
	}

	//登入後會員介面
	@GetMapping("/try/member_Ui")
	public String tryMemberUpdate(@ModelAttribute("loginSession") membershipInformationBean mb, Model model) {
		System.out.println("membershipInformationBean --getUserEmail----->" + mb.getUserEmail());
		membershipInformationBean mb2 = new membershipInformationBean();
		String userEmail = mb.getUserEmail();		
		//預載會員資料
		mb2=memberService.findMemberData(mb.getUserEmail());
		if (mb2.getFileName()==null||mb2.getFileName().equals("")) {
			System.out.println("------登入後預載預設圖片------");
			
			
		}
		
		

		System.out.println("getUserEmail --getMemberData2--><--->" + mb2.getUserEmail());
		System.out.println("getUserPwd --getMemberData2--><--->" + mb2.getUserPwd());
		model.addAttribute("memberUiDefault", mb2);
		return "member_25/tryMember_Ui";
	}

	@PostMapping("/try/member_Ui")
	public String tryProcessMemberUpdate(@ModelAttribute("memberUiDefault") membershipInformationBean mb,
//				@RequestParam String userEmail,
			BindingResult result, RedirectAttributes redirectAttributes, Model model) {

		// -------------------------------------------
		// 檢查有沒有違法欄位
		String[] suppressedFields = result.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("嘗試傳入不允許的欄位: " +
			// 把陣列裡面的元素用,隔開並轉成字串
					StringUtils.arrayToCommaDelimitedString(suppressedFields));
		}
		System.out.println("==========進入tryProcessMemberUpdate=====================");
		membershipInformationBean mb2 = new membershipInformationBean();
		System.out.println("mb.getUserGender()+++++"+mb.getUserGender());
		System.out.println("mb.getUserName()+++++"+mb.getUserName());
		mb2.setUserEmail(mb.getUserEmail());
		mb2.setUserPwd(mb.getUserPwd());
		mb2.setAddress(mb.getAddress());
		mb2.setUserGender(mb.getUserGender());
		mb2.setUserPhone(mb.getUserPhone());
		mb2.setUserName(mb.getUserName());
		mb2.setIdentification(mb.getIdentification());
	

		// ==============存圖片的方法================================================
		// 1.存進資料庫(只需要備份一次) 2.存去系統的資料夾中(減輕DB負擔)

		// 方法1.存進資料庫
		// 上面做完存玩後 再來搬檔案
		// 為了要自定義檔案(圖片)名稱+主鍵
		MultipartFile memberImage = mb.getProductImage();
		String originalFilename = memberImage.getOriginalFilename(); // 取出來式最初的黨名
		mb.setFileName(originalFilename);
		System.out.println("originalFilename-------------->"+originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		
			try {
				byte[] b = memberImage.getBytes(); // 取出所有位元組
				Blob blob = new SerialBlob(b); // Blob是介面 所以new一個有實作他的類別SerialBlob
				mb.setHead_shot(blob); // 把blob放到BookBean裡面的coverImage裡
				System.out.println("改完後的圖片------mb.getHead_shot()-------->" + mb.getHead_shot());
				System.out.println("改完後的圖片------originalFilename-------->" + originalFilename);
				if (originalFilename=="" || originalFilename==null || originalFilename.trim()=="" || originalFilename.equals("")  ) {
					System.out.println("----------update with no cat----------");
					memberService.updateWithNoImage(mb2);
					System.out.println("----------update with no cat------- done---");
				
				}else {
					System.out.println("有上傳檔案哦------------>不是空或 空空 --------------------");
					mb2.setHead_shot(mb.getHead_shot());
					mb2.setFileName(originalFilename);
					model.addAttribute("memberData", mb2);
					memberService.update(mb2);
				}
	
			}catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		
		System.out.println("update success");
		return "member_25/tryMember_Ui";
	}

	@GetMapping("/try/delete")
	public String tryMemberDelete(@ModelAttribute("loginSession") membershipInformationBean mb, HttpSession session,
			HttpServletRequest request, HttpServletResponse response, SessionStatus sessionStatus, Model model) {
		System.out.println("membershipInformationBean --tryMemberDelete----->");

		memberService.deleteByName(mb.getUserEmail());
		System.out.println("------ 刪除完畢 ------");
		tologout(session, request, response, sessionStatus);
		System.out.println("------ 刪除session完畢 ------重新導向中...");
		return "redirect:/";
	}

	// 加入存取圖片
	// 把表格欄位的圖片抓出來往前端送
	// 要怎麼把blob抓出來改成byte陣列(圖片、檔案)
	@GetMapping("/getPicturefromMember/{id}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp,
			@ModelAttribute("memberUiDefault") membershipInformationBean mb) {
		System.out.println("------------------/getPicture/{id}------------------------id->" + mb.getId());
		// 萬一找不到圖的預設圖片
		String filePath = "NoImage2.jpg";
		// 要放的byte陣列
		byte[] media = null;
		// media - headers(表投)
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		// 用ID找到所有資料
		membershipInformationBean bean = memberService.findById(mb.getId());

		//		if (bean.getFileName() != null ||  !bean.getFileName().equals("")) {
//			Blob blob = bean.getHead_shot();
//			filename = bean.getFileName();
//			if (blob != null) { // 有圖片時
//				try { // 找長度
//					len = (int) blob.length();
//					media = blob.getBytes(1, len); // 地1個位元組(JDBC都是從1開始 0會掛掉)-最後一個取出放入
//					System.out.println("----------------有圖片哦------------blob------->" + blob);
//					System.out.println("----------------有圖片哦------------filename--->" + filename);
//				} catch (SQLException e) {
//					System.out.println("----------------圖片錯誤-------------");
//					throw new RuntimeException("MemberController的getPicture()發生SQLException: " + e.getMessage());
//				}
//				
//			} else { // 直接把檔案轉成byte放到media 然後放預設圖片上去
//				media = toByteArray(filePath);
//				filename = filePath;
//				System.out.println("----------------直接把檔案轉成byte放到media 然後放預設圖片上去-------------");
//			}
//		} 	
//		else {
//			media = toByteArray(filePath);
//			filename = filePath;
//			System.out.println("----------------直接把檔案轉成byte放到media 然後放預設圖片上去22-------------");
//
//		}
		
		
		if (bean.getFileName() == null ||  bean.getFileName().equals("")) {
			Blob blob = bean.getHead_shot();
			filename = bean.getFileName();
			
			media = toByteArray(filePath);
			filename = filePath;
			System.out.println("----------------直接把檔案轉成byte放到media 然後放預設圖片上去22-------------");			
		} 	
		else {
			Blob blob = bean.getHead_shot();
			if (blob != null) { // 有圖片時
				try { // 找長度
					len = (int) blob.length();
					media = blob.getBytes(1, len); // 地1個位元組(JDBC都是從1開始 0會掛掉)-最後一個取出放入
					System.out.println("----------------有圖片哦------------blob------->" + blob);
					System.out.println("----------------有圖片哦------------filename--->" + filename);
				} catch (SQLException e) {
					System.out.println("----------------圖片錯誤-------------");
					throw new RuntimeException("MemberController的getPicture()發生SQLException: " + e.getMessage());
				}
				
			} else { // 直接把檔案轉成byte放到media 然後放預設圖片上去
				media = toByteArray(filePath);
				filename = filePath;
				System.out.println("----------------直接把檔案轉成byte放到media 然後放預設圖片上去-------------");
			}
		}
		
		
		System.out.println("===================測試中=====================");
		
		
		
		System.out.println("filename最終版---------------->"+filePath);
		// 不要放去快取區
		System.out.println("----------------快取前-------------");
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		System.out.println("----------------快取後-------------");

		// 由黨名傳回對應的MimeType(image/jpg)
		String mimeType = servletContext.getMimeType(filename);
		System.out.println("----------------getMimeType後------------->" + mimeType);
		// spring要得式MediaType 所以用valueOf轉成要得東西
		MediaType mediaType;
		if (mimeType!=null) {
			 mediaType = MediaType.valueOf(mimeType);
		}else {
			mediaType = MediaType.valueOf("image/jpg");
		}
		System.out.println("----------------getMimeType 轉MediaType後-------------");
		System.out.println("mediaTypeForm member =" + mediaType);

		headers.setContentType(mediaType);
		// 開始建立
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	// 把路徑轉成位元組陣列
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		// 取出真的路徑 -------------------->
		String realPath = servletContext.getRealPath(filepath);
		   System.out.println("-----------開始讀取照片-----realPath-----"+realPath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size]; // 建立byte
			InputStream fis = servletContext.getResourceAsStream(filepath);
			fis.read(b); // 全部讀出
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
	
	
//	
//	(HttpSession session, HttpServletRequest request, HttpServletResponse response,
//			SessionStatus sessionStatus) {
//		session.removeAttribute("loginSession");
//		session.removeAttribute("memberUiDefault");
//	
	
	
	

	// 買家進化'
	@GetMapping("/member/evolution")
	public String buyerEvolution(@ModelAttribute("loginSession") membershipInformationBean mb, Model model) {
		membershipInformationBean mb2 = new membershipInformationBean();
		
		mb2 = memberService.findMemberDataAll(mb.getUserEmail());
		model.addAttribute("sellerData", mb2);
		
		
		if(!mb2.getIdentification().equals("seller")) {
			//包含驗證
			return "member_25/seller/member_Ui_seller_default";
		}
	
//		return "member_25/seller/member_Ui_seller";
		return "redirect:/member/seller_Ui_v";
	}
	//已認證賣家UI
	@GetMapping("/member/seller_Ui_v")
	public String seller_Ui_v(
			@ModelAttribute("sellerData") membershipInformationBean mb, 
			Model model) {
	
		return "member_25/member_Ui_buyer";		
	}
	//已認證賣家UI - 更新基本資料
	@PostMapping("/member/seller_Ui_v")
	public String processBuyerEvolution(@ModelAttribute("sellerData") membershipInformationBean mb, Model model) {
		membershipInformationBean mb2 = new membershipInformationBean();		
		model.addAttribute("byyerData", mb);
		return "member_25/member_Ui_buyer";
	}
	
	
	
	
	
	// 買家進化_ 驗證碼升級ing
		@PostMapping("/member/evolution")
		public String processBuyerEvolutionDefault(
				@ModelAttribute("sellerData") membershipInformationBean mb,
				@ModelAttribute("beanForVerificationCode") membershipInformationBean vcBean,
				@ModelAttribute("loginSession") membershipInformationBean loginMb,
				Model model) {
			membershipInformationBean mb2 = new membershipInformationBean();
		System.out.println("----beanForVerificationCode------"+vcBean.getVerificationCode());
		System.out.println("------sellerData-------"+mb.getVerifyCode());
			if (vcBean.getVerificationCode()==mb.getVerifyCode().intValue()) {
				//先撈出DB內所有資料給mb2
				mb2= memberService.findMemberDataAll(loginMb.getUserEmail());
				//在把表單的值給mb2
				mb2.setUserGender(mb.getUserGender());
				mb2.setUserName(mb.getUserName());
				mb2.setUserNickname(mb.getUserNickname());
				mb2.setUserPhone(mb.getUserPhone());
				mb2.setBirthday(mb.getBirthday());
				mb2.setAddress(mb.getAddress());
				mb2.setVerifyCode(null);
				
				//買家升級賣家
				mb2.setIdentification("seller");
				memberService.save(mb2);
				model.addAttribute("sellerData",mb2);
				return "member_25/seller/member_Ui_seller_success";		
			}
			
			model.addAttribute("byyerData", mb2);
			return "member_25/seller/member_Ui_seller_error";		
		}
		// 買家進化_認證升級2
		
	
	
	
	// 買家進化'
		@GetMapping("/member/seller_Ui")
		public String seller_Ui(@ModelAttribute("loginSession") membershipInformationBean mb, Model model) {
			membershipInformationBean mb2 = new membershipInformationBean();
			
			mb2 = memberService.findMemberDataAll(mb.getUserEmail());
			model.addAttribute("sellerData", mb2);
			
			
			if(!mb2.getIdentification().equals("seller")) {
				//包含驗證
				return "member_25/member_Ui_buyer_default";
			}
		
			return "member_25/seller/member_Ui_seller";
		}

//	// 管理者專用區
//	@GetMapping("/try/manager")
//	public String manager(@ModelAttribute("managerSession") membershipInformationBean mb, Model model) {
//		System.out.println("managerSession --manager----->" + mb.getUserEmail());
//
//		return "manager_Ui";
//	}

	// 管理者介面專用 - 展示會員資料
	@RequestMapping("/try/manager")
	public String list(Model model) {
		List<membershipInformationBean> memberList = memberService.selectAllUsers();
		model.addAttribute("memberList", memberList);
		model.addAttribute("member", new membershipInformationBean());

		return "member_25/manager_List";
	}
	
	
	@Autowired
	JavaMailSender mailSender;
	// 驗證信測試
	
	@GetMapping("/member/verifyBtn")
//	@ResponseStatus(value = HttpStatus.OK) //可以用void的方法 但沒啥用
	public String sendEmail(
			@ModelAttribute("sellerData") membershipInformationBean mb,
			@ModelAttribute("loginSession") membershipInformationBean mb2,
			Model model
			) {
		//驗證碼
		membershipInformationBean vtBtn = new membershipInformationBean();
		//存已輸入汁值
		membershipInformationBean mBean = new membershipInformationBean();
		int VerificationCode = (int) (Math.random()*10000);//產生從[0,10)
		
		SimpleMailMessage message =new SimpleMailMessage();
//		message.setTo(mb.getUserEmail());  //使用者email
		message.setTo("a2152265@gmail.com");  //測試用我的
		message.setSubject("BuyBuyLa Verification 最懂你的購物商城");
		message.setText("您好 : "+mb.getUserName()+"/n歡迎光臨BuyByLA  "+"您的驗證碼是:"+VerificationCode);	  
		mailSender.send(message); 
		System.out.println("------------------已寄出------------------ --->code="+VerificationCode);
		System.out.println("------------------已寄出------------------ --->code="+VerificationCode);
		System.out.println("------------------已寄出------------------ --->code="+VerificationCode);

		System.out.println("------------------loginSession------------------ --->code="+mb2.getUserEmail());
		System.out.println("------------------selletData------------------ --->code="+mb.getUserEmail());
		vtBtn.setVerificationCode(VerificationCode);
		model.addAttribute("beanForVerificationCode",vtBtn);
		
		
		//存已輸入汁值
		mBean=mb;
		
//		return "member_25/seller/member_Ui_seller_default";
		return "redirect:/member/evolution";
	}
	
	

}
