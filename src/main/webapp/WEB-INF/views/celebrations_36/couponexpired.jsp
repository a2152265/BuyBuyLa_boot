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
    <title>BuyBuyLa | 會員中心</title>
    <style>
        <style>
a{text-decoration:none}
a:hover{text-decoration:none}

 img { 
 -webkit-filter: grayscale(100%); 
	 -moz-filter: grayscale(100%); 
	 -ms-filter: grayscale(100%); 
	 -o-filter: grayscale(100%); 
	 filter: grayscale(100%); 
	 filter: gray; 
     position: relative;
     z-index: 1;
     border: 0.5px solid gray;
     border-radius: 10px;
 } 

 .word{
      position: absolute;
     /* border: 3px solid black; */
     z-index: 1;
/*        margin-left:15px;   */
     margin-top:2px;  
     font-size:16px;
     font-weight: bolder;
     color: white;
/*       border:1px solid black;  */
     width:160px;
/*      float:left; */
 }
 .btn{
    position: absolute;
    z-index: 50;
    margin-left: 290px;
/*      margin-top: 120px; */
     width: 130px;
     height: 50px;
     font-weight: bolder;
     font-size: x-large;
     border-radius: 10px;
     background-color:white;
     color:grey;
     border:1px solid transparent;
     
/*      border:0px solid transparent; */
 }
/*  .card-text{ */
/*   style="position: absolute;z-index: 50;" */
/*  } */
 
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
          <a class="nav-link"  id="unused" href="<c:url value='/try/coupon' />"style="padding-left:100px;">未使用</a>
        <a class="nav-link" id="used" href="<c:url value='/try/usedcoupon' />" style="padding-left:100px">已使用</a>
          <a class="nav-link" href="<c:url value='/try/expiredcoupon' />" style="padding-left:100px">已過期</a> 
      </div>
    </div>
  </div>
</nav>


     
    <div style="text-align: center ;margin-top:0px">
    
    <c:choose>

    <c:when test="${coupon.couponStatus==未使用}">
<%--       <c:if test="${coupon.couponStatus==未使用}"> --%>
	        <c:forEach items='${couponList}' var='coupon'>
	        
      <div class="card mb-3" style="height:132px;max-width: 350px;margin-left:80px ;margin-top:35px ;float:left">
<%--     	     	    	                    		<div class="word" style="font-weight:bolder;color:black">有效期限 ${coupon.expiryDate}</div>  --%>
  
  <div class="row g-0">
<%--   	     	    	                    		<div class="word" style="font-weight:bolder;color:black">有效期限 ${coupon.expiryDate}</div>  --%>
  	
    <div class="col-md-4">
<%--     	                    		<div class="word" style="font-weight:bolder;color:black">有效期限 ${coupon.expiryDate}</div>  --%>
    	
      <img src="<c:url value='/images/shippingVoucher.jpg' />" alt="..." style="border-radius:3px "width=347.5px height=130px >
      <div class="word" style="font-weight:bolder;color:black; width:160px">有效期限 ${coupon.expiryDate}</div> 
   
    </div>
    <div class="col-md-8">
    
      <div class="card-body" style="position:absolute;z-index: 50;margin-left:58px">
<%--         <div class="card-text"style="font-size:20px;font-weight:bolder;color:black"> ${coupon.expiryDate}</div> --%>
        <div class="card-text"style="font-size:20px;font-weight:bolder;color:white"> ${coupon.couponName}</div>
        
        <div class="card-text"style="font-weight:bolder;">${coupon.couponStatus}</div>
        <div class="card-text"><small class="text-muted">號碼:${coupon.couponNumber}</small></div>
<%--      	  	     	    	                    		<div class="word" style="float:left;font-weight:bolder;color:black">有效期限 ${coupon.expiryDate}</div>  --%>
     	
      </div>
<%--         	     	    	                    		<div class="word" style="font-weight:bolder;color:black">有效期限 ${coupon.expiryDate}</div>  --%>
      
    </div>
  </div>
</div>
      </c:forEach>
</c:when>

 <c:when test="${coupon.couponStatus==已使用}">
<%--       <c:if test="${coupon.couponStatus==未使用}"> --%>
	        <c:forEach items='${couponList}' var='coupon'>
      <div class="card mb-3" style="height:120px;max-width: 350px;margin-left:100px ;float:left">
  <div class="row g-0">
  	
    <div class="col-md-5">
    
      <img  class="gray" src="<c:url value='/images/shippingVoucher.jpg' />" alt="..." style="border-radius:3px "width=347.5px height=150px >
<%--           <div class="word" style="font-size:20px;font-weight:bolder;color:black"> ${coupon.couponName}</div> --%>
  
    </div>
    <div class="col-md-9">
      <div class="card-body" style="margin-left:30px">
        <div class="card-text"style="font-size:20px;font-weight:bolder;color:white"> ${coupon.couponName}</div>
        <div class="card-text"style="font-weight:bolder;color:red">${coupon.couponStatus}</div>
        <div class="card-text"><small class="text-muted">號碼:${coupon.couponNumber}</small></div>
      </div>
    </div>
  </div>
</div>
      </c:forEach>
</c:when>





<c:otherwise>  





   </c:otherwise>

  </c:choose>





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
                    <a href="<c:url value='/try/coupon' />" class="active">
                        <span class="icon"><i class="fas fa-ticket-alt"></i></span>
                        <span class="item">我的折價券</span>
                    </a>
                </li>
               <li>
                    <a href="<c:url value='/try/point' />">
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