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



  




    <div class="container">
       <span style="font-size: 40px;">詳細資訊</span> 
      </div>





      
      <div class="container">

        <!-- 修改表單資料 -->
    
       
	<div class="row">
          <div class="col-25">
            <label for="fname">訂單編號</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${BuyerAddress.record_id} 
          </div>
        </div>
        
        <div class="row">
          <div class="col-25">
            <label for="fname">會員帳號</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${BuyerAddress.buyer} 
          </div>
        </div>
        <div class="row">
          <div class="col-25">
            <label for="fname">取貨人</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${BuyerAddress.buyerName} 
          </div>
        </div>
          <div class="row">
          <div class="col-25">
            <label for="fname">聯絡電話</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${BuyerAddress.phone} 
          </div>
        </div>
    
           <div class="row">
          <div class="col-25">
            <label for="fname">聯絡信箱</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${BuyerAddress.email} 
          </div>
        </div>
           
  	 <div class="row">
          <div class="col-25">
            <label for="fname">郵遞區號</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${BuyerAddress.postalcode} 
          </div>
        </div>
 
		<div class="row">
          <div class="col-25">
            <label for="fname">取貨地點</label>
          </div>
          <div class="col-75" style="padding-top: 10px;">
          ${BuyerAddress.city}${BuyerAddress.country}${BuyerAddress.address} 
          </div>
        </div>
        
       

  </div>
      
        	<center>
			<a class="btn btn-outline-secondary" href="update30" style='font-size:20px' role="button">回上一頁</a>	
			</center>
    </div>

  
</div>

 
</body>
</html>