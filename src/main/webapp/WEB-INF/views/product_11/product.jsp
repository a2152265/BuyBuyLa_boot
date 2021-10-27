<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Product</title>
<link rel='stylesheet' href="<c:url value='/css/styles.css' />"  type="text/css" />
</head>
<body> 
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
		</div>
	</section>
	<div align='center'>
        <a href="<c:url value='${header.refer}' />">回前頁</a>
    </div>   
    <hr>
	<section class="container">
		<div class="row">
			<img width='400' height='400'
     			src="<c:url value='/getPicture/${product.productId}'/>" />     
			<div class="col-md-5">
				<h3>${product.productName}</h3>
				<p>庫存: ${product.stock}</p>
				<p>單價: ${product.price}</p>
				<p>書籍分類: ${product.category}</p>
				<p>商品描述: ${product.productInfo}</p>
				<p>
					<strong>商品編號: </strong> <span class='label label-warning'>
						${product.productNo} </span>
				</p>
				<p>
					<a href="<spring:url value='/products' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
					<a href="<c:url value='/additem' />?id=${product.productId}">
					    <span class='glyphicon-shopping-cart glyphicon'></span>加入購物車
					</a>
				</p>
			</div>
		</div>
	</section>
</body>
</html>
