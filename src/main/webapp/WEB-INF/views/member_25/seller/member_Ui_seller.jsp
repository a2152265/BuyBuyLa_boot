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
    <link rel="stylesheet" href="member.css">
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>賣家中心</title>
    <style>
        

    </style>
</head>
<body>
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>



        <h1>Welcome ~~      WE Will BuyBuyLA your money</h1>
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
        </nav>
        
  




    <div class="container">
      <span style="font-size:30px;  font-weight:bold;">賣家中心</span>
      </div>



    <div style="text-align: center;">
    
       
      
        <table style="text-align:center;" >
          <h2 style="text-align: center;">商品狀態</h1><br>
          <span > 您可以在此查看商品狀態</span><br><br><br>
         
      </table>
        </div>




  </div>
        <div class="sidebar">
            <div class="profile">
                <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">
                <h3></h3>
                <p>Designer</p>
            </div>
            <ul>
                <li>
                    <a href="<c:url value='/' />" >
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                 <li>        
                    <a href="<c:url value='/update30' />">

                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />" class="active">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">商品管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
                        <span class="item">數據中心</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/member/seller_Ui' />">
                        <span class="icon"><i class="fas fa-database"></i></span>
                        <span class="item">帳號管理</span>
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
                
            </ul>
        </div>
        
    </div>

   


    <script>
    
    
    
    
    
          var hamburger = document.querySelector(".hamburger");
  hamburger.addEventListener("click", function(){
    document.querySelector("body").classList.toggle("active");
  })
    </script>
 
</body>
</html>