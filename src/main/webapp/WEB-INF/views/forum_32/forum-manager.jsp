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
<!-- Jquery JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/js/forum_manage_upd_32.js'></script>

	<!-- css -->
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style32.css'>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
    <link rel='stylesheet' href="<spring:url value='/css/member.css' />"  type="text/css" />
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
 
 
  <script>
  $(document).ready(function () {
          jQuery('#example').DataTable();
      });
  </script>
  

  
</head>
<body>
    <div class="wrapper">
       <div class="section">
    <div class="top_navbar" style="background: rgb(61, 27, 75);">
      <div class="hamburger">
        <a href="#">
          <i class="fas fa-bars"></i>
        </a>
      </div>
    </div>
    <div class="container">
       <span style="font-size: 40px;">討論區清單</span>
      </div>
      <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>編號</th>
                <th>會員名稱</th>
                <th>標籤</th>
                <th>標題</th>
                <th>發表時間</th>
                <th>修改</th>
              </tr>
        </thead>
        <tbody>
            <c:forEach var="content" items="${content}">
                <tr>
                  <td><c:out value="${content.id}" /></td>
                  <td><c:out value="${content.userName}" /></td>
                  <td><c:out value="${content.tag}" /></td>
                  <td><c:out value="${content.title}" /></td>
                  <td><c:out value="${content.date}" /></td>
                  <td>
                  <button type="button" class="btn btn-link updateDataClass" data-id="${content.id}" data-bs-toggle="modal" data-bs-target="#UpdateModal">編輯</button>
                  <button type="button" class="btn btn-link" onclick="if(window.confirm('確定刪除?')) location.href='<c:url value='/manager/delete32?id=${content.id}'/>' ">刪除</button>
                  </td>                      
                </tr>
                 </c:forEach>
        </tbody>
    </table>
  </div>
        <div class="sidebar" style="background: rgb(66, 9, 122);">
            <div class="profile">
                <img src="https://i.ytimg.com/vi/LMu_WwyqZJI/maxresdefault.jpg" alt="profile_picture">
                <h3></h3>
                <p>Designer</p>
            </div>
            <ul>
                <li>
                    <a href="<c:url value='???' />" class="active">
                        <span class="icon"><i class="fas fa-home"></i></span>
                        <span class="item">Home</span>
                    </a>
                </li>
                <li>
                    <a href="<c:url value='???' />"">
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
                    <a href="<c:url value='/manager/forum' />">
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
    
  <div class="modal fade" id="UpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<form:form method='POST' modelAttribute="updateManager"
				class='form-horizontal' enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<select id="updSelectTag" class="form-select"
							aria-label="Default select example">
							<option>新手賣家發問區</option>
							<option>賣家閒聊討論區</option>
						</select>
						<h3 class="modal-title"
							id="exampleModalLabel">編輯貼文</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body updContentBody">
						<form:input id="updid" path="id" type="text" style="display:none" />
						<form:input path="userName" type="text" value="廖總" class="display-none" />
						<div class="mb-3">
							<form:input type="text" path="date" id="nowUpdDate"
								class="display-none" />
							<form:input path="tag" type="text" id="updTag"
								class="display-none" />
							<br>
							<form:input type="text" required="true" placeholder="標題"
								path="title"
								class="form-control updTitle title-fontsize" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg" />
							<br>
							<form:textarea path="content" class="form-control updContent"
								 rows="7" id="recipient-name" style="display:none;" />
							<div id="summernote2"></div>
							<div class="mb-3">
								<form:input style="display:none;" class="form-control display-none" path="image" id="insImgBtn" type="file" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="updSubmit" type="submit" class="btn btn-primary">送出</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">取消</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
    
    <script>
          var hamburger = document.querySelector(".hamburger");
  hamburger.addEventListener("click", function(){
    document.querySelector("body").classList.toggle("active");
  })
    </script>
    
    	<!-- jquery -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_jqu_32.js'></script>
	<!-- summernote -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_sum_32.js'></script>

</body>
</html>