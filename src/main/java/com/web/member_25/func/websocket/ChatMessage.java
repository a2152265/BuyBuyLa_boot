package com.web.member_25.func.websocket;

/**
 * 傳輸的訊息
 */
public class ChatMessage {
    /** 訊息種類 */
    private ChatType type;
    /** 訊息發送者的名稱 */
    private String sender;
    /** 訊息內容 */
    private String content;

    /**
     * 訊息種類Enum
     */
    public enum ChatType {
        CHAT,
        JOIN,
        LEAVE
    }
    
    
   // getter setter 
  //--------------------------------
    //但在run專案的時候仍然失敗，可以輸入名字但不會顯示某某某進入聊天室以及打訊息時按送出也並無跳至聊天室窗裡
//    public void setType(ChatType type) {
//    	this.type = type;
//    	}
//    	public ChatType getType() {
//    	return type;
//    	}
////---------------------------------------------
//    	public void setSender(String sender) {
//    	this.sender = sender;
//    	}
//
//    	public String getSender() {
//    	return this.sender;
//    	}
//
//    	public void setContent(String content) {
//    	this.content = content;
//    	}
//
//    	public String getContent() {
//    	return this.content;
//    	}
    
    
    public void setCharType(ChatType type) {
    	this.type = type;
    	}

    	public ChatType getCharType() {
    	return this.type;
    	}

    	public void setSender(String sender) {
    	this.sender = sender;
    	}

    	public String getSender() {
    	return this.sender;
    	}

    	public void setContent(String content) {
    	this.content = content;
    	}

    	public String getContent() {
    	return this.content;
    	}
    
    
    
    
    
}