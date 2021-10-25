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

import com.web.member_25.func.MemberValidator;
import com.web.member_25.func.ProcessImage;
import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;

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
		}else {
			System.out.println("無錯誤-----帳號-------->"+mb.getUserEmail());
			System.out.println("無錯誤------密碼------->"+mb.getUserPwd());
	
		}
		
		

		System.out.println("-------------表單檢查無錯誤-------------");
		System.out.println("-------> mb = " + mb);
		System.out.println("---->mb.ID=" + mb.getId());
		System.out.println("---->mb.ID=" + mb.getUserEmail());
		System.out.println("---->mb.getIdentification=" + mb.getIdentification());

		Boolean loginResult=false;
		
		loginResult = memberService.overlappedAccount(mb.getUserEmail());
		System.out.println("----done------------------------=");
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
			//先建立一個bean
			model.addAttribute("sellerData", new membershipInformationBean());
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
		//先查DB的會員資料再去把表單的資料塞過去
		mb2=memberService.findMemberDataAll(mb.getUserEmail());
		System.out.println("mb.getUserGender()+++++"+mb.getUserGender());
		System.out.println("mb.getUserName()+++++"+mb.getUserName());
		mb2.setUserEmail(mb.getUserEmail());
		mb2.setUserPwd(mb.getUserPwd());
		mb2.setAddress(mb.getAddress());
		mb2.setUserGender(mb.getUserGender());
		mb2.setUserPhone(mb.getUserPhone());
		mb2.setUserName(mb.getUserName());
		mb2.setUserNickname(mb.getUserNickname());
		mb2.setBirthday(mb.getBirthday());
		mb2.setIdentification(mb.getIdentification());
		System.out.println("setIdentification---------->"+mb2.getIdentification());
	
		
		//下面是個處理好的bean 待update
		mb2= new ProcessImage().uploadImage(mb2,mb);
		System.out.println("setIdentification2---------->"+mb2.getIdentification());
		System.out.println("-------------開始存入");
		memberService.save(mb2);
		System.out.println("-------------存入完畢");
		
	model.addAttribute("memberData", mb2);	
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

	
	
	
//	
//	(HttpSession session, HttpServletRequest request, HttpServletResponse response,
//			SessionStatus sessionStatus) {
//		session.removeAttribute("loginSession");
//		session.removeAttribute("memberUiDefault");
//	
	
	
	

	// 買家進化'
	@GetMapping("/member/evolution")
	public String buyerEvolution(@ModelAttribute("loginSession") membershipInformationBean mb, 
			@ModelAttribute("sellerData") membershipInformationBean sellerDataMb, 
			Model model) {
		
		//sellerData初始化設定
//		model.addAttribute("sellerData", sellerDataMb);
		System.out.println("------sellerData 驗證後資料 name----------------?"+sellerDataMb.getUserName());
		
		membershipInformationBean mb2 = new membershipInformationBean();
		
		mb2 = memberService.findMemberDataAll(mb.getUserEmail());
		model.addAttribute("sellerData", mb2);
		
		System.out.println("---------------判斷會員資格中-----------------");
		if(!mb2.getIdentification().equals("seller")) {

			System.out.println("---------------未認證會員-----------------");
			//包含驗證
			return "member_25/seller/member_Ui_seller_default";
		}
		System.out.println("---------準備進入已認證賣家中心---------");
//		return "member_25/seller/member_Ui_seller";
		return "redirect:/member/seller_Ui_v";
	}
	//已認證賣家UI
	@GetMapping("/member/seller_Ui_v")
	public String seller_Ui_v(
			@ModelAttribute("sellerData") membershipInformationBean mb,
			@ModelAttribute("loginSession") membershipInformationBean mb3, 
			Model model) {
		membershipInformationBean mb2 = new membershipInformationBean();			
	mb=memberService.findMemberDataAll(mb.getUserEmail());
	System.out.println("---------預載已認證賣家中心---------");
		return "member_25/seller/member_Ui_seller";		
	}
	//已認證賣家UI - 更新基本資料
	@PostMapping("/member/seller_Ui_v")
	public String processBuyerEvolution(@ModelAttribute("sellerData") membershipInformationBean mb, Model model) {
		membershipInformationBean mb2 = new membershipInformationBean();
		System.out.println("---------已認證賣家中心更新資料---------");
		memberService.save(mb);
		System.out.println("---------已認證賣家中心更新資料完畢---------");
		model.addAttribute("sellerData", mb);
		return "member_25/seller/member_Ui_seller";
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

		return "member_25/manager/manager_List";
	}
	
	
	@Autowired
	JavaMailSender mailSender;
	// 驗證信測試
	
//	@ResponseStatus(value = HttpStatus.OK) //可以用void的方法 但沒啥用
	@GetMapping("/member/verifyBtn")
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
		System.out.println("----------------?mb.getUserName()------?"+mb.getUserName());
		model.addAttribute("sellerData",mBean);
//		return "member_25/seller/member_Ui_seller_default";
		return "redirect:/member/evolution";
	}
	
	
	@GetMapping("/member/verifyBtne")
	public String sendEmailForgetPwd(
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
		System.out.println("----------------?mb.getUserName()------?"+mb.getUserName());
		model.addAttribute("sellerData",mBean);
//		return "member_25/seller/member_Ui_seller_default";
		return "redirect:/member/evolution";
	}
	

}
