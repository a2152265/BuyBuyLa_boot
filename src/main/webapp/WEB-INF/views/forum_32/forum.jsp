<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>討論區</title>
<!-- Jquery JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<!-- css -->
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style32.css'>
<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/js/forum_upd_32.js'></script>
</head>
<body class="bg-light">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">討論區</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Dropdown </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link disabled">Disabled</a>
					</li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="搜尋作者、文章..."
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="row" style="margin-top:200px">
		<div class="col-6 col-md-3" style="margin-left: 150px; width: 260px">
			<div class="accordion" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							官方資訊區</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse"
						aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<a href="#" style="text-decoration: none; color: black"><span
								class="tata">官方最新公告區</span></a>
							<hr>
							<a href="#" style="text-decoration: none; color: black"><span
								class="tata">賣家便利貼</span></a>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">賣家討論區
						</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse"
						aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<a href="#" style="text-decoration: none; color: black"><span
								class="tata">話題區</span></a>
							<hr>
							<a href="#" style="text-decoration: none; color: black"><span
								class="tata">新手賣家發問區</span></a>
							<hr>
							<a href="#" style="text-decoration: none; color: black"><span
								class="tata">賣家閒聊討論區</span></a>
						</div>
					</div>
				</div>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour">動態貼文
						</button>
					</h2>
					<div id="collapseFour" class="accordion-collapse collapse"
						aria-labelledby="headingFour" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<a href="<c:url value="forum"/>"
								style="text-decoration: none; color: black"><span
								class="tata">所有文章</span></a>
							<hr>
							<a href="<c:url value="chat"/>"
								style="text-decoration: none; color: black"><span
								class="tata">閒聊</span></a>
							<hr>
							<a href="<c:url value="box"/>"
								style="text-decoration: none; color: black"><span
								class="tata">開箱文</span></a>
							<hr>
							<a href="<c:url value="other"/>"
								style="text-decoration: none; color: black"><span
								class="tata">其他</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-12 col-md-9 bg-white" style=" border: 1px solid black; width:60%;padding: 20px; margin-left:50px">
		<div>
		<b>話題區</b>
		<div class="btn-group mb-3">
		  <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
		    排序依據
		  </button>
		  <ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="#">最新</a></li>
		    <li><a class="dropdown-item" href="#">最熱門</a></li>
		  </ul>
		</div>
		<button style="float: right;" type="button" class="btn btn-outline-danger mb-3" data-bs-toggle="modal" data-bs-target="#Modal">發起討論</button>
		</div><br>
			
			<c:forEach var='content' items='${content}'>
				<div class="card mx-auto"
					style="width: 54rem; padding: 10px; border: outset; border-radius: 3%">
<!-- 					style="width: 34rem; padding: 10px; border: outset; border-radius: 3%"> -->
					<div>
						<img src="" style="width: 50px; height: 50px; border-radius: 50%;">
						<span>${content.userName}</span> <img id="edit"
							data-bs-toggle="dropdown" aria-expanded="false"
							class="dropdown-toggle"
							style="cursor: pointer; float: right; width: 30px; height: 30px;"
							src="https://cdn-icons-png.flaticon.com/128/1827/1827933.png">
						<ul class="dropdown-menu">
							<li data-id="${content.id}" style="cursor: pointer"
								data-bs-toggle="modal" data-bs-target="#UpdateModal"
								class="dropdown-item updateDataClass">編輯</li>
							<li style="cursor: pointer" class="dropdown-item"
								onclick="if(window.confirm('確定要刪除？')) location.href =' <c:url value='/delete32?id=${content.id}'/>'">刪除</li>
							<li><a class="dropdown-item" href="#">隱藏此用戶貼文</a></li>
						</ul>
					</div>
					<br>
						<h1>${content.title}</h1>
					<div class="card-body">
						<div>
							<p class="card-text">${content.content}</p>
							<div>
								<hr>
								<%-- <a href="#" class="btn" style="background-color: rgb(171, 131, 102); color: cornsilk;">${content.tag}</a> --%>
								<div class="functionBtn">
									<img style="width: 25px;"
										src="https://cdn-icons-png.flaticon.com/128/633/633759.png">
									讚
								</div>
								<div class="functionBtn message">
									<img style="width: 25px;"
										src="https://cdn-icons-png.flaticon.com/128/739/739286.png">
									留言
								</div>
								<div class="functionBtn">
									<img style="width: 25px;"
										src="https://cdn-icons.flaticon.com/png/128/2958/premium/2958783.png?token=exp=1635279746~hmac=ac2bac0097337bc02fd875a7da6a5be5">
									分享
								</div>
								<hr>
								<img src="" style="width: 50px; height: 50px; border-radius: 50%;"> 
									<input style="border-radius: 10px;" type="text" size="50" placeholder="留言......">
							</div>
						</div>
					</div>
					<span>最後發表 ${content.date} </span>
				</div>
				<br>
			</c:forEach>
		</div>
	</div>


	<div class="modal fade" id="Modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<form:form method='POST' modelAttribute="forumBean"
				class='form-horizontal' enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<select style="width:200px" id="insSelectTag" class="form-select" aria-label="Default select example">
							<option>話題區</option>
							<option>新手賣家發問區</option>
							<option>賣家閒聊討論區</option>
						</select>
						<h3 style="margin-left:150px;" class="modal-title"
							id="exampleModalLabel">建立貼文</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body insContentBody">
						<form:input path="userName" type="text" value="廖總"
							style="display:none" />
						<div class="mb-3">
							<form:input type="text" path="date" id="nowDate"
								style="display:none" />
							<form:input path="tag" type="text" id="insTag" style="display:none" />
							<br>
							<form:input type="text" path="title" placeholder="標題" style="font-size: 30px" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"/>
							<form:textarea path="content" class="form-control content" placeholder="請輸入內文" rows="7" id="recipient-name" style="display:none"/> 
							<div id="summernote"></div>
							<div class="mb-3">
								<form:input style="display:none" class="form-control" path="image" id="insImgBtn" type="file" /> 
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="insSubmit" type="submit" class="btn btn-primary">送出</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	
	
	<div class="modal fade" id="UpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<form:form method='POST' modelAttribute="updateForumBean"
				class='form-horizontal' enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
							<select style="width:200px" id="insSelectTag" class="form-select" aria-label="Default select example">
								<option>話題區</option>
								<option>新手賣家發問區</option>
								<option>賣家閒聊討論區</option>
							</select>
						<h3 style="margin-left:150px;" class="modal-title"
							id="exampleModalLabel">編輯貼文</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body updContentBody">
					<form:input id="updid" path="id" type="text" style="display:none" />
						<form:input path="userName" type="text" value="廖總"
							style="display:none" />
						<div class="mb-3">
							<form:input type="text" path="date" id="nowUpdDate"
								style="display:none" />
							<form:input path="tag" type="text" id="updTag"
								style="display:none" />
<!-- 							<img id=insImgshow class="img-thumbnail" src="" -->
<!-- 								style="width: 100%; height: 200px;"> -->
							<br>
							<form:input type="text" placeholder="標題" path="title" style="font-size: 30px" class="form-control updTitle" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"/>
							<form:textarea path="content" class="form-control updContent"
								placeholder="請輸入內文" rows="7" id="recipient-name" style="display:none"/> 
							<div id="summernote2"></div>
							<div class="mb-3">
								<form:input class="form-control" path="image" id="insImgBtn"
 									type="file" style="display:none" /> 
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


<!-- jquery -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_jqu_32.js'></script>
<!-- summernote -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src='${pageContext.request.contextPath}/js/forum_sum_32.js'></script>
</body>
</html>