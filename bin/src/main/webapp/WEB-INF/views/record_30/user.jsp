<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: "微軟正黑體";
	background-color: rgb(203, 218, 218);
	align-items: center;
	justify-content: center;
	position: relative;
}

div {
	display: flex;
	width: 360px;
	border: lightblue 3px solid;
	margin: 0 auto;
}

h1 {
	background-color: #f7f7f7;
	/* 告訴電腦背景顏色 */
	padding: 18px 0 16px 22px;
	/* 告訴電腦內距要多大 */
	border-left: 8px solid #33779e;
	/* 告訴電腦左邊框要多寬、跟顏色 */
	color: #333 !important;
	/* 告訴電腦文字顏色 */
	width: 300px;
}

.wrap {
	text-align: center;
	margin-top: 50px;
}

.button {
	width: 140px;
	height: 45px;
	font-family: 'Roboto', sans-serif;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #fff;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

.button:hover {
	background-color: #33779e;
	color: #fff;
	transform: translateY(-7px);
}

span {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<body>
	<h1 ALIGN="center">購物記錄管理</h1>
	<div>
		<a href="<c:url value='/select' />">
			<button class='btn btn-default' type='submit' value='submit'
				style="width: 120px; height: 50px; font-size: 30px;">
				<i class="fas fa-search"></i>查詢
			</button>

		</a> <a href="<c:url value='/update30' />">

			<button class='btn btn-default' type='submit' value='submit'
				style="width: 120px; height: 50px; font-size: 30px;">
				<i class="fas fa-pencil-alt"></i>修改
			</button>

		</a> <a href="<c:url value='/delete' />">

			<button class='btn btn-default' type='submit' value='submit'
				style="width: 120px; height: 50px; font-size: 30px;">
				<i class="fas fa-trash-alt"></i>刪除
			</button>

		</a>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<span class="wrap"> <a href="<c:url value='/products' />"><input
			type="submit" name="update" class="button" value="返回首頁" /></a>

	</span>

</body>
</html>