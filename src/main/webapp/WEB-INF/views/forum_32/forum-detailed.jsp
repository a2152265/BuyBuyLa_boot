<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${fTitle}</title>
<!-- <title>Details</title> -->
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="css/productstyle.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href='css/style32.css' rel='stylesheet' >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src='js/forum_ajax_32.js'></script>
<script src='js/forum_ajax_like_32.js'></script>
<script src='js/forum_keyInput_32.js'></script>
<script src='js/forum_ajax_message_32.js'></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<!-- 使用者 -->
<input type="hidden" class="loginId" value="${loginSession.id}">
<input type="hidden" class="loginUser" value="${loginSession.userName}">
<input type="hidden" class="loginIdentification" value="${loginSession.identification}">
<input type="hidden" class="loginUserEmail" value="${loginSession.userEmail}">
<!-- 文章編號 -->
<input type="hidden" id="id" value="${forumId}">
<!-- <body  style="background:#F5F5F5"> -->
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<a class="navbar-brand logo_h" href="<c:url value='/' />"><img src="" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
							<li class="nav-item active"><a class="nav-link" href="<c:url value='/' />">Home</a></li>
							<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">會員</a>
								<ul class="dropdown-menu">
									<c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
										<li class="nav-item"><a class="nav-link" href="<c:url value='/try/login' />">會員登入</a></li>
										<li class="nav-item"><a class="nav-link" href="<c:url value='/try/add' />">會員註冊</a></li>
									</c:if>
									<c:if test="${loginSession.userEmail != null}">
										<li class="nav-item"><a class="nav-link" href="<c:url value='/member/evolution' />">賣家專區</a></li>
										<li class="nav-item"><a class="nav-link" href="<c:url value='/try/logout' />">會員登出</a></li>
									</c:if>
								</ul></li>
							<li class="nav-item submenu dropdown">
							<a href="<c:url value='/forum' />" class="nav-link dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">討論區</a>
							</li>
							<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">活動專區</a>
								<c:if test="${loginSession.userEmail != null}">
									<li class="nav-item">
									<a class="nav-link loginsession" href="<c:url value='/try/member_Ui' />">Hi!!! &nbsp; ${loginSession.userEmail}</a></li>
								</c:if>
						</ul>
						<ul class="nav-shop">
							<li class="nav-item">
								<form:form method='POST' action="./queryproduct" class='form-horizontal'>
									<input name="productName" id="productName" type='text' class='form:input-large' />
									<button type='submit'>
										<i class="ti-search"></i>
									</button>
								</form:form>
							<li class="nav-item">
							<button onclick="location.href='<c:url value='/cart' />'">
								<i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span>
							</button>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->
