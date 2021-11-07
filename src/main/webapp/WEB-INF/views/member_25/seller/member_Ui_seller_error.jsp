

 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../../Home/seller/member_25/default/header.jspf"%>
<!-- sidebar -->>
<%@ include file="../../Home/seller/member_25/default/sidebar.jspf"%>


    <div style="text-align: center;">
    
        <form:form method='POST' modelAttribute="sellerData"
        class='form-horizontal' enctype="multipart/form-data">
        <!-- 檔案上傳的標籤一定要有enctype="multipart/form-data -->
      
        <table style="text-align:center;" >
          <h2 style="text-align: center; margin-left:-30px;">個人資料</h1><br>
          <span > 您需將資料填寫完成並驗證後，方可使用賣家功能</span><br><br><br>
          
         <tr>
         您的信箱為 : &nbsp;  
              ${sellerData.userEmail}
          </tr>    
          
        
          
           <tr>
            <td  style="margin-top:35px"></td>
           
            <td> 
            <label for="verifyCode"></label>
            <!--驗證碼欄位-->         
            <form:input id="verifyCode" path="verifyCode" placeholder="請輸入驗證碼" type='text'  style="width: 250px; height: 30px; margin-top:25px; size: 20px;" cssClass="formInput" />
         
            </td> 
          
            </tr>
            
            <tr>
            <td></td>
            
            <td>
            <!-- toggle 棟棟 -->
            <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
           
            <br> &nbsp;   &nbsp;   &nbsp;   &nbsp;   &nbsp;  &nbsp;    <a href="<c:url value='/member/verifyBtn' />" id="submit" class="submit">送出驗證碼 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                        	
                        	
                       
            
            
            </td>
            </tr>
          
        
          
            
          </table>
    
       <br> <br>
          <a href="<c:url value='/try/index' />?userEmail= ${sellerData.userEmail} ">
          <input type="submit" id="submitRewrite" class="button" name="submitRewrite" style="vertical-align:middle "  value="賣家資格驗證"/>
           </a>
    
    </form:form>
      
      
        </div>
        
        
    <!--  -->
   
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

alert('驗證碼錯誤');

$(".submit").click(function(){		
	  let timerInterval
	  Swal.fire({
	  title: '交易處理中 ! !',
	  html: '請耐心等候 :)',
	  timer: 12000,
	  timerProgressBar: true,
	  didOpen: () => {
	    Swal.showLoading()
	    const b = Swal.getHtmlContainer().querySelector('b')
	    timerInterval = setInterval(() => {
	      b.textContent = Swal.getTimerLeft()
	    }, 100)
	  },
	  willClose: () => {
	    clearInterval(timerInterval)
	  }
	}).then((result) => {
	  /* Read more about handling dismissals below */
	  if (result.dismiss === Swal.DismissReason.timer) {
	    console.log('I was closed by the timer')
	  }
	})
});
	
    </script>




       