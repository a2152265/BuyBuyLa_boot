<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    
<title>Login</title>
<head>

</head>

		
<body>
	

     
			<form:form method='POST'   modelAttribute="loginSession"
			class='form-horizontal' >
	
		
                         <br><br><label for="">登入</label>
                   
			
					 <br><br>帳號&nbsp; &nbsp;<form:input id="userEmail" path="userEmail" type='text' class='emailLogin' style="width: 250px; height: 30px;" />
					 <br><br>密碼&nbsp;&nbsp; <form:input id="userPwd" path="userPwd" type='text' class='pwdLogin' style="width: 250px; height: 30px;" />              
					 
					 <hr> <hr>

                        
                    <a href="<c:url value='/try/index' />"><input type="submit" id="submitLogin" name='submitLogin' value="確認送出(有包 a /index)(submit)"  style="width: 250px; height: 39px; background-color: rgb(23, 170, 170); margin-left: 40px;  color: white;"/>
                    </a>
                    <hr>
                    
    
      		  </form:form>



        <script>
        </script>
</body>


</html>