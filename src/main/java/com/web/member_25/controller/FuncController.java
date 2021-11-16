package com.web.member_25.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.annotation.security.PermitAll;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.web.member_25.model.membershipInformationBean;
import com.web.member_25.service.MemberService;

@Controller
@SessionAttributes({ "loginSession", "memberUiDefault", "managerSession","beanForVerificationCode","sellerData","changePwd","memberList" })
public class FuncController {
	
	MemberService memberService;
	ServletContext servletContext; // get pic用

	@Autowired
	public FuncController(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	}
	
	public FuncController() {
	
	}
	
	
	
	@Autowired
    DefaultKaptcha defaultKaptcha;
	//獲取驗證碼
    @RequestMapping("/getCode")
    public void defaultKaptcha(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception{
        byte[] captchaChallengeAsJpeg = null;
        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
        
        try {
        	System.out.println("-----------------");
            //生產驗證碼字串並儲存到session中
            String createText = defaultKaptcha.createText();
            httpServletRequest.getSession().setAttribute("vrifyCode", createText);
            //使用生產的驗證碼字串返回一個BufferedImage物件並轉為byte寫入到byte陣列中
            BufferedImage challenge = defaultKaptcha.createImage(createText);
            ImageIO.write(challenge, "jpg", jpegOutputStream);
        } catch (IllegalArgumentException e) {
            httpServletResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        //定義response輸出型別為image/jpeg型別，使用response輸出流輸出圖片的byte陣列
        captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
        httpServletResponse.setHeader("Cache-Control", "no-store");
        httpServletResponse.setHeader("Pragma", "no-cache");
        httpServletResponse.setDateHeader("Expires", 0);
        httpServletResponse.setContentType("image/jpeg");
        ServletOutputStream responseOutputStream =
                httpServletResponse.getOutputStream();
        responseOutputStream.write(captchaChallengeAsJpeg);
        responseOutputStream.flush();
        responseOutputStream.close();
    }
	
  //驗證碼驗證
    @RequestMapping("/checkCode")
    @ResponseBody
    public boolean imgvrifyControllerDefaultKaptcha(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse){
        String captchaId = (String) httpServletRequest.getSession().getAttribute("vrifyCode");
        String parameter = httpServletRequest.getParameter("code");
//        log.info("Session  vrifyCode ---->"+captchaId+"---- form code --->"+parameter);
        if (!captchaId.equals(parameter)) {
//            log.info("錯誤的驗證碼");
            System.out.println("<-----錯誤的驗證碼---->");
            return false;
        } else {
            return true;
        }
    }
    
    @GetMapping("/nb")
    public String dd() {
    	return "test";
    }
    
    
    @PermitAll
    @RequestMapping(value = "/payment-stage")
    public String externalAuth() {
    	System.out.println("------------------外部網站給過------------------------");
    	System.out.println("------------------外部網站給過------------------------");
    	System.out.println("------------------外部網站給過-----------------------------");
    	String Url=".ecpay.com.tw/Cashier/AioCheckOut/V5#";
//        if(someCondition) 
        	return "redirect:" + Url; // [1] https://external-service.com 
//        else return "redirect:/";
    }
    
    
    
    //忘記密碼 -->驗證
    @RequestMapping("/resetpp")
    public String resetpp(Model model,
    		@RequestParam("member_pwdToken") String member_pwdToken,
    		@RequestParam("userEmail") String userEmail,
    		@ModelAttribute("loginSession") membershipInformationBean mb
    		) {
    	membershipInformationBean dataMb=memberService.findMemberDataByToken(member_pwdToken);
    	System.out.println("----忘記密碼信-----userEmail---->"+userEmail);
    	
    	String timeLimit[]=dataMb.getMember_pwdToken_time().split(":");
    	
    	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		String now = dtf.format(LocalDateTime.now());
    	String noww[]=now.split(":");
    	System.out.println("now[]------------>"+noww[1]);
    	System.out.println("timeLimit[]------------>"+timeLimit[1]);
    	if ( Integer.valueOf(noww[1] ) - Integer.valueOf(timeLimit[1])  >5) {
    		System.out.println("逾時囉----->");
			return "member_25/forgetpwd/forgetPage_timeOut";
		}
    	
    	return "member_25/forgetpwd/resetPwd";
    }
    
    @PostMapping("/resetpp")
    public String processResetpp(Model model,@ModelAttribute("loginSession") membershipInformationBean mb) {
    	System.out.println("新pwd--->"+mb.getUserPwd());
    	membershipInformationBean dataMb=memberService.findMemberDataAll(mb.getUserEmail());
    
    	dataMb.setUserPwd(new BCryptPasswordEncoder().encode(mb.getUserPwd()));
    	memberService.save(dataMb);
    	System.out.println("-------->忘記密碼done------------->"+dataMb.getUserPwd());
    	return "redirect:/";
    }
    
    
    
    
	
	
	

}
