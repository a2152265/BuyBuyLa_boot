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
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> -->
<!--     <link rel="stylesheet" -->
<!-- 	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     icon -->
     <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <title>BuyBuyLa | 會員中心</title>
    
    <style>
      
a{text-decoration:none}
a:hover{text-decoration:none}
 
 .btn-outline-primary {
  color:lightblue;
  background-color: #fff;
  border-color: lightblue;
  width:130px;
  height:50px;
}
  .btn-outline-primary:hover, .btn-outline-primary:focus, .btn-outline-primary:active:hover{
  color: #fff;
  background-color:lightblue;
  border-color: lightblue;
}

    </style>
</head>
<body style="background-color: rgb(70,130,180,0.2);">
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar" style="background-color: rgb(70,130,180);">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>
	
<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar" >
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav" style="font-weight:bolder;font-size:25px">
<%--         <a class="nav-link"  id="unused" href="<c:url value='/try/coupon/${memberUiDefault.userEmail}' />"style="padding-left:100px;">未使用</a> --%>
<%--         <a class="nav-link" id="used" href="<c:url value='/try/usedcoupon/${memberUiDefault.userEmail}' />" style="padding-left:100px">已使用</a> --%>
          <a class="nav-link"  id="unused" href="<c:url value='/try/point' />"style="padding-left:100px;">未使用</a>
          <a class="nav-link" id="used" href="<c:url value='/try/usedpoint'/>" style="padding-left:100px">已使用</a>
      </div>
    </div>
  </div>
</nav>


      
	 
	<div style="margin-left:50px;margin-top:50px; font-weight:bolder;size:16px">	
	<i class="fab fa-bitcoin" style='font-size:48px;color:gold;margin:5px'></i><span style="font-size:24px;">可用點數:<span style="color:red">${point}</span></span></div>
	
   
 <div id="search" style="margin-left:650px;margin-top:230px">
		<button style="font-size:25px;font-weight:bolder" type="button" class="btn btn-outline-primary" onclick="location.href ='../campaigns/redeem'">兌換去</button>
 </div>


 



  </div>
        <div class="sidebar" style="background-color: rgb(70,130,180);">
            <div class="profile">
             <!--    <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">  --> 
                <!-- 讀取圖片 -->
               <img  src="<c:url value='/getPicturefromMember/${memberUiDefault.id}'/>"   alt="profile_picture" style="margin-bottom:8px"/>
                <p>${memberUiDefault.userEmail} </p>
            </div>
            <ul>
              <li>
                    <a href="<c:url value='/' />">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">首頁</span>
                    </a> 
                </li>          
                <li>
                    <a href="<c:url value='/member/evolution' />">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">賣家中心</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/member_Ui' />">
                        <span class="icon"><i class="fas fa-user-edit"></i></span>
                        <span class="item">會員資料</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/selectLsit'/>">
                        <span class="icon"><i class="far fa-clipboard"></i></span>
                        <span class="item">購買紀錄</span>
                    </a>
                </li>
                                
                <li>
                    <a href="<c:url value='/member/changePwd_check' />">
                        <span class="icon"><i class="fas fa-key"></i></span>
                        <span class="item">更改密碼</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/coupon' />">
                        <span class="icon"><i class="fas fa-ticket-alt"></i></span>
                        <span class="item">我的折價券</span>
                    </a>
                </li>
               <li>
                    <a href="<c:url value='/try/point' />" class="active">
                        <span class="icon"><i class="fab fa-btc"></i></span>
                        <span class="item">我的點數</span>
                    </a>
                </li>

                <!-- /*減去footer高度*/ -->
                <li>
                    <a href="<c:url value='/member/inschan' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">隱私權政策</span>
                    </a>
                </li>
                
                <li>
                    <a href="<c:url value='/try/logout' />"  onclick="return(confirm('確認登出？'))" >
                        <span class="icon"><i class="fas fa-sign-out-alt"></i></span>
                        <span class="item">登出</span>
                    </a>
                </li>
                
            </ul>
        </div>
        
    </div>

   


    <script>
          var hamburger = document.querySelector(".hamburger");
  hamburger.addEventListener("click", function(){
    document.querySelector("body").classList.toggle("active");
  })
  
//   	 $("#unused").on("click",function(event){
//     	    event.preventDefault();  // 使a自帶的方法失效，即無法向addStudent.action發出請求
//             var userEmail=${memberUiDefault.userEmail};
//     	    $.ajax({
//                 type: "POST",  // 使用post方式
//                 url: "<c:url value='/try/coupon/' />",
//                 contentType:"application/json",
//                 data: {'userEmail':userEmail},  // 引數列表，stringify()方法用於將JS物件序列化為json字串
//                 success: function(result){
//                    // 請求成功後的操作
//                 },
//                 error: function(result){
//                    // 請求失敗後的操作
//                 }
//     	    });
// 	});
  
  
    </script>
 
</body>
</html>