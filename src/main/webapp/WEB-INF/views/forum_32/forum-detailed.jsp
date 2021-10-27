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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- summernote -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<!-- css -->
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style32.css'>
<!-- js -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src='${pageContext.request.contextPath}/js/forum_upd_32.js'></script>
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
			</div>
		</div>
	</nav>
	
	
	<div style="margin-left:450px;margin-top:100px"><a href='#'>
	<img style="width:20px" src="https://cdn-icons.flaticon.com/png/128/1620/premium/1620735.png?token=exp=1635307864~hmac=9424e67cb077c43e95098bc0f110ba19">
	#${fb.tag}<br><br><br></a>
	<div>
	<img src="https://storage.googleapis.com/shopeetw-university/static/avatar.jpg" style="width: 60px; height: 60px; border-radius: 50%;float:left;"> 
	<span style="margin-left: 15px; font-size:20px">${fb.userName}<br></span>
	<span style="margin-left: 15px; font-size:20px">${fb.date}</span>
	</div><br>
	<h1>${fb.title}</h1>
	
						<img id="edit" data-bs-toggle="dropdown" aria-expanded="false"
							class="dropdown-toggle"
							style="cursor: pointer; margin-left:700px; width: 50px; height: 50px;"
							src="https://cdn-icons-png.flaticon.com/128/1827/1827933.png">
						<ul class="dropdown-menu">
							<li data-id="${fb.id}" style="cursor: pointer"
								data-bs-toggle="modal" data-bs-target="#UpdateModal"
								class="dropdown-item updateDataClass">編輯</li>
							<li style="cursor: pointer" class="dropdown-item"
								onclick="if(window.confirm('確定要刪除？')) location.href =' <c:url value='/delete32?id=${fb.id}'/>'">刪除</li>
							<li><a class="dropdown-item" href="#">隱藏此用戶貼文</a></li>
							<li><a class="dropdown-item" href="#">檢舉</a></li>
						</ul>
	</div>
	<div class="row" style="margin-top: 30px">
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
							<a href="<c:url value='/announcement' />"
								style="text-decoration: none; color: black"><span
								class="tata">官方最新公告區</span></a>
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
							<a href="<c:url value='/forum'/>"
								style="text-decoration: none; color: black"><span
								class="tata">所有討論</span></a>
							<hr>
							<a href="<c:url value='/noviceSeller' />"
								style="text-decoration: none; color: black"><span
								class="tata">新手賣家發問區</span></a>
							<hr>
							<a href="<c:url value='/sellerChat' />"
								style="text-decoration: none; color: black"><span
								class="tata">賣家閒聊討論區</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-12 col-md-9 bg-white" style="width: 60%; padding: 20px; margin-left: 50px">
			<div class="detailed" style="padding:40px">
				${fb.content}
				<br><hr><br>
				<div>
				<a href="#">
				<img style="width:40px" src="https://cdn-icons.flaticon.com/png/128/2652/premium/2652197.png?token=exp=1635308939~hmac=ee11ed72734ee75a3938393599f8dd85">
				讚</a>
				</div>
			</div>	
		</div>
		
		<div class="col-12 col-md-9 bg-white"
			style="width: 60%; padding: 20px; margin-left: 460px; margin-top:20px">
			<div class="detailed" style="padding:40px">
			<span style="font-size:30px">0則留言</span>
				<br><hr><br>
				<div>
				<img src="https://storage.googleapis.com/shopeetw-university/static/avatar.jpg" style="width: 60px; height: 60px; border-radius: 50%;float:left;margin-right:30px"> 
				<form:form method='POST' modelAttribute="messageBean" class='form-horizontal' enctype="multipart/form-data">
				<form:textarea path="messageContent" rows="4" cols="60" placeholder="新增留言..." />	
				<form:input type="text" path="forumId" value="${forumId}" style="display:none" />		
				<form:input type="text" path="userName" value="廖總" style="display:none" />		
				<form:input type="text" path="userEmail" value="c123@gmail.com" style="display:none" />		
				<form:input type="text" path="date" id="messageDate" style="display:none" />
				<br>
				<button type="submit" class="btn btn-secondary btn-lg">送出</button>
				</form:form>
				
				</div>
				<br><br><br>
				<hr>
				<c:forEach var='msg' items='${msg}'>
					<div>
					<label style="float:right">${msg.id}樓</label>
					<img src="https://storage.googleapis.com/shopeetw-university/static/avatar.jpg" style="width: 60px; height: 60px; border-radius: 50%;float:left;"> 
					<span style="margin-left: 15px; font-size:20px">${msg.userName}<br></span>
					<span style="margin-left: 15px; font-size:20px">${msg.date}</span>
					</div>
					<br>
					<p style="margin-left:80px">${msg.messageContent}</p>
					<hr>
				</c:forEach>
			</div>	
		</div>
	</div>


	<div class="modal fade" id="UpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<form:form method='POST' modelAttribute="updateForumBean"
				class='form-horizontal' enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<select style="width: 200px" id="insSelectTag" class="form-select"
							aria-label="Default select example">
							<option>新手賣家發問區</option>
							<option>賣家閒聊討論區</option>
						</select>
						<h3 style="margin-left: 150px;" class="modal-title"
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
							<br>
							<form:input type="text" required="true" placeholder="標題"
								path="title" style="font-size: 30px"
								class="form-control updTitle" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg" /><br>
							<form:textarea path="content" class="form-control updContent"
								placeholder="請輸入內文" rows="7" id="recipient-name"
								style="display:none" />
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_jqu_32.js'></script>
	<!-- summernote -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_sum_32.js'></script>

</body>
</html>