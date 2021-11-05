
 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../Home/member/member_25/header.jspf"%>
<!-- sidebar -->>
<%@ include file="../Home/member/member_25/sidebar.jspf"%>
                          
                               <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4"> 修改會員資料 </p>
                       
                            <!-- 修改表單開始 -->
                          <form:form method='POST' modelAttribute="memberUiDefault"
                          class="mx-1 mx-md-4" enctype="multipart/form-data">
                       

                          <div class="d-flex flex-row align-items-center mb-4">
                            <i class="fas fa-user fa-lg me-3 fa-fw"  style="margin-bottom: 10px; " ></i>
                            <div class="form-outline flex-fill mb-0">
                               &nbsp; Hi!!! &nbsp;&nbsp;  ${memberUiDefault.userEmail} 
                              <label class="form-label" for="form3Example1c">帳號</label>
                            </div>
                          </div>
          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                             <form:input id="userNickname" path="userNickname" type="text"  class="form-control" placeholder="暱稱" />
                                 </div>
                            </div>
          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                <form:input id="userName" path="userName" class="form-control" type='text'  placeholder="姓名" />
                                  </div>
                            </div>
          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-phone fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                <form:input id="userPhone" path="userPhone" type='text' class="form-control"  placeholder="手機"  />
                                </div>
                            </div>
          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-birthday-cake fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                                <form:input id="birthday" path="birthday" type='text' class="form-control"  placeholder="生日"  />
                                 </div>
                            </div>                       

                              <div class="d-flex flex-row align-items-center mb-4">
                                <i class="fas fa-Genderless fa-lg me-3 fa-fw"></i>
                                <div class="form-outline flex-fill mb-0">
                                    <label>  <form:radiobutton id="userGender" path="userGender" value="男性" label="男性" /> 
                                    </label> 
                               <label>     <form:radiobutton id="userGender" path="userGender" value="女性" label="女性" /> 
                                 </label>  
                                 <label>     <form:radiobutton id="userGender" path="userGender" value="其他" label="其他" /> 
                                 </label>
                                   </div>
                              </div>

                              <div class="d-flex flex-row align-items-center mb-4">
                                <i class="fas fa-Genderless fa-lg me-3 fa-fw"></i>
                                <div class="form-outline flex-fill mb-0">
                                  <form:input id="address" path="address" type='text' class="form-control" placeholder="地址" />
                                   </div>
                              </div>
          
                            
          
                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                              <input type="submit" id="submitRewrite" name="submitRewrite" class="btn btn-primary btn-lg" value="送出修改">
                            </div>

                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                <input type="button" id="onejan" name="submitRewrite" class="btn btn-primary btn-lg" value="一鍵輸入">
                              </div>
                              
                              <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                              <a href="<c:url value='/member/suspension' />">
                      				  <span class="icon"><i class="fas fa-database"></i></span>
                     				   <span class="item">停用帳號</span>
                  				  </a>
          						 </div>
          
                        </div>
                        
                        
            
                 <!-- 讀取圖片 --> 
               <img  src="<c:url value='/getPicturefromMember/${memberUiDefault.id}'/>" 
                   class="img-fluid" alt="Sample image"  style="width: 50%;  height:50%;" />
         
                        <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
          

                            
                    <!-- 上傳圖片 -->
                   	<form>
                      <div class="custom-file" style="width: 250px;">
                        <form:input type="file"  path="productImage" class="custom-file-input" id="productImage"  />
                        <br><br> <label class="custom-file-label" for="customFile">選擇大頭貼</label> 
                      </div>
						</form>

                    </form:form> 

                          <!-- <img src="https://mdbootstrap.com/img/Photos/new-templates/bootstrap-registration/draw1.png" class="img-fluid" alt="Sample image"> -->
          
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  
                  
                  
               

       
       <!-- 放入聊天室 -->
        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
    BuyBuy子在此為您服務
  </button>
  
  <!-- Modal -->
  <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">歡迎~</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
            <span aria-hidden="true" >&times;</span>
          </button>
        </div>
        <div class="modal-body" style="height:600px">
        
        
        <!-- 進入頁面 -->
    <div id="username-page"> 
        <div class="username-page-container" >
            <h1 class="title">輸入暱稱</h1>
            
            <form id="usernameForm" name="usernameForm">
                <div class="form-group popup">
                    <input type="text" id="name" placeholder="輸入名稱..."
                        autocomplete="off" class="form-control popup" />
                    <span class="popuptext" id="hint">請輸入暱稱</span>
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">開始聊天</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 聊天室頁面 -->
    <div id="chat-page" class="hidden">
        <div class="chat-container">
            <div class="chat-header">
                <h2>BuyBuyLa</h2>
            </div>
            <div class="connecting">BuyBuy子正在趕來中....</div>
            <ul id="messageArea" class="messageBodyY">

            </ul>
        </div>
            <form id="messageForm" name="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix" style="margin-top:-15%; ">
                        <input type="text" id="message" placeholder="輸入訊息..."
                            autocomplete="off" class="form-control" />
                        <button type="submit" class="primary">送出</button>
                    </div>
                </div>
            </form>
    </div>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
          <button type="button" class="btn btn-primary">HI</button>
        </div>
      </div>
    </div>
  </div>
       
       
       
       
       
       
       
      
       <!-- sidebar is here -->>
   
   
   
    <script>
    // 1 jan input
    let demoBTN = document.getElementById('onejan')
    demoBTN.onclick = function(){
    document.getElementById("userNickname").setAttribute('value','pop貓');
    document.getElementById("userName").setAttribute('value','李小貓');               
    document.getElementById("userPhone").setAttribute('value','0912345678'); 
    document.getElementById("birthday").setAttribute('value','1997-04-26'); 
    document.getElementById("userGender").setAttribute('label','男性'); 
    document.getElementById("address").setAttribute('value','桃園市中壢區中大路300號'); 
    console.log("YAA");
    };
    
    
    
    
          var hamburger = document.querySelector(".hamburger");
  hamburger.addEventListener("click", function(){
    document.querySelector("body").classList.toggle("active");
  })


  // Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
    </script>
    
    
    
    
    
    
    <!-- 聊天室區 -->
     <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script type="text/javascript" charset="UTF-8" src="/js/main.js?version=1"></script>



