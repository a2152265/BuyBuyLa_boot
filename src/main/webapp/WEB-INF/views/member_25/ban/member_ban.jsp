
 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../../Home/member/member_25/ban/header.jspf"%>
<!-- sidebar -->
<%@ include file="../../Home/member/member_25/ban/sidebar.jspf"%>
                          
                      <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4" style="color:red;"> 申請恢復帳號 </p>&nbsp;&nbsp;<br>
                      <c:if test="${memberUiDefault.getNotes()!=null}">
                       <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4" style="color:red;"> 審核狀態 : 待審核 </p>
                         </c:if> 
                            <!-- 修改表單開始 -->
                       

                          <div class="d-flex flex-row align-items-center mb-4">                  
                            <div class="form-outline flex-fill mb-0" style="text-align:center;">
                             <p style=" font-size:25px;" >  &nbsp; 您的Email帳號為: &nbsp;&nbsp;  ${loginSession.userEmail}  </p>
                              <label class="form-label" for="form3Example1c"></label>
                            </div>
                          </div>
          
          
          					<!-- 停權區 -->
                          <form:form method='POST' modelAttribute="loginSession"
                          class="mx-1 mx-md-4" enctype="multipart/form-data">
                          
                            <div class="d-flex flex-row align-items-center mb-4">
                              <i class="fas fa-user fa-lg me-3 fa-fw" style="margin-top:51px; margin-right:15px;"></i>
                              <div class="form-outline flex-fill mb-0">
                              	<p style=" font-size:25px; text-align:center; margin-right:56px;" >請選擇理由</p>
                               <form:select  path="notes"  id="userGender" name="country"  style="width:450px; height:35px; font-size:25px"   required="required">
         						 <form:option path="notes" value="我想使用回原帳號。" >我想使用回原帳號。</form:option>
       						   <form:option path="notes" value="帳號被盜，已取回" >帳號被盜，已取回。</form:option>
         						 <form:option path="notes" value="想查詢過往使用紀錄。"  >想查詢過往使用紀錄。</form:option>
          						</form:select>
                              
                                 </div>
                            </div>                     
          
                            
          
                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                              <input type="submit" id="submitRewrite" name="submitRewrite" class="btn btn-primary btn-lg" value="送出">
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