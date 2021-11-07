package com.web.member_25.func.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;


/**
 * WebSocket連線事件監聽器
 */
@Component
public class WebSocketEventListener {
    
    /** STOMP 訊息發送器 */
    @Autowired
    private SimpMessageSendingOperations messagingTemplate;
    
    

    /**
     * 連線時的處理
     */
    @EventListener
    public void handleWebSocketConnectListener(SessionConnectedEvent event) {
        System.out.println("收到一個新的WebSocket連線");
    }
    
    /**
     * 離線時的處理
     */
    @EventListener
    public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());

        // 從WebSocket Session中取得使用者名稱
        String username = (String) headerAccessor.getSessionAttributes().get("username");
        if(username != null) {
            System.out.println("使用者" + username + "已離線");

            // 建立一個離線訊息送給前端
            ChatMessage chatMessage = new ChatMessage();
            chatMessage.setType(ChatMessage.ChatType.LEAVE);
            chatMessage.setSender(username);

            messagingTemplate.convertAndSend("/topic/public", chatMessage);
        }
    }
    
    
    
    
    @Scheduled(fixedRate = 3000)//每隔3秒向客戶端傳送一次資料
    public void sendMessage() {
    	System.out.println("3秒寄出data中....");
    	messagingTemplate.convertAndSend("/app/join", "我是從伺服器來的訊息!");//將訊息推送給‘、topic/ip’的客戶端
    }
    
}