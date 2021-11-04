
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
 
</body>
</html>