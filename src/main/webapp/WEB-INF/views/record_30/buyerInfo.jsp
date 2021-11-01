<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
	
    <link rel="stylesheet" href="member.css">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>買家資訊</title>
    <style>
        

    </style>
</head>
<body style="background-color: rgb(220, 220, 241);">
   



    <div  style="background-color: rgb(70, 70, 228);height:100px">
   
    </div>







    <div class="container" >
      <span style="font-size:30px;  font-weight:bold;">買家資訊</span>
      </div>



    <div style="text-align: center;">
    

        <!-- 檔案上傳的標籤一定要有enctype="multipart/form-data -->
      
        <table style="text-align:center;">
          
                    <tr>
          <td> <img  src="<c:url value='/getPicturefromMember/${member.id}'/>"   alt="profile_picture" /></td>
      
          </tr>
          
       
          <tr>
            <td >帳號:${member.userEmail} </td>
          </tr>


          <tr>
            <td>暱稱:${member.userNickname}</td>
          </tr>
          
         
           <tr>
            <td>姓名:${member.userName}</td>
         
          </tr>
            
            
            <tr>
            <td>手機: ${member.userPhone}</td>
      
            </tr>

            <tr>
                <td>生日:${member.birthday}</td>

              </tr>
         
            <tr>
             <td>性別:${member.birthday}</td>
           
              </tr>

            
          </table>
          
      
         
      
    
        </div>
        <br> <br> <br> <br> <br>
<center>
<div class="checkout_btn_inner d-flex align-items-center">
     <a class="btn btn-outline-secondary" href="update30" style='font-size:20px' role="button">返回賣家中心</a>
   </div>
		
	
  </center>
 
</body>
</html>