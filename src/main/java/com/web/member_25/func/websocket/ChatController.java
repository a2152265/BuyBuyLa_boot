package com.web.member_25.func.websocket;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.member_25.controller.TestLoginController;
import com.web.member_25.service.MemberService;



/**
 * 接收Client送來的WebSocket訊息及推送給前端的訊息
 */
@Controller
public class ChatController {
	String buybuysender="BuyBuy子";
	
	
	MemberService memberService;
	ServletContext servletContext; // get pic用

	@Autowired
	public ChatController(MemberService memberService, ServletContext servletContext) {
		this.memberService = memberService;
		this.servletContext = servletContext;
	}
	
	
	
	@GetMapping("/chat")
    public String index() {
        return "webchat/index";
    }
    
    /**
     * 處理前端加入聊天室的訊息，並把訊息推送給前端
     */
    @MessageMapping("/join")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, 
            SimpMessageHeaderAccessor headerAccessor) {
        // 把username加入WebSocket的Session
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        System.out.println("收到前端訊息---->"+chatMessage.getSender());
        System.out.println("發送者--->"+chatMessage);
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    
    /**
     * 處理前端送來的聊天訊息，並把訊息推送給前端
     */
    @MessageMapping("/chat")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
    	System.out.println("送回去的東東--getContent-->"+chatMessage.getContent());
    	System.out.println("送回去的東東---getSender-->"+chatMessage.getSender());
    	System.out.println("送回去的東東---getCharType-->"+chatMessage.getType());
    	System.out.println("送回去的東東--getClass--->"+chatMessage.getClass());
//    	chatMessage.setContent("測試controller送出的訊息");
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    
    @MessageMapping("/chatback")
    @SendTo("/topic/public") //只要有訂閱這個/topic/public的東東的人都會收到這個訊息 大概
    public ChatMessage sendMessageByme(@Payload ChatMessage chatMessage) {
    	if (login(chatMessage.getContent())==true) {
			System.out.println("成功登入---準備發送訊息");
			System.out.println("成功登入---準備發送訊息");
			chatMessage.setSender(buybuysender);
			chatMessage.setContent("成功登入 您的帳號為"+chatMessage.getContent());
			
		}else {
			chatMessage.setContent("測試controller送出的訊息2");
			chatMessage.setSender("BuyBuy子");
			System.out.println("處禮後返回的訊息--Content-->"+chatMessage.getContent());
			System.out.println("處禮後返回的訊息---Sender-->"+chatMessage.getSender());
			System.out.println("處禮後返回的訊息---CharType-->"+chatMessage.getType());
			System.out.println("處禮後返回的訊息--Class--->"+chatMessage.getClass());
		}
    	
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    @MessageMapping("/chatback2")
    @SendTo("/topic/public") //只要有訂閱這個/topic/public的東東的人都會收到這個訊息 大概
    public ChatMessage chatback(@Payload ChatMessage chatMessage) {
    	if (login(chatMessage.getContent())==true) {
			chatMessage.setContent("請問您還需要甚麼服務嗎?  輸入1查詢會員資料 輸入2給你一個微笑");
		}
    	
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    
    
//    @MessageMapping("user2")
//    @SendToUser(value = "/topic/greeting" )
//    public ChatMessage chatwithpeople(@Payload ChatMessage chatMessage) {
//    	if (login(chatMessage.getContent())==true) {
//			chatMessage.setContent("請問您還需要甚麼服務嗎?  輸入1查詢會員資料 輸入2給你一個微笑");
//		}
//    	
//    	System.out.println("AAA----getSender------->"+chatMessage.getSender());
//    	System.out.println("AAA----getContent------->"+chatMessage.getContent());
//    	
//        return chatMessage; // 返回時會將訊息送至/topic/public
//    }
    
    
    @MessageMapping("user3")
    @SendToUser(value = "/topic/public" ,broadcast = false)
    public ChatMessage processchatwithpeople(@Payload ChatMessage chatMessage) {
    	if (login(chatMessage.getContent())==true) {
			chatMessage.setContent("請問您還需要甚麼服務嗎?  輸入1查詢會員資料 輸入2給你一個微笑");
		}
    	System.out.println("BBB----getSender------->"+chatMessage.getSender());
    	System.out.println("BBB----getContent------->"+chatMessage.getContent());
    	System.out.println("user2動作中");
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    帳號判斷
    public boolean login(String account) {
    	int result=memberService.loginByEmail(account);
    	//登入結果   // 0錯誤 1成功 2無帳號 3重複帳號(除了自己+的應該不會出現這個可能)
    	if (result==1) {
    		System.out.println("成功登入");
    		return true;
		}
    	return false;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}