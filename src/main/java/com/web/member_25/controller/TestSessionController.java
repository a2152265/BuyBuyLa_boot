package com.web.member_25.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.member_25.model.membershipInformationBean;

@Controller
@SessionAttributes(value = {"book", "description"}, types = {Double.class})
public class TestSessionController {

	public TestSessionController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@RequestMapping("/session")
    public String index(Model model, HttpSession httpSession) {
        model.addAttribute("book", "天龍八部");
        model.addAttribute("description", "我喬峰是個契丹人");
        model.addAttribute("price", new Double("1000.00"));

        // 通過Sesson API手動放一個進去
        httpSession.setAttribute("hero", "fsx");

        //跳轉之前將資料儲存到Model中，因為註解@SessionAttribute中有，所以book和description應該都會儲存到SessionAttributes裡（注意：不是session裡）
        return "redirect:get";
    }

    // 關於@ModelAttribute 下文會講
    @RequestMapping("/get")
    public String get(@ModelAttribute("book") String book, ModelMap model, HttpSession httpSession, SessionStatus sessionStatus) {
        //可以從model中獲得book、description和price的引數
        System.out.println(model.get("book") + ";" + model.get("description") + ";" + model.get("price"));

        // 從sesson中也能拿到值
        System.out.println(httpSession.getAttribute("book"));
        System.out.println("API方式手動放進去的：" + httpSession.getAttribute("hero"));
        // 使用@ModelAttribute也能拿到值
        System.out.println(book);

        // 手動清除SessionAttributes
        sessionStatus.setComplete();
        return "redirect:complete";
    }

    @RequestMapping("/complete")
    @ResponseBody
    public String complete(ModelMap modelMap, HttpSession httpSession) {
        //已經被清除，無法獲取book的值
        System.out.println(modelMap.get("book"));
        System.out.println("API方式手動放進去的：" + httpSession.getAttribute("hero"));
        return "sessionAttribute";
    }
    
//    @GetMapping("/member/update")
//	public String getMemberUpdateTest(	
//			@ModelAttribute("loginSessionBean3") membershipInformationBean mb2,
//			
//			Model model) {
//		membershipInformationBean mb=new membershipInformationBean();
//		//設定預設值
//		  //順序 model (不用set)- 下一個post要set才會存進去(縣市再頁面) 
////		System.out.println("update初始抓登入的bean的值 EMAIL = "  +mb2.getUserEmail());
////		mb.setUserEmail(mb2.getUserEmail());
////		mb.setUserName(mb2.getUserName());
////		model.addAttribute("loginSessionBeanDefault",mb);
//		System.out.println("@ModelAttribute   loginSessionBean2->>>>>>>>>>>>>>>>>"+mb2.getUserEmail());
////		System.out.println("userEmail =>>>>>>>>>>>>"+userEmail);
//		
//		return "member_Ui";
//	}
    
    

}
