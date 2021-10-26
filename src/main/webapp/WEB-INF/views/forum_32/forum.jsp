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

<style>
.tab {
	display: block;
	margin: 50px;
}

.tab :hover {
	background-color: rgb(194, 203, 186);
}

.tab li {
	display: inline;
	border: 1px solid rgb(166, 184, 184);
	margin: 10px;
	padding: 10px 0px;
}

.tab li a {
	margin: 0 auto;
	color: black;
	text-decoration: none;
	padding: 10px 50px;
}

nav {
	text-align: center;
}

hr {
	margin: 0.7rem 0;
}

h1 {
	display: inline;
}

.functionBtn {
	display: inline;
	padding: 10px 50px;
}

.functionBtn:hover {
	background-color: lightgray;
	cursor: pointer;
}

.newContent {
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 50px;
}

.card {
	overflow: hidden;
}

.productImg img {
	transform: scale(1, 1);
	transition: all 1s ease-out;
}

.productImg img:hover {
	transform: scale(1.05, 1.05);
}

.tata {
	cursor: pointer;
}

.tata:hover {
	color: red;
}

#edit {
	transform: scale(1, 1);
}

#edit:hover {
	transform: scale(1.1, 1.1);
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('.updateDataClass').click(function(){
			var dataid=$(this).data('id');
			console.log(dataid);
			$.ajax({
				type:"GET",
				url:"editURL",
				data:{
					"id":dataid
				},
				success:function(data){
					$('.updContent').text(data['content']);
					$('#updImgshow').attr('src','<c:url value='/getPicture32/' />'+dataid);
					$('#updid').val(data['id']);
				}
			})
		});
	});
</script>
</head>
<body>
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

	<div class="newContent">
		<button type="button" class="btn btn-outline-secondary"
			data-bs-toggle="modal" data-bs-target="#Modal">新增貼文</button>
	</div>
	<div class="row">
		<div class="col-6 col-md-3" style="margin-left: 200px; width: 260px">
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
								class="tata">精選話題區</span></a>
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
		
		<div class="col-12 col-md-9"
			style="margin-left: 80px; width: 45%; border: 1px solid black; padding: 40px;">
			<c:forEach var='content' items='${content}'>
				<div class="card mx-auto"
					style="width: 34rem; padding: 10px; border: outset; border-radius: 3%">
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
					<div class="productImg">
						<a href="#"> <img style="width: 522px; height: 347px"
							class="card-img-top"
							src="<c:url value='/getPicture32/${content.id}' />" />
						</a>
					</div>
					<div class="card-body">
						<div>
							<p class="card-text">${content.content}</p>
							<div>
								<hr>
								<%-- 							<a href="#" class="btn" style="background-color: rgb(171, 131, 102); color: cornsilk;">${content.tag}</a> --%>
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
										src="https://cdn-icons.flaticon.com/png/128/2958/premium/2958783.png?token=exp=1635147050~hmac=33064c751b5b32486e2467622d021dc8">
									分享
								</div>
								<hr>
								<img src=""
									style="width: 50px; height: 50px; border-radius: 50%;"> <input
									style="border-radius: 10px;" type="text" size="50"
									placeholder="留言......">
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
		<div class="modal-dialog">
			<form:form method='POST' modelAttribute="forumBean"
				class='form-horizontal' enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<h3 style="margin-left: auto;" class="modal-title"
							id="exampleModalLabel">建立貼文</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body insContentBody">
						<form:input path="userName" type="text" value="廖總"
							style="display:none" />
						<div class="mb-3">
							<label>分類標籤</label> <select id="insSelectTag" class="form-select" aria-label="Default select example">
								<option>忙裡偷閒聊</option>
								<option>開箱文</option>
								<option>其他</option>
							</select><br> <br>
							<form:input type="text" path="date" id="nowDate"
								style="display:none" />
							<form:input path="tag" type="text" id="insTag"
								style="display:none" />
							<img id=insImgshow class="img-thumbnail" src=""
								style="width: 100%; height: 200px;"><br>
							<br>
							<div class="mb-3">
								<form:input class="form-control" path="image" id="insImgBtn"
									type="file" />
							</div>
							<form:textarea path="content" class="form-control"
								placeholder="在想什麼呢？" rows="7" id="recipient-name" />
						</div>
					</div>
					<div class="modal-footer">
						<button id="submit" type="submit" class="btn btn-primary">送出</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">取消</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>


	<div class="modal fade" id="UpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form:form method='POST' modelAttribute="updateForumBean"
				class='form-horizontal updform' enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<h3 style="margin-left: auto;" class="modal-title"
							id="exampleModalLabel">編輯貼文</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body updContentBody">
						<form:input path="userName" type="text" value="asd123"
							style="display:none" />
						<form:input id="updid" path="id" type="text" style="display:none" />
						<div class="mb-3">
							<label>分類標籤</label> <select id="updSelectTag">
								<option>忙裡偷閒聊</option>
								<option>開箱文</option>
								<option>其他</option>
							</select><br> <br>
							<form:input type="text" path="date" id="nowUpdDate"
								style="display:none" />
							<form:input path="tag" type="text" id="updTag"
								style="display:none" />
							<img id='updImgshow' class="img-thumbnail" src=""
								style="width: 100%; height: 300px;"><br>
							<br>
							<div class="mb-3">
								<form:input class="form-control" path="image" id="updImgBtn"
									type="file" />
							</div>
							<form:textarea path="content" class="form-control updContent"
								placeholder="在想什麼呢？" rows="7" id="recipient-name" />
						</div>
					</div>
					<div class="modal-footer">
						<button id="submit" type="submit" class="btn btn-primary">送出</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">取消</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(function() {
			// 新增
			$("#insImgBtn").change(function() {
				var readFile = new FileReader();
				var mfile = $("#insImgBtn")[0].files[0];
				readFile.readAsDataURL(mfile);
				readFile.onload = function() {
					var img = $("#insImgshow");
					img.attr("src", this.result);
				}
			})
		     $('.insContentBody').on('mouseover',function(){
		        $('#insTag').val($('#insSelectTag option:selected').text())
		     })
			 var date = new Date();
		     const formatDate = (date)=>{
		     let formatted_date = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours()+":"+date.getMinutes()
		     return formatted_date;
		     }
		     $('#nowDate').val(formatDate(date))
		     // 修改
		     $("#updImgBtn").change(function() {
				var readFile = new FileReader();
				var mfile = $("#updImgBtn")[0].files[0];
				readFile.readAsDataURL(mfile);
				readFile.onload = function() {
					var img = $("#updImgshow");
					img.attr("src", this.result);
				}
			})
		     $('.updContentBody').on('mouseover',function(){
		        $('#updTag').val($('#updSelectTag option:selected').text())
		     })
			 var date = new Date();
		     const updFormatDate = (date)=>{
		     let updFormatted_date = date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + " " + date.getHours()+":"+date.getMinutes()
		     return updFormatted_date;
		     }
		     $('#nowUpdDate').val(updFormatDate(date))
			 })
		     
		     
    </script>
</body>
</html>