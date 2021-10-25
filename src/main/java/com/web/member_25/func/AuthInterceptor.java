package com.web.member_25.func;

import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.web.member_25.model.membershipInformationBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author HP
 * @data 2020-12-14
 *
 *       新建攔截器
 *
 *       自定義攔截器
 */
@Component
public class AuthInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 攔截處理程式碼

		// 靜態資源不被攔截器攔截
        String uri = request.getRequestURI();
        if (uri.endsWith("js")||uri.endsWith("css")||uri.endsWith("jpg")||uri.endsWith("svg")||uri.endsWith("jpg")||uri.endsWith("png")){
            return true ;
        }
        
      //因為這個好像也是傳統servelet的寫法
        //不知道有沒有可以代替上面session的寫法嗎 例如用我們自己管理session工廠
        HttpSession session = request.getSession();
        
        
        //  或者說可以把controller那邊的model.addAttribute("loginSessionBean",mb);
        // 把這個add進去的model的值拉到這邊來
//        membershipInformationBean mbBean=new membershipInformationBean();
//	mbBean=(membershipInformationBean)session.getAttribute("loginSessionBean");
        

        // 獲取使用者資訊，如果沒有使用者資訊直接返回提示資訊
        Object userInfo = session.getAttribute("loginUser");
        if (userInfo == null) {
            request.setAttribute("msg","請先登入！");
            System.out.println("------------    no login  --------------------------");
//            request.getRequestDispatcher("logging").forward(request, response);
            return true;
        } else {
        	System.out.println("iiiiiiiiiiii    login         iiiiiiiiiiiiiiiiiiii");

        }
		
		
		
		
		
//		HttpSession session = request.getSession();
//		membershipInformationBean mbBean=new membershipInformationBean();
////		Object userInfo = session.getAttribute("loginSessionBean");
//		mbBean=(membershipInformationBean)session.getAttribute("loginSessionBean");
////		System.out.println("攔截器中loginSessionBean----------->"+mbBean.getUserEmail());
//		System.out.println("hihi");
//		
//		if (mbBean == null) {
//			System.out.println("請登入==================----------------");
//			request.setAttribute("msg", "請先登入！");
//			System.out.println("請登入----------------");
//			
////			request.getRequestDispatcher("logging").forward(request, response);
//			return true;
//		} else {
//			System.out.println("攔截器中loginSessionBean----------->"+mbBean.getUserEmail());
//			System.out.println("-------------------?哦哦 loginSessionBean  有值哦");
//		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}
}