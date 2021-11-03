<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>購物車</title>

<link rel="stylesheet" type="text/css" href="cart.css" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<script type="text/javascript" src="cookie.js"></script>

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
	<div class="container">
		<div id="title" class="title">
			<h1>購物車</h1>
			<div class="search">
				<button class="icon">
					<i class="fa fa-search"></i>
				</button>
				<input type="search" id="search" placeholder="Search..." />
			</div>
		</div>

		<h3>
			<a href="<c:url value='/products' />">返回商品頁面</a>
		</h3>
		<table>
			<thead>
				<tr>
					<th>圖片</th>
					<th>商品名稱</th>
					<th>數量</th>
					<th>單價</th>
					<th>合計</th>
					<th>刪除</th>
				</tr>
			</thead>
			<tbody id="tbody">
			<c:forEach var="row" items="${cart}">
				<tr>
					<td><img width='150'src="<c:url value='/getPicture/${row.pid}' />" /></td>
					<td>${row.p_name}</td>
					<td>

					<button class="down"  value='${row.pid}'>-</button>
					<input  class="cnt" type="text" value="${row.count}" readonly="readonly" />

					<button class="up" value='${row.pid}'>+</button>
					</td>
					<td>NT<span>${row.p_price}</span></td>
					<td>NT<span class="total">${row.count*row.p_price}</span></td>
					<td>
						<a href="<c:url value='/deletecart' />?id=${row.pid}"></a>
						<button class='deletecart' value='${row.pid}'>刪除</button>
					</td>
				</tr>
			
		</c:forEach>
			</tbody>
		</table>
		
		<h2 id="h2" class="">
			總價：$<span id="totalPrice">0</span>
		</h2>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<center>
		
			<a href="<c:url value='/check' />"><input type="submit" name="confirm"
				value="我要結帳" class="submit"></a>
		</center>
	</div>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	
	$(".down").click(function(){		
	var cnt = $(".cnt").val();
	var cnt2;
	var data=$(this).val();
	console.log(data+"************************");
	$.ajax({
		type:'get',
		url:'sub',
		data:{
			"id":data
		},
		
		success:function(){
			cnt2=parseInt(cnt)-1;
			$(".cnt").val(cnt2);
			console.log(cnt2)
		}
								
	});			
});

	
	$(".up").click(function(){		
	var cnt = $(this).prev().val(); 
	
	console.log("cnt=="+cnt)
	var data=$(this).val();

	$.ajax({
		type:'get',
		url:'add',
		data:{
			"id":data
		},
		
		success:function(result){
			console.log("result=="+result)
			
// 			console.log("cnt2 = "+cnt2);
			
		}
								
	});			
});
	
	$(".deletecart").click(function(){		
//		var data=$("#form1").serializeArray();
	var data=$(this).val();
	console.log(data+"************************");
	$.ajax({
		type:'get',
		url:'deletecart',
		data:{
			"id":data
		},
		
		success:function(){
			 console.log("77777777")
		}
								
	});			
});


	
	
	
	var total=0;
	$('.total').each(function(){
		$(this).html;
		var a = parseInt($(this).html());
		total=total+a

		})
	
	$('#totalPrice').html(total)
	
	</script>
	
</body>



</html>