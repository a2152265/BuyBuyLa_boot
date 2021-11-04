
 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../Home/member/member_25/changepwd/header.jspf"%>
<!-- sidebar -->>
<%@ include file="../Home/member/member_25/changepwd/sidebar.jspf"%>



    <div style="text-align: center;">
    
        <form:form method='POST' modelAttribute="changePwd"
        class='form-horizontal' enctype="multipart/form-data">
        <!-- 檔案上傳的標籤一定要有enctype="multipart/form-data -->
      
        <table style="text-align:center;">
          
          <span > - 更改密碼</span><br><br><br>
          
          
           <form:password id="pwd" path="userPwd" style="width: 40%; height:30px; font-size:18px"  placeholder="請輸入舊密碼" cssclass=''  />
			       
                    
          </table>
          
      
          <p>&nbsp;</p>
  
          <input type="submit"  onclick="return(confirm('確認送出？'))"  id="submitRewrite" class="button-1" name="submitRewrite" 
          style="text-align: center; font-size: 18x; background-color: rgb(9, 9, 102);"  value="確認"/>
     
         </form:form>
      
        </div>


        