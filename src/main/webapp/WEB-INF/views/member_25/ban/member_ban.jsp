
 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../Home/member/member_25/header.jspf"%>
<!-- sidebar -->>
<%@ include file="../Home/member/member_25/sidebar.jspf"%>
                          
                      <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4" style="color:red;"> 停用帳號 </p>
                       
                            <!-- 修改表單開始 -->
                       

                          <div class="d-flex flex-row align-items-center mb-4">                  
                            <div class="form-outline flex-fill mb-0" style="text-align:center;">
                               &nbsp; 您的Email帳號為: &nbsp;&nbsp;  ${loginSession.userEmail} 
                              <label class="form-label" for="form3Example1c"></label>
                            </div>
                          </div>
          
          
          					<!-- 停權區 -->
                          <form:form method='POST' modelAttribute="loginSession"
                          class="mx-1 mx-md-4" enctype="multipart/form-data">
                          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                              <div class="form-outline flex-fill mb-0">
                              
                               <form:select  path="userGender" id="userGender" name="country"  required="required">
       						   <form:option path="userGender" value="男性" lable="男性" >男性</form:option>
         						 <form:option path="userGender"  value="女性" lable="女性" >女性</form:option>
         						 <form:option path="userGender" value="其他" lable="其他" >其他</form:option>
          						</form:select>
                              
                                 </div>
                            </div>                     
          
                            
          
                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                              <input type="submit" id="submitRewrite" name="submitRewrite" class="btn btn-primary btn-lg" value="停用帳號">
                            </div>

                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                <input type="button" id="onejan" name="submitRewrite" class="btn btn-primary btn-lg" value="一鍵輸入">
                              </div>
                              
                             
          
                        </div>
                        
                        
            

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
    document.getElementById("userPwd").setAttribute('value','a2152265@gmail.com');
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