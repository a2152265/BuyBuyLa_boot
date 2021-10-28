package com.web.member_25.controller;

import java.util.List;
import java.util.Optional;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.lang.Exception;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLException;
import com.web.member_25.func.MemberException;
import com.web.member_25.func.MemberValidator;
import com.web.member_25.func.ProcessImage;
import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;

@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData","changePwd" })
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
		return "member_25/signUpPage";
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
			return "member_25/signUpPage";
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

			return "member_25/signUpPage_error";

		} else if (loginResult == true) {

			System.out.println("無人使用此帳號 已註冊  ----->");
			mb.setIdentification("member");
			
			
			
			
			memberService.save(mb);
			return "product_11/products";
		}
		return "member_25/signUpPage";

	}
	@GetMapping("/try/login")
	public String tryLogin(Model model) {
		model.addAttribute("beanForVerificationCode", new membershipInformationBean());
		model.addAttribute("loginSession", new membershipInformationBean());
		model.addAttribute("sellerData", new membershipInformationBean());
		return "member_25/loginpage";
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
				return "redirect:/manager_Ui";
			}
			System.out.println("登入成功 userEmail  ----->" + userEmail);
			mb2.setUserEmail(userEmail);
			mb2.setUserPwd(userPwd);
			model.addAttribute("loginSession", mb2);
			membershipInformationBean mb3 =memberService.findMemberData(mb2.getUserEmail());
			model.addAttribute("memberUiDefault",mb3);
			//先建立一個bean
			model.addAttribute("sellerData", new membershipInformationBean());
			return "redirect:/"; // 登入成功

		} else if (loginResult == 2) {
			System.out.println("查無帳號  ----->");
			return "member_25/loginpage_error";
		} else if (loginResult == 3) {
			System.out.println("帳號重複  ----->");
			return "member_25/loginpage_error";
		}

		return "member_25/loginpage";
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
		
		return "member_25/member_Ui";
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
		return "member_25/member_Ui";
	}

	@GetMapping("/try/delete")
	public String tryMemberDelete(@ModelAttribute("loginSession") membershipInformationBean mb, HttpSession session,
			HttpServletRequest request, HttpServletResponse response, SessionStatus sessionStatus, Model model) {
		System.out.println("membershipInformationBean --tryMemberDelete----->");

		memberService.deleteByName(mb.getUserEmail());
		System.out.println("------ 刪除完畢 ------");
		tologout(session, request, response, sessionStatus);
		System.out.println("------ 刪除session完畢 ------重新導向中...");
			System.out.println("de---------------------------");
		return "member_25/alertPage_delete";
	}
	
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
//			model.addAttribute("beanForVerificationCode",new membershipInformationBean());
			model.addAttribute("memberUiDefault",new membershipInformationBean());
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
			mb2=memberService.findMemberDataAll(loginMb.getUserEmail());
	
			try {
				System.out.println("------進入驗證馬環節-------");
				int vcode=vcBean.getVerificationCode();
				
				
				if (vcode==0 || Integer.valueOf(vcode)==null ) {
//			throw new MemberException("很抱歉"+loginMb.getUserEmail()+ "    我們找不到驗證碼");
					System.out.println("---未輸入偽證馬---getVerificationCode--------------->"+vcBean.getVerificationCode());
					return "member_25/seller/member_Ui_seller_error";
				}
				
				System.out.println("----beanForVerificationCode------"+vcBean.getVerificationCode());
				System.out.println("------sellerData-------"+mb.getVerifyCode());
				
					if (vcode==mb.getVerifyCode()) {
						System.out.println("進入驗證碼確認環節");
						//先撈出DB內所有資料給mb2
//						mb2= memberService.findMemberDataAll(loginMb.getUserEmail());
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
				
			} catch (Exception e) {
				System.out.println("驗證碼沒輸入出錯拉");
				return "member_25/seller/member_Ui_seller_error";
			}
			
		
			System.out.println("------sellerData--  error    -----"+mb.getVerifyCode());
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
//	@GetMapping("/manager_Ui")
//	public String manager(@ModelAttribute("managerSession") membershipInformationBean mb, Model model) {
//		System.out.println("managerSession --manager----->" + mb.getUserEmail());
//
//		return "manager_Ui";
//	}

	// 管理者介面專用 - 展示會員資料
	@RequestMapping("/manager_Ui")
	public String list(Model model) {
		List<membershipInformationBean> memberList = memberService.selectAllUsers();
		model.addAttribute("memberList", memberList);
		model.addAttribute("member", new membershipInformationBean());
		model.addAttribute("memberEdit", new membershipInformationBean());
		System.out.println("---------------展示會員資料----------------");
		
		return "member_25/manager/manager_List";
	}
	
	// 管理者介面專用 - 修改會員資料
		@PostMapping("/manager_Ui")
		public String listChange(Model model) {
			List<membershipInformationBean> memberList = memberService.selectAllUsers();
			model.addAttribute("memberList", memberList);
//			model.addAttribute("member", new membershipInformationBean());
			model.addAttribute("memberEdit", new membershipInformationBean());

			
			return "member_25/manager/manager_List";
		}
		
	
	@Autowired
	JavaMailSender mailSender;
	
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
	
		return "redirect:/member/evolution";
	}
	
	
	@PostMapping("/memberEdit?id={id}")
	public String edit(
			@ModelAttribute("managerSession") membershipInformationBean managerMb,
			@ModelAttribute("memberList") membershipInformationBean mb,
			@ModelAttribute("memberEdit") membershipInformationBean editMb,
			@PathVariable int id,
			BindingResult result, // 老爸 is errors (表單有任何錯誤都放到這裡)
			Model model
			) {
		System.out.println("editMb----->"+editMb.getUserEmail());
		System.out.println("editMb----->"+editMb.getIdentification());
		
		new MemberValidator().validate(mb, result);
		System.out.println("修改會員(PUT, 11-05): " + mb);
		if (result.hasErrors()) {
			System.out.println("======================");
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				System.out.println("有錯誤：" + error);
			}
			System.out.println("======================");
//			return "member_25/manager/manager_List";
			return "redirect:/memberEdit?id={id}";
		}else {
			System.out.println("無錯誤-----帳號-------->"+mb.getUserEmail());
			System.out.println("無錯誤------密碼------->"+mb.getUserPwd());
	
		}
			
		return "member_25/manager/manager_List";
	}
	
	
	
	
	
	
	@GetMapping("/manager/edit{id}")
	public String managerUpdteD(Model model, 
			@PathVariable(required=false) Integer id) {
		
		System.out.println("進入-------GetMapping" );
		if (id == null) {
			throw new RuntimeException("請求未提供會員Id");
		}
		Optional<membershipInformationBean> optional = memberService.findById(id);
		if (optional.isPresent()) {
			System.out.println("----------進入館員修改");
			membershipInformationBean bean=optional.get();
			bean.setUserPwd1(bean.getUserPwd());
			model.addAttribute("memberDataDefault",bean);
		}
		return "member_25/manager/manager_edit";
	}
	
	@PostMapping("/manager/edit{id}")
	public String processmanagerUpdteD(Model model,
//			@ModelAttribute("memberDataDefault") membershipInformationBean debean, 
			@ModelAttribute("memberDataDefault") membershipInformationBean bean, 
			BindingResult result, 
			@PathVariable(required=false) Integer id) {

		System.out.println("進入-------?PostMapping" );
		System.out.println("------------------->"+bean.getAddress());
		System.out.println("------------------->"+bean.getBirthday());
		System.out.println("------------------->"+bean.getFileName());
		System.out.println("------------------->"+bean.getIdentification());
		System.out.println("------------------->"+bean.getUserEmail());
		Optional<membershipInformationBean> dataBeanD=memberService.findById(id);
		membershipInformationBean dataBean=dataBeanD.get();
		System.out.println("databean----  id---->"+dataBean.getId());
		System.out.println("---------getUserEmail---------->"+dataBean.getUserEmail());
		dataBean.setUserName(bean.getUserName());
		dataBean.setUserNickname(bean.getUserNickname());
		dataBean.setUserPhone(bean.getUserPhone());
		dataBean.setUserPwd(bean.getUserPwd());
		dataBean.setAddress(bean.getAddress());
		dataBean.setUserGender(bean.getUserGender());
		dataBean.setIdentification(bean.getIdentification());
		dataBean.setNotes(bean.getNotes());
		
//		new MemberValidator().validate(bean, result);
//
//		if (result.hasErrors()) {
//			System.out.println("進入-------?PostMapping-----有錯誤" );
//			return "member_25/manager/manager_edit";
//		}
		System.out.println("沒有錯誤 save完成" + dataBean);
		memberService.save(dataBean);
		return "redirect:/manager_Ui";
	}
	
	
	//更改密碼區
	@GetMapping("/member/changePwd_check")
	public String changePwd(Model model ) {
		model.addAttribute("changePwd",new membershipInformationBean());
		return "member_25/member_Ui_changePwd_defalut";
	}
	
	@PostMapping("/member/changePwd_check")
	public String processChangePwd(@ModelAttribute("loginSession") membershipInformationBean bean,
			@ModelAttribute("changePwd") membershipInformationBean changeBean,
			Model model ) {
		membershipInformationBean mBean=memberService.findMemberData(bean.getUserEmail());
		System.out.println("----changeBean->"+changeBean.getUserPwd());
		System.out.println("----mBean->"+mBean.getUserPwd());
		if(mBean.getUserPwd().equals(changeBean.getUserPwd())) {
			model.addAttribute("changePwd",changeBean);
			System.out.println("確認舊密碼成功 -->"+changeBean.getUserPwd());
			return "redirect:/member/changePwd_checkcheck";
		}
		System.out.println("確認密碼失敗");
		return "member_25/member_Ui_changePwd_checkerror";
	}
	
	@GetMapping("/member/changePwd_checkcheck")
	public String gchangePwdcheck_success(@ModelAttribute("changePwd") membershipInformationBean bean,
			@ModelAttribute("loginSession") membershipInformationBean loginBean,
			Model model) {
		System.out.println("get ------------checkon");
		return "member_25/member_Ui_changePwd_checkon";
	}
	
	@PostMapping("/member/changePwd_checkcheck")
	public String changePwdcheck_success(@ModelAttribute("changePwd") membershipInformationBean bean,
			@ModelAttribute("loginSession") membershipInformationBean loginBean,
			SessionStatus sessionStatus,
			Model model) {
		System.out.println("post ------------checkon");
		membershipInformationBean mBean=memberService.findMemberData(loginBean.getUserEmail());
		mBean.setUserPwd(bean.getUserPwd());
		System.out.println("bean.getUserPwd()---更改密碼完成-------->"+mBean.getUserPwd());
		memberService.save(mBean);
		System.out.println("更改密碼完成-------->");
	
			sessionStatus.setComplete();
			System.out.println("已清除 登入狀態");
		
		//清除登入狀態
		return "member_25/alertPage_changePwdsuccess";
	}
	
	
	
	
	
	//暫時沒用到
	@PutMapping("/manager/edit{id}")
	public String save(@ModelAttribute("memberData") membershipInformationBean bean, 
			BindingResult result, 
			@PathVariable Integer id
			) {
		System.out.println("in @PutMapping, bean=" + bean);
		System.out.println("in @PutMapping, bean=" + bean);
		System.out.println("in @PutMapping, bean=" + bean);
		System.out.println("in @PutMapping, bean=" + bean);
		System.out.println("in @PutMapping, bean=" + bean);
		System.out.println("in @PutMapping, bean=" + bean);
		new MemberValidator().validate(bean, result);
		if (result.hasErrors()) {
			//
			return "member_25/manager/manager_edit";
		}
		System.out.println("沒有錯誤 save完成" + bean);
		memberService.save(bean);
		return "redirect:/member_25/manager/manager_List";
	}
	
	//管理員刪除資料
	@DeleteMapping("/manager/edit{id}")
	public String processManagerDelete(Model model, @PathVariable(required=false) Integer id) {
		if (id == null) {
			throw new RuntimeException("請求未提供會員Id");
		}
		Optional<membershipInformationBean> optional = memberService.findById(id);
		if (optional.isPresent()) {
			membershipInformationBean bean = optional.get();
			memberService.deleteMemberByPrimaryKey(bean.getId());
		} else {
			throw new RuntimeException("會員Id不存在");
		}
		
		return "redirect:/manager_Ui";
	}
	//管理員刪除資料
		@GetMapping("/manager/delete{id}")
		public String processManagerDelete_outside(Model model, @PathVariable(required=false) Integer id) {
			if (id == null) {
				throw new RuntimeException("請求未提供會員Id");
			}
			Optional<membershipInformationBean> optional = memberService.findById(id);
			if (optional.isPresent()) {
				membershipInformationBean bean = optional.get();
				memberService.deleteMemberByPrimaryKey(bean.getId());
			} else {
				throw new RuntimeException("會員Id不存在");
			}
			
			return "redirect:/manager_Ui";
		}
		//管理員刪除資料
				@PostMapping("/manager/delete{id}")
				public String processManagerDelete_inside(Model model, @PathVariable(required=false) Integer id) {
					if (id == null) {
						throw new RuntimeException("請求未提供會員Id");
					}
					Optional<membershipInformationBean> optional = memberService.findById(id);
					if (optional.isPresent()) { 
						membershipInformationBean bean = optional.get();
						memberService.deleteMemberByPrimaryKey(bean.getId());
					} else {
						throw new RuntimeException("會員Id不存在");
					}
					System.out.println("----------已刪除會員資料");
					return "redirect:/manager_Ui";
				}
		
//				//錯誤頁面
//				@ExceptionHandler({MemberException.class,Exception.class,SQLException.class,NullPointerException.class})
//				public String handleError(HttpServletRequest request,
//						MemberException exception,Model model) {
//				
//					model.addAttribute("exception", exception);
//					model.addAttribute("url", request.getRequestURL()+"?" + request.getQueryString());
//					return "MemberErrorPage";
//				}
				
				
				
				@GetMapping("/seller/inschan")
				public String inschan() {
					return "member_25/seller/member_Ui_seller_inschan";
				}
				@GetMapping("/member/inschan")
				public String member_inschan() {
					return "member_25/seller/member_Ui_seller_inschan";
				}
	
	

}
