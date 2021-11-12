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
    <title>管理中心</title>
    
  

<!-- for form css -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
  
    <!-- 跳出表單 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
   
  

<script type="text/javascript">
//   table資料列
$(document).ready(function () {
      jQuery('#example').DataTable();
}

 
  </script>

<style>
    * {
      box-sizing: border-box;
    }
    
    input[type=text], select, textarea {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 4px;
      resize: vertical;
    }
    
    label {
      padding: 12px 12px 12px 0;
      display: inline-block;
    }
    
    input[type=submit] {
      background-color: #4CAF50;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      float: right;
    }
    
    input[type=submit]:hover {
      background-color: #45a049;
    }
    
    .container {
      border-radius: 5px;
      background-color: #f2f2f2;
      padding: 20px;
    }
    
    .col-25 {
      float: left;
      width: 25%;
      margin-top: 6px;
    }
    
    .col-75 {
      float: left;
      width: 75%;
      margin-top: 6px;
    }
    
    /* Clear floats after the columns */
    .row:after {
      content: "";
      display: table;
      clear: both;
    }
    
    /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
    @media screen and (max-width: 600px) {
      .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
      }
    }
    </style>


</head>
<body style="background-color: rgb(225, 219, 241);">
   
    <div class="wrapper">
       <div class="section">



    <div class="top_navbar" style="background: rgb(44, 8, 80);">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>


  




    <div class="container">
       <span style="font-size: 40px;">會員清單</span> 
      </div>

      <h2>您可以在此頁面更改會員資料</h2><hr>




      
      <div class="container">

        <!-- 修改表單資料 -->
       <form:form method='POST' modelAttribute="RecordList" >
        <input type="hidden" name="_method"  id='putOrDelete'   value="DELETE" >
        <c:if test='${RecordList.buyer != null}'>
               <form:hidden path="buyer" /><br>&nbsp;
			</c:if>
 			<form:hidden path="record_id" /><br>
 			<form:hidden path="buy_time" /><br>
		<form:hidden path="totalprice" /><br>
	<div class="row">
          <div class="col-25">
            <label for="fname">訂單編號</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${RecordList.record_id} 
          </div>
        </div>
        
        <div class="row">
          <div class="col-25">
            <label for="fname">會員帳號</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${RecordList.buyer} 
          </div>
        </div>
        <div class="row">
          <div class="col-25">
            <label for="fname">訂單總價</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${RecordList.totalprice} 
          </div>
        </div>
       <div class="row">
          <div class="col-25">
            <label for="fname">購買日期</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${RecordList.buy_time} 
          </div>
        </div>
    
        <div class="row">
          <div class="col-25">
            <label for="country">買家住址:</label>
          </div>
          <div class="col-75">
            ${RecordList.buyeraddress} 
    
          </div>
        </div>
        <div class="row">
          <div class="col-25">
            <label for="country">付費狀態:</label>
          </div>
          <div class="col-15">
          	<form:select path="pay_status"  >
          	<option value="已付款" selected>已付款</option>	
          	<option value="已付款" disabled>-------------</option>	
          	<form:option value="待付款">待付款</form:option>
          	<form:option value="已付款">已付款</form:option>	 
         	</form:select>
          
<%--             <form:input path="pay_status" size="25" />      <br>&nbsp; --%>
<%-- 			<form:errors path="pay_status" cssClass="error" style="color: red;" /> --%>
          </div>
        </div>
        <div class="row">
          <div class="col-25">
            <label for="country">出貨狀態:</label>
          </div>
          <div class="col-15">
          <form:select path="transport_status" >
          	<form:option value="待出貨">待出貨</form:option>
          	<option value="已付款" disabled>-------------</option>	
          	<form:option value="運送中">運送中</form:option>
          	<form:option value="已到貨">已到貨</form:option>      	
 		</form:select>
<%--             <form:input path="transport_status" size="25" /><br>&nbsp; --%>
<%-- 			<form:errors path="transport_status" cssClass="error" style="color: red;" /> --%>
          </div>
        </div>
        

        <br>
        <div class="row">
          <input type="submit" value="修改" name='updateBtn' onclick="return confirmUpdate('${RecordList.buyer}');">&nbsp; 
          
       
          </div>
       </form:form>
      </div>



  </div>
        <div class="sidebar" style="background: rgb(44, 8, 80);">
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
                    <a href="<c:url value='/manager_Ui' />" class="active">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">會員資料管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />">
                        <span class="icon"><i class="fas fa-user-friends"></i></span>
                        <span class="item">效益分析</span>
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
                        <span class="item"></span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/member/changePwd' />">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item"></span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/delete' />">
                        <span class="icon"><i class="fas fa-user-shield"></i></span>
                        <span class="item"></span>
                    </a>
                </li>

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