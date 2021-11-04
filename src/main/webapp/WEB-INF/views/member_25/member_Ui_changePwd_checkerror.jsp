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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>會員中心</title>
    <style>
        

    </style>
</head>
<body>
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar" style="background-color: rgb(51, 63, 177);">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>



        <!-- <h1>WE Will BuyBuyLA your money</h1>
        <h2>Flexbo -> 商品狀態x</h2>
        <nav>
            <ul class="flex-nav">
                <li><a href="#">未付款</a></li>
                <li><a href="#">已付款</a></li>
                <li><a href="#">已出貨</a></li>
                <li><a href="#">運送中</a></li>
                <li><a href="#">已送達</a></li>
                <li><a href="#">已完成</a></li>
                <li><a href="#">取消交易</a></li>
            </ul>
        </nav> -->
        
  




    <div class="container">
      <span style="font-size:30px;  font-weight:bold;">會員專區</span>
      </div>



    <div style="text-align: center;">
    
        <form:form method='POST' modelAttribute="memberUiDefault"
        class='form-horizontal' enctype="multipart/form-data">
        <!-- 檔案上傳的標籤一定要有enctype="multipart/form-data -->
      
        <table style="text-align:center;">
          
          <span > - 更改密碼</span><br><br><br>
          
          
           <form:password id="pwd" path="userPwd"   style="width: 40%; height:30px; font-size:18px"  placeholder="請輸入密碼" cssclass='form-control'  />
			
			    
                    
          </table>
          
      
          <p>&nbsp;</p>
  
          <input type="submit"  onclick="return(confirm('確認更改？'))"  id="submitRewrite"  name="submitRewrite" 
          style="text-align: center; font-size: 18x;  background-color: rgb(9, 9, 102);"  class="button-1"  value="更改密碼"/>

         
         
         
         </form:form>
      
       
       
      
      
      
      
        </div>




  </div>
        <div class="sidebar" style="background-color: rgb(51, 63, 177);">
            <div class="profile">
                <!--    <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">  --> 
                <!-- 讀取圖片 -->
               <img  src="<c:url value='/getPicturefromMember/${memberUiDefault.id}'/>"   alt="profile_picture" />
                <h3></h3>
                <p>${memberUiDefault.userEmail} </p>
            </div>
            <ul>
                <li>
                    <a href="<c:url value='/' />">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">回首頁</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />"">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">購買清單</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />"">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">購買紀錄</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">  個人主頁</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">討論區</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">帳號管理</span>
                    </a>
                </li>
                
                <li>
                    <a href="<c:url value='/member/evolution' />">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">賣家中心</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/member/changePwd' />"   class="active">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">更改密碼</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/delete' />"  onclick="return(confirm('確認刪除？'))" >
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">刪除會員</span>
                    </a>
                </li>

                <!-- /*減去footer高度*/ -->
                <li style="min-height: calc(100% - 50px); ">
                    <a href="<c:url value='/try/delete' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">隱私權政策</span>
                    </a>
                </li>
                
                <li>
                    <a href="<c:url value='/try/logout' />"  onclick="return(confirm('確認登出？'))" >
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item">登出</span>
                    </a>
                </li>
                
            </ul>
        </div>
        
    </div>

   


    <script>
    alert('輸入認證碼失敗');
    
          var hamburger = document.querySelector(".hamburger");
  hamburger.addEventListener("click", function(){
    document.querySelector("body").classList.toggle("active");
  })
    </script>
 
</body>
</html>