<script>
'use strict';

var usernamePage = document.querySelector('#username-page');
var chatPage = document.querySelector('#chat-page');
var usernameForm = document.querySelector('#usernameForm');
var messageForm = document.querySelector('#messageForm');
var messageInput = document.querySelector('#message');
var messageArea = document.querySelector('#messageArea');
var connectingElement = document.querySelector('.connecting');
var nameInput = document.querySelector('#name');
var popup = document.querySelector('#hint');

var stompClient = null;
var username = null;

/**
 * 頭像的顏色
 */
var colors = [ '#2196F3', '#32c787', '#00bcd4','#4dbb00', '#ff5652', '#ffc107',
        '#ff85af', '#ff9800', '#39bbb0', '#b0c503' ];

/**
 * 連線
 * @param event
 * @returns
 */
function connect(event) {
    username = document.querySelector('#name').value.trim();

    if (username) {
        usernamePage.classList.add('hidden');
        chatPage.classList.remove('hidden');

        var socket = new SockJS('/BuyBuyla_boot/chatroom');
        stompClient = Stomp.over(socket);

        stompClient.connect({}, onConnected, onError);
    } else {
        popHint();
    }
    event.preventDefault();
}

/**
 * 連線建立後要處理的邏輯
 * @returns
 */
function onConnected() {
    // 訂閱/topic/public
    stompClient.subscribe('/topic/public', onMessageReceived); // 當後端送訊息至/topic/public時，會執行onMessageReceived()。

    // 發送訊息至/app/join，也就是送到ChatController.addUser()
    stompClient.send("/app/join", {}, JSON.stringify({
        sender : username,
        type : 'JOIN'
    }))

    connectingElement.classList.add('hidden');
}

function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}

/**
 * 彈出提示
 * @returns
 */
function popHint() {
    popup.classList.toggle("show");
}

/**
 * 發送訊息
 * @param event 發送訊息事件
 * @returns
 */
function sendMessage(event) {
    var messageContent = messageInput.value.trim();
    if (messageContent && stompClient) {
        var chatMessage = {
            sender : username,
            content : messageInput.value,
            type : 'CHAT'
        };
        // 發送訊息至/app/chat，也就是送到ChatController.sendMessage()
        stompClient.send("/app/chat", {}, JSON.stringify(chatMessage));
        stompClient.send("/app/chatback", {}, JSON.stringify(chatMessage));
        stompClient.send("/app/chatback2", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
    event.preventDefault();
}

/**
 * 從後端接受訊息後要進行的處理
 * @param payload 後端送來的訊息
 * @returns
 */
function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);

    var messageElement = document.createElement('li');

    if (message.type === 'JOIN') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' 加入聊天室';
    } else if (message.type === 'LEAVE') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' 離開聊天室';
    } else {
        messageElement.classList.add('chat-message');

        var avatarElement = getAvatarElement(message.sender);
        messageElement.appendChild(avatarElement);

        var usernameElement = getUsernameElement(message.sender);
        messageElement.appendChild(usernameElement);
    }
    console.log(message.content);

    var textElement = document.createElement('p');
    var messageText = document.createTextNode(message.content);
    textElement.appendChild(messageText);

    messageElement.appendChild(textElement);

    messageArea.appendChild(messageElement);
    messageArea.scrollTop = messageArea.scrollHeight;
}

/**
 * 取得頭像元素
 * @param sender 訊息發送者名稱
 * @returns
 */
function getAvatarElement(sender) {
    var avatarElement = document.createElement('i');
    var avatarText = document.createTextNode(sender[0]);
    avatarElement.appendChild(avatarText);
    avatarElement.style['background-color'] = getAvatarColor(sender);
    return avatarElement;
}

/**
 * 取得頭像顏色
 * @param sender 訊息發送者名稱
 * @returns
 */
function getAvatarColor(sender) {
    var hash = 0;
    for (var i = 0; i < sender.length; i++) {
        hash = 31 * hash + sender.charCodeAt(i);
    }
    var index = Math.abs(hash % colors.length);
    return colors[index];
}

/**
 * 取得使用者名稱的元素
 * @param sender 使用者名稱
 * @returns
 */
function getUsernameElement(sender) {
    var usernameElement = document.createElement('span');
    var usernameText = document.createTextNode(sender);
    usernameElement.appendChild(usernameText);
    return usernameElement;
}

/**
 * 移除彈出的提示
 * @param event
 * @returns
 */
function removePopup (event) {
    popup.classList.remove("show");
}

nameInput.addEventListener('focus', removePopup, true)
usernameForm.addEventListener('submit', connect, true)
messageForm.addEventListener('submit', sendMessage, true)
</script>
 
</body>
</html>