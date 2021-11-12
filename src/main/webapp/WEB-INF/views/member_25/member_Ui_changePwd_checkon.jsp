
 <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="../Home/member/member_25/changepwd/header.jspf"%>
<!-- sidebar -->
<%@ include file="../Home/member/member_25/changepwd/sidebar.jspf"%>

    
        
        
        
        
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <div style="text-align: center;">
    
       
      
        <table style="text-align:center;">
          
          <span >  確認成功!! &nbsp;請輸入新密碼</span><br><br><br>
          
          
               
                    
                    
                    <form:form method='POST' modelAttribute="changePwd"
        			class='form-horizontal' enctype="multipart/form-data">
  						<div class="form-group" style="padding-left:31%; padding-right:31%;">
    					<label for="exampleInputEmail1">請輸入新密碼</label>
    					<form:password  path="userPwd"  class="form-control" id="pwd" aria-describedby="emailHelp" placeholder="請輸入新密碼"/>
   						 <small id="emailHelp" class="form-text text-muted"></small>
 						 </div>
  						<div class="form-group"  style="padding-left:31%; padding-right:31%;">
  						  <label for="exampleInputPassword1">請再次輸入新密碼</label>
 						   <form:password  path="userPwd1" class="form-control" id="pwd" placeholder="請再次輸入密碼"/>
 						 </div>
  						<div class="form-check">
    					<input type="checkbox" class="form-check-input" id="exampleCheck1">
  						 <label class="form-check-label" for="exampleCheck1">確認</label>
 						 </div>
  						<button type="submit"   onclick="return(confirm('確認送出？'))"   class="btn btn-primary">送出</button>
					</form:form>
          </table>
          
      
          <p>&nbsp;</p>
  
          
       
      
        </div>



