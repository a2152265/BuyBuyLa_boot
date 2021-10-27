<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>購物車</title>

	<link rel="stylesheet" type="text/css" href="cart.css" />
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<script type="text/javascript" src="cookie.js"></script>
	<style>
* {
	margin: 10px;
	padding: 0;
}

.container {
	width: 1200px;
	margin: 0 auto;
}

h1 {
	text-align: left;
	font-size: 250%;
}

h3 {
	margin: 20px 0;
}

table {
	border-collapse: collapse;
	width: 1200px;
	margin-top: 20px;
	text-align: center;
}

table img {
	width: 100px;
	padding: 5px
}

table thead {
	font: bold 22px/40px "微软雅黑";
	background-color: lightblue;
	color: #fff;
}

table.hide {
	display: none;
}

/* table .ck {
	width: 22px;
	height: 22px;
	vertical-align: middle;
} */
table tbody input {
	width: 20px;
	text-align: center;
}

.up, .down {
	width: 20px;
}

.box {
	width: 100%;
	height: 200px;
	background-color: lightblue;
	font: bold 36px/200px "微软雅黑";
	text-align: center;
}

.box.hide {
	display: none;
}

h2 {
	float: right;
	padding: 20px;
}

h2.hide {
	display: none;
}

h2 span {
	font: bold 33px/33px "微软雅黑";
	color: red;
}

.submit {
	margin: auto;
	padding: auto;
	font-size: 20px;
}

.title {
	background-color: lightblue;
	width: 1200px;
	height: 120px;
	display: block;
	padding: 20px 0;
	left: 0%;
	top: 0%
}

.search {
	position: absolute;
	left: 30%;
	top: 1%
}

#search {
	width: 800px;
	height: 40px;
	font-size: 20px;
}
</style>
</head>

<body>
<<<<<<< HEAD
<sql:setDataSource var="snapshot" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
      url="jdbc:sqlserver://MSI\\SQLEXPRESS:1433;databaseName=BuyBuyLa" 
     user="sa"  password="123123123"/>
     
<sql:query
 sql="select * from Cart"
 var="rs" dataSource="${snapshot}" />
=======

>>>>>>> branch 'Dev' of git@github.com:a2152265/BuyBuyLa_boot.git
		<div id="title" style="background-color:rgb(126, 199, 199);" class="title container">
			<h1 >購買成功</h1>
			<div class="search">
				<button class="icon"><i class="fa fa-search"></i></button>
				<input type="search" id="search" placeholder="Search..." />
			</div>
		</div>
		
	<div class="leftSide">
		<h1 class="h1">您的購買紀錄&nbsp;:</h1>
	</div>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>圖片</th>
					<th>商品名稱</th>
					<th>數量</th>
					<th>單價</th>
					<th>合計</th>
				</tr>
			</thead>
			<tbody id="tbody">
			<c:forEach var="row" items="${cart}">
			
				<tr>
					<td><img width='150' src="<c:url value='/getPicture/${row.pid}' />" /></td>
					<td>${row.p_name}</td>
					<td>${row.count}</td>
					<td>NT<span>${row.p_price}</span></td>
					<td>NT<span class="total" >${row.count*row.p_price}</span></td>	
				</tr>
				
<%-- 		<sql:update sql="INSERT INTO  record (PID,P_name,P_price,pcount) VALUES('${row.PID}','${row.P_name}','${row.P_price}','${row.count}')" var="count" dataSource="${snapshot}"/> --%>
		</c:forEach>
			</tbody>
		</table>
		<h2 id="h2" class="">總價：$<span id="totalPrice">0</span></h2>
		<br><br><br><br><br><br>
		<center>
			
			<a href="<c:url value='/removeAllCart' />"><input type="submit" name="confirm" value="返回商品頁面" class="submit"></a>
           
		</center>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
	
	<script>
	
	var total=0;
	$('.total').each(function(){
		$(this).html;
		var a = parseInt($(this).html());
		total=total+a

		})
	
	$('#totalPrice').html(total)
	</script>


	
	</body>