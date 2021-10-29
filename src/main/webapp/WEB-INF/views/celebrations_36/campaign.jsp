<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel='stylesheet' href="<c:url value='/css/styles.css' />"  type="text/css" />
<title>Product</title>
</head>
<body> 
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>活動資料</h2>
			</div>
		</div>
	</section>
	<div align='center'>
        <a href="<c:url value='/campaigns' />">回前頁</a>
    </div>   
    <hr>
    <div align='center'>
    		<img style="margin-bottom:80px" width='500' height='300'
   			  src="<c:url value='/getCampaignPicture/${campaign.id}'/>" />
    </div>
	<section class="container" >
		<div class="row" style="margin-left:400px" >
			<div class="col-md-5" style="border:3px solid blue">
				
				<p>
					<strong>活動編號: </strong> <span class='label label-warning'>
						${campaign.id} </span>
				</p>
				<p>活動名稱: ${campaign.name}</p>
				<p>活動內容: ${campaign.description}</p>
			
				<p>備註: ${campaign.note}</p>
				
				<p>
					<a href="<spring:url value='/campaigns' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
				
				</p>
			</div>
		</div>
	</section>
</body>
</html>
