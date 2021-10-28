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
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<style>
#myInput {
  background-image: url('/css/searchicon.png'); /* Add a search icon to input */
  background-position: 10px 12px; /* Position the search icon */
  background-repeat: no-repeat; /* Do not repeat the icon image */
  width: 50%; /* Full-width */
  font-size: 16px; /* Increase font-size */
  padding: 12px 20px 12px 40px; /* Add some padding */
  border: 1px solid #ddd; /* Add a grey border */
  margin-bottom: 12px; /* Add some space below the input */
}

#myTable {
  border-collapse: collapse; /* Collapse borders */
  width: 50%; /* Full-width */
  border: 1px solid #ddd; /* Add a grey border */
  font-size: 14px; /* Increase font-size */
  margin:auto;
  font-family: "微軟正黑體";
  font-weight: bolder;
            
}

#myTable th, #myTable td {
  text-align: left; /* Left-align text */
  padding: 12px; /* Add padding */
}

#myTable tr {
  /* Add a bottom border to all table rows */
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  /* Add a grey background color to the table header and on hover */
  background-color: #f1f1f1;
}

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
<!--         <nav> -->
<!--             <ul class="flex-nav"> -->
<!--                 <li><a href="#">未付款</a></li> -->
<!--                 <li><a href="#">已付款</a></li> -->
<!--                 <li><a href="#">已出貨</a></li> -->
<!--                 <li><a href="#">運送中</a></li> -->
<!--                 <li><a href="#">已送達</a></li> -->
<!--                 <li><a href="#">已完成</a></li> -->
<!--                 <li><a href="#">取消交易</a></li> -->
<!--             </ul> -->
<!--         </nav> -->
        
  




    <div class="container">
      <span style="font-size:30px;  font-weight:bold;">賣家中心</span>
      </div>



    <div style="text-align: center;">
    
      <a  href="<c:url value='/products/add' />">新增商品</a>
<table id="myTable" class="display">
    <thead>
        <tr>
    <th style="width:10%;">productId</th>
    <th style="width:30%;">productName</th>
    <th style="width:20%;">productImage</th>
    <th style="width:10%;">price</th>
    <th style="width:10%;">stock</th>
    <th style="width:10%;">category</th>
    <th style="width:10%;">insertTime</th>
    <th style="width:10%;">update</th>
    <th style="width:10%;">delete</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${sellerproducts}" var="product">
        <tr>
           <td>${product.productId}</td>
    <td>${product.productName}</td>
    <td><img width='100' height='100' 
  				   src="<c:url value='/getPicture/${product.productId}' />" /></td>
    <td>${product.price}</td>
    <td>${product.stock}</td>
    <td>${product.category}</td>
    <td>${product.insertTime}</td>
   <!-- <td><input type=button onclick="location.href='./update/${product.productId}'" value='update'></td>
    <td><input type=button onclick="location.href='/delete/${product.productId}'" value='update'></td>-->
     <td><a id="update" href="<c:url value='/update?productId=${product.productId}' />">update</a></td>
    <td><a  href="<c:url value='/delete/${product.productId}' />">delete</a></td>
        </tr>
        </c:forEach>
    </tbody>
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
                    <a href="<c:url value='/' />" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='' />">
                        <span class="icon"><i class="fas fa-desktop"></i></span>
                        <span class="item">訂單管理</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/products/seller' />">
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
                    <a href="<c:url value='/member/changePwd' />">
                        <span class="icon"><i class="fas fa-chart-line"></i></span>
                        <span class="item">更改密碼</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='/try/delete' />">
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
  
  $(document).ready( function () {
    $('#myTable').DataTable();
} );
    </script>
 
</body>
</html>