<!-- 	<section class="blog-banner-area" id="blog"> -->
<!-- 		<div class="container h-100"> -->
<!-- 			<div class="blog-banner"> -->
<!-- 				<div class="text-center"> -->
<!-- 					<h1>Details</h1> -->
<!-- 					<nav aria-label="breadcrumb" class="banner-breadcrumb"></nav> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->
	<!-- ================ end banner area ================= -->

	<!--================ 編輯Modal  =================-->
	<div class="modal fade" id="UpdateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" style="margin-top: 90px">
			<form:form method='POST' modelAttribute="editForumContent" class='form-horizontal' enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="exampleModalLabel">編輯貼文</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body updContentBody">
						<select id="updSelectTag">
							<option>新手賣家發問</option>
							<option>賣家閒聊討論</option>
						</select><br>
						<!-- 隱藏 -->
						<form:input path="id" id="updid" type="hidden" />
						<form:input path="tag" id="updTag" type="hidden" />
						<form:textarea path="content" class="updContent display-none" />
						<form:input path="date" id="nowUpdDate" type="hidden" />
						<form:input path="messageQty" type="hidden" value="${messageSize}" />
						<form:input path="picId" type="hidden" value="${loginSession.id}" />
						<form:input path="userName" type="hidden" value="${loginSession.userName}" class="forumUsername" />
						<form:input path="userEmail" type="hidden" value="${loginSession.userEmail}" />
						<form:input path="userNickname" type="hidden" value="${loginSession.userNickname}" />
						<form:input path="Identification" type="hidden" value="member" />
						<!-- 結束 -->
						<div class="mb-3">
						<select id="updSelectTag" class="form-select"
							aria-label="Default select example" style="width:200px">
							<option>新手賣家發問</option>
							<option>賣家閒聊討論</option>
						</select>
						<div class="mb-3"><br>
							<form:input type="text" required="true" placeholder="標題" path="title" class="form-control title-fontsize"
								aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" />
							<br>
							<div id="summernote"></div>
							<div class="mb-3"></div>
						</div>
					</div>
					<div class="modal-footer">
						<button id="updSubmit" type="submit" class="btn btn-primary">送出</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<!--=================================-->
	
	
	<!--================Blog Area =================-->
	<section
		class="blog_area single-post-area py-80px section-margin--small">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<ol style="background-color:#c6c2c2;list-style-type:none;width:150px;padding:10px;border-top-right-radius:30px;border-bottom-right-radius:30px;">
						<li><img src="<c:url value='img/forum/chat.png' />" style="width:17px;height:17px"> ${forumContent.tag}</li>
						</ol>
						
						<div style='width:700px'>
							<img data-bs-toggle="dropdown" aria-expanded="false" class="dropdown-toggle ml700w50h50tf11 editIMG" src="img/forum/edit.png">
							<ul class="dropdown-menu">
								<li data-id="${forumContent.id}" data-bs-toggle="modal" data-bs-target="#UpdateModal" class="dropdown-item updateDataClass">編輯</li>
								<li class="dropdown-item tata" onclick="if(window.confirm('確定要刪除？')) location.href =' <c:url value='/delete32?id=${forumContent.id}'/>'">刪除</li>
							</ul>
						</div>
						<h1 style="margin-top:50px">${forumContent.title}</h1>
						<br>
					<div style="margin-top:30px">	
						<img style="float:left;width:50px;height:50px;border-radius:50%" src="<c:url value='/getPicturefromMember/${forumContent.picId}'/>" />
						<span class="authorUserName" style="margin-left:10px">${forumContent.userName}</span><br>
						<span style="margin-left:10px;font-size:13px;color:#888888;">${forumContent.date}</span>
						<span style="float:right;margin-right:80px;">
						<img style="width:15px;" src="img/forum/speech-bubble.png">
						<span> ${forumContent.messageQty}</span>
						<img style="width: 15px; margin-left: 10px" src="img/forum/eye.png">
						<span> ${forumContent.viewQty}</span>
						</span>
					</div>
						<div class="col-lg-9 col-md-9 blog_details bg-light" style="width:850px;padding:30px;margin-top:10px">
							${forumContent.content}
						</div>
					</div><br>
					<div style='margin:10px'>
					<span id='likeImg' style="width:40px"></span>
					<span id='likeQty' style='font-size:20px;'></span>
					</div>
					<div class="navigation-area" style='margin:0px;'>
						<div class="row">
							<div class="previousBlock col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
								<div class="thumb">
									<a href="<c:url value="/detailed" />?id=${previous.id}"> 
									<img class="img-fluid" style="width: 60px; height: 60px;" src="<c:url value='/getPicturefromMember/${previous.picId}'/>">
									</a>
								</div>
								<div class="arrow">
									<a href="<c:url value="/detailed" />?id=${previous.id}"> 
									<span class="lnr text-white lnr-arrow-left"></span>
									</a>
								</div>
								<div class="detials">
									<p>上一篇</p>
									<a href="<c:url value="/detailed" />?id=${previous.id}">
									<h4 class="previousFail" style="font-size:14px">${previous.title}${previousFail}</h4>
									</a>
								</div>
							</div>
							<div class="afterBlock col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
								<div class="detials">
									<p>下一篇</p>
									<a href="<c:url value="/detailed" />?id=${after.id}">
									<h4 class="afterFail" style="font-size:14px">${after.title}${afterFail}</h4>
									</a>
								</div>
								<div class="arrow">
									<a href="<c:url value="/detailed" />?id=${after.id}"> 
									<span class="lnr text-white lnr-arrow-right"></span>
									</a>
								</div>
								<div class="thumb">
									<a href="<c:url value="/detailed" />?id=${after.id}"> 
									<img class="img-fluid" style="width: 60px; height: 60px;" src="<c:url value='/getPicturefromMember/${after.picId}'/>">
									</a>
								</div>
							</div>
						</div>
					</div>
				<div class="comments-area">
					<h4>${messageSize}則評論</h4>
				<div id="messageResult"></div>
				<div id="replyResult"></div>

						<!--================ 編輯評論 Modal =================-->
				<div class="modal fade" id="editMessageBtn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" style="margin-top:90px">
						<div class="modal-content" style="border-radius:20px">
							<div class="comment-form" id="reply" style="margin:0px;border-radius:20px">
								<h4 style="margin:0px">編輯評論</h4>
							<form id="editMsgForm" style="background-color:#fafaff;border-radius:5%;padding:15px">
								<input type="hidden" name="messageId" class="editMessageId">
								<input type="hidden" name="messageDate" class="editMessageDate"> 
								<input type="hidden" name="messageForumId" class="editMessageForumId"> 
								<input type="hidden" name="messageIdentification" class="editMessageIdentification">
								<input type="hidden" name="messagePicId" class="editMessagePicId"> 
								<div class="form-group form-inline">
									<div class="form-group col-lg-6 col-md-6 name">
										<input type="text" name="messageUserName" class="form-control editMessageUserName" placeholder="Guest" readonly="readonly">
									</div>
									<div class="form-group col-lg-6 col-md-6 email">
										<input type="email" name="messageUserEmail" class="form-control editMessageUserEmail" readonly="readonly" placeholder="Email address">
									</div>
								</div>
								<div class="form-group">
									<textarea rows="5" name="messageContent" class="form-control mb-10 editMessageContent" placeholder="留言"></textarea>
								</div>
								<button class="button button-postComment button--active editMessageBtn" type="button" style="border: none">確定修改</button>
							</form>
								<button class="DetailedEditMessageKeyInput">一鍵輸入</button>
							</div>
						</div>
					</div>
				</div>
						
						<!--================ 檢舉評論 Modal =================-->
				<div class="modal fade" id="reportBtn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" style="margin-top:90px">
						<div class="modal-content" style="border-radius:20px">
							<div class="comment-form" id="reply" style="margin:0px;border-radius:20px">
							<form id="reportMessageForm" style="background-color:#fafaff;border-radius:5%;padding:15px">
								<span style="font-size:30px">檢舉評論</span>
									<select id="reportSelect" class="right">
										<option>有不當的內容</option>
										<option>誤導或詐欺</option>
										<option>垃圾訊息</option>
										<option>冒犯他人</option>
										<option>其他</option>
									</select>
								<input type="hidden" class="reportMessageId" > 
								<input type="hidden" class="reportUserName" > 
								<input type="hidden" class="reportedUserName" > 
								<input type="hidden" class="reportSelect" > 
								<input type="hidden" class="reportDate" >
								<input type="hidden" class="reportedUserEmail">
								<br><br>
								檢舉內容
								<div class="form-group">
									<textarea rows="5" name="ReportContent" class="form-control mb-10 reportedContent" readonly="readonly"></textarea>
								</div>
								<button class="button button-postComment button--active reportMessageBtn" type="button" style="border: none">送出</button>
							</form>
							</div>
						</div>
					</div>
				</div>
						<!--================ 檢舉評論reply Modal =================-->
				<div class="modal fade" id="replyReportBtn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" style="margin-top:90px">
						<div class="modal-content" style="border-radius:20px">
							<div class="comment-form" id="reply" style="margin:0px;border-radius:20px">
							<form id="reportMessageForm" style="background-color:#fafaff;border-radius:5%;padding:15px">
								<span style="font-size:30px">檢舉評論</span>
									<select id="reportSelect" class="right">
										<option>有不當的內容</option>
										<option>誤導或詐欺</option>
										<option>垃圾訊息</option>
										<option>冒犯他人</option>
										<option>其他</option>
									</select>
								<input type="text" class="reportReplyId" > 
								<input type="text" class="messageReplyId" > 
								<input type="text" class="reportReplyUserName" > 
								<input type="text" class="reportedReplyUserName" > 
								<input type="text" class="reportReplySelect" > 
								<input type="text" class="reportReplyDate" >
								<input type="text" class="reportedReplyUserEmail">
								<br><br>
								檢舉內容
								<div class="form-group">
									<textarea rows="5" name="ReportContent" class="form-control mb-10 reportedReplyContent" readonly="readonly"></textarea>
								</div>
								<button class="button button-postComment button--active reportMessageBtn" type="button" style="border: none">送出</button>
							</form>
							</div>
						</div>
					</div>
				</div>
				

					
				<!--================ 評論分頁 =================-->
			<nav class="blog-pagination justify-content-center d-flex" style="padding-bottom: 0px">
				<ul class="pagination">
					<li class="page-item leftBtn">
					<a class="page-link" aria-label="Previous"> 
					<span aria-hidden="true"> 
						<span class="lnr lnr-chevron-left"></span>
					</span>
					</a>
					</li>
					<c:forEach items='${msgSize}' varStatus="c" step="4">
						<li class="page-item"><input type="button" class="page-link pageBtn" style="border: none" value="${c.count}"></li>
					</c:forEach>
					<li class="page-item rightBtn"><a class="page-link" aria-label="Next"> <span aria-hidden="true">
					<span class="lnr lnr-chevron-right"></span></span></a>
					</li>
				</ul>
			</nav>
			<div style="text-align: center;">第<label class="pages"></label>頁</div>
			<div class="comment-form" id="reply">
				<h4 class="newMessageH4">發表評論</h4>
				<form id="addMsgForm" enctype="multipart/form-data">
					<input type="hidden" name="messageForumId" value="${forumId}">
					<input type="hidden" name="messagePicId" value="${loginSession.id}"> 
					<input type="hidden" name="messageDate" id="messageDate"> 
					<input type="hidden" name="messageIdentification">
					<div class="form-group form-inline messageContentBlock">
						<div class="form-group col-lg-6 col-md-6 name">
							<input type="text" name="messageUserName" class="form-control" value="${loginSession.userName}" placeholder="Guest" readonly="readonly">
						</div>
						<div class="form-group col-lg-6 col-md-6 email">
							<input type="email" name="messageUserEmail" class="form-control" readonly="readonly" placeholder="Email address" value="${loginSession.userEmail}">
						</div>
					</div>
					<div class="form-group messageContentBlock">
						<textarea rows="5" name="messageContent" class="form-control mb-10 messageContent" placeholder="留言"></textarea>
					</div>
					<button class="button button-postComment button--active messageBtn" type="button" style="border: none">發表評論</button>
				</form>
			</div>
				<button class="DetailedMessageKeyInput" style="margin-left:700px">一鍵輸入</button>
		</div>
			<!--=================================-->
			
			
		<div class="col-lg-4">
			<div class="blog_right_sidebar">
<!-- 					<aside class="single_sidebar_widget author_widget"> -->
<%-- 						<img width='150' src="<c:url value='/getPicturefromMember/${forumContent.picId}'/>" /> --%>
<%-- 						<h4 class="Username">${forumContent.userName}</h4> --%>
<!-- 						<p>一般會員</p> -->
<!-- 						<div class="social_icon"> -->
<!-- 							<a href="#"> <i class="fab fa-facebook-f"></i> -->
<!-- 							</a> <a href="#"> <i class="fab fa-twitter"></i> -->
<!-- 							</a> <a href="#"> <i class="fab fa-github"></i> -->
<!-- 							</a> <a href="#"> <i class="fab fa-behance"></i> -->
<!-- 							</a> -->
<!-- 						</div> -->
<!-- 						<div class="br"></div> -->
<!-- 					</aside> -->
<!-- 					<aside class="single_sidebar_widget post_category_widget"> -->
<!-- 						<h4 class="widget_title">標籤分類</h4> -->
<!-- 						<ul class="list cat-list"> -->
<%-- 							<li><a href="<c:url value='/forum' />" --%>
<!-- 								class="d-flex justify-content-between"> -->
<!-- 									<p>所有討論</p> -->
<%-- 									<p>${allSize}</p> --%>
<!-- 							</a></li> -->
<%-- 							<li><a href="<c:url value='/announcement' />" --%>
<!-- 								class="d-flex justify-content-between"> -->
<!-- 									<p>官方最新公告</p> -->
<%-- 									<p>${announcementSize}</p> --%>
<!-- 							</a></li> -->
<%-- 							<li><a href="<c:url value='/featured' />" --%>
<!-- 								class="d-flex justify-content-between"> -->
<!-- 									<p>社團精選話題</p> -->
<%-- 									<p>${featuredSize}</p> --%>
<!-- 							</a></li> -->
<%-- 							<li><a href="<c:url value='/noviceSeller' />" --%>
<!-- 								class="d-flex justify-content-between"> -->
<!-- 									<p>新手賣家發問</p> -->
<%-- 									<p>${noviceSellerSize}</p> --%>
<!-- 							</a></li> -->
<%-- 							<li><a href="<c:url value='/sellerChat' />" --%>
<!-- 								class="d-flex justify-content-between"> -->
<!-- 									<p>賣家閒聊討論</p> -->
<%-- 									<p>${sellerChatSize}</p> --%>
<!-- 							</a></li> -->
<!-- 						</ul> -->
<!-- 						<div class="br"></div> -->
<!-- 					</aside> -->
<!-- 					<aside class="single_sidebar_widget popular_post_widget"> -->
<!-- 						<h3 class="widget_title">精選話題</h3> -->
<%-- 						<c:forEach var='content' items='${tagFeatured}' begin="0" end="2"> --%>
<!-- 							<div class="media post_item"> -->
<!-- 								<img width='40' -->
<%-- 									src="<c:url value='/getPicturefromMember/${content.picId}'/>" /> --%>
<!-- 								<div class="media-body"> -->
<!-- 									<a href="single-blog.html"> -->
<%-- 										<h3>${content.title}</h3> --%>
<!-- 									</a> -->
<%-- 									<p>${content.date}</p> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<%-- 						</c:forEach> --%>
<!-- 						<div class="br"></div> -->
<!-- 					</aside> -->

					<!--================ 最新帖子 =================-->
			<aside class="single_sidebar_widget popular_post_widget">
				<h3 class="widget_title">最新帖子</h3>
				<c:forEach var='content' items='${getAll}' begin="0" end="15">
					<div class="media post_item">
						<img width='40' src="<c:url value='/getPicturefromMember/${content.picId}'/>" />
						<div class="media-body">
							<a href="<c:url value='/detailed' />?id=${content.id}">
								<h3>${content.title}</h3>
							</a>
							<p>${content.date}</p>
						</div>
					</div>
				</c:forEach>
				<div class="br"></div>
			</aside>
			<!--=================================-->
					</div>
				</div>
			</div>
		</div>
	</section><br><br>
	<!--================Blog Area =================-->


	<!--================Instagram Area =================-->
	<section class="instagram_area">
		<div class="container box_1620">
			<div class="instagram_image row m0">
				<a href="#"><img src="img/instagram/ins-1.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-2.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-3.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-4.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-5.jpg" alt=""></a> <a
					href="#"><img src="img/instagram/ins-6.jpg" alt=""></a>
			</div>
		</div>
	</section>
	<!--================End Instagram Area =================-->


	<!--================ Start footer Area  =================-->
	<footer>
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>So seed seed green that winged cattle in. Gathering thing
								made fly you're no divided deep moved us lan Gathering thing us
								land years living.</p>
							<p>So seed seed green that winged cattle in. Gathering thing
								made fly you're no divided deep moved</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="img/gallery/r1.jpg" alt=""></li>
								<li><img src="img/gallery/r2.jpg" alt=""></li>
								<li><img src="img/gallery/r3.jpg" alt=""></li>
								<li><img src="img/gallery/r5.jpg" alt=""></li>
								<li><img src="img/gallery/r7.jpg" alt=""></li>
								<li><img src="img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span> Head Office
								</p>
								<p>123, Main Street, Your City</p>

								<p class="sm-head">
									<span class="fa fa-phone"></span> Phone Number
								</p>
								<p>
									+123 456 7890 <br> +123 456 7890
								</p>

								<p class="sm-head">
									<span class="fa fa-envelope"></span> Email
								</p>
								<p>
									free@infoexample.com <br> www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->



	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="vendors/skrollr.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src='js/forum_jquery_32.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src='js/forum_summernote_32.js'></script>
</body>
</html>