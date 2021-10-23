<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>

<link rel='stylesheet' href='${pageContext.request.contextPath}/member_25/css/style.css' />
<meta charset="UTF-8">
<title>會員資料管理</title>
</head>  
<body>
<p>&nbsp;</p>
<hr>
<div class='center' >
<h2>會員管理</h2>
<hr>
<a href='MemberForm.jsp' >會員資料新增</a><br>
<a href='queryMember.do' >會員資料查詢</a><br>
<hr><hr>

<form:form method='POST' modelAttribute="loginSessionBean"
	class='form-horizontal' enctype="multipart/form-data">
			<!-- 檔案上傳的標籤一定要有enctype="multipart/form-data -->
			
<a href="<c:url value='/session' />">sessionAttribute測試</a><BR>	
<hr><hr>			
<a href="<c:url value='/member/add' />">新增會員資料</a><BR>
<a href="<c:url value='/member/login' />">登入會員</a><BR>
<hr><hr>
<a href="<c:url value='/member/logout' />">登出會員</a><BR>
<hr><hr>
<a href="<c:url value='/member/update' />">  <input type="submit" value="會員專區button" id=memberUI"  name="memberUI">會員專區(買家)</a><BR>
<a href="<c:url value='/member/update' />">  <button type="submit" id="btnAdd"  name="submit" value="註冊1" style=""></button>
   tEST</a>
<br>

<hr>

			<hr>

			 Hello!!!!     ${loginSessionBean.userEmail}
			
			</form:form>
			
<hr>
<hr>

<sql:setDataSource var="BuyBuyLa" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
url="jdbc:sqlserver://localhost:1433;databaseName=BuyBuyLa"
user="sa"  password="password"/>

<sql:query dataSource="${BuyBuyLa}" var="member"
 
 sql="SELECT * from membershipInformation where userEmail='a1@gmail.com'"
 
 />
 
 <c:forEach var="row" items="${member.rows}">

     ${row.userEmail}  
 
</c:forEach>
 






<a href='..'>回前頁</a>

</div>
</body>
</html>