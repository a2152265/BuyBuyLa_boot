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
<title>Details</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet"
	href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="css/productstyle.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/style32.css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript"
	src='${pageContext.request.contextPath}/js/forum_upd_32.js'></script>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<a class="navbar-brand logo_h" href="<c:url value='/' />"><img
						src="img/logo.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto mr-auto">
							<li class="nav-item active"><a class="nav-link"
								href="<c:url value='/' />">Home</a></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">會員</a>
								<ul class="dropdown-menu">
									<c:if
										test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/try/login' />">會員登入</a></li>
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/try/add' />">會員註冊</a></li>
									</c:if>
									<c:if test="${loginSession.userEmail != null}">
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/member/evolution' />">賣家專區</a></li>
										<li class="nav-item"><a class="nav-link"
											href="<c:url value='/try/logout' />">會員登出</a></li>
										<!--                   <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li> -->
									</c:if>
								</ul></li>
							<li class="nav-item submenu dropdown"><a
								href="<c:url value='/forum' />" class="nav-link dropdown-toggle"
								role="button" aria-haspopup="true" aria-expanded="false">討論區</a>
							</li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">活動專區</a>
								<!--                 <ul class="dropdown-menu"> --> <!--                   <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li> -->
								<!--                   <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li> -->
								<!--                   <li class="nav-item"><a class="nav-link" href="tracking-order.html">Tracking</a></li> -->
								<!--                 </ul> --></li>
							<c:if test="${loginSession.userEmail != null}">
								<li class="nav-item"><a class="nav-link loginsession"
									href="<c:url value='/try/member_Ui' />">Hi!!! &nbsp;
										${loginSession.userEmail}</a></li>
							</c:if>
						</ul>

						<ul class="nav-shop">
							<li class="nav-item"><form:form method='POST'
									action="./queryproduct" class='form-horizontal'>

									<input name="productName" id="productName" type='text'
										class='form:input-large' />
									<button type='submit'>
										<i class="ti-search"></i>
									</button>
									<!-- 							<input id="btnAdd" type='submit' -->
									<!-- 								class='btn btn-primary' /> -->

								</form:form>
							<li class="nav-item"><button
									onclick="location.href='<c:url value='/cart' />'">
									<i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span>
								</button></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	<!--================ End Header Menu Area =================-->


	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Details</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb"></nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

<div class="modal fade" id="UpdateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<form:form method='POST' modelAttribute="updateForumBean"
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
						<form:input path="userName" type="text" value="${memberUiDefault.userName}" class="forumUsername display-none" />
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
							<form:textarea path="content" class="form-control updContent display-none"
								placeholder="請輸入內文" rows="7" id="recipient-name" />
							<form:input class="form-control" path="picId" type="hidden" value="${memberUiDefault.id}" />
								
							<div id="summernote2"></div>
							<div class="mb-3">
								<form:input class="form-control display-none" path="image" id="insImgBtn" type="file" />
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

	<!--================Blog Area =================-->
	<section
		class="blog_area single-post-area py-80px section-margin--small">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img">
								<img class="img-fluid" src="img/blog/feature-img1.jpg" alt="">
							</div>
						</div>

						<div class="col-lg-9 col-md-9 blog_details">
								<div class="editIMG">
								<img id="edit" data-bs-toggle="dropdown" aria-expanded="false"
									class="dropdown-toggle editml700w50h50"
									src="https://cdn-icons-png.flaticon.com/128/1827/1827933.png">
								<ul class="dropdown-menu">
									<li data-id="${fb.id}" data-bs-toggle="modal"
										data-bs-target="#UpdateModal" class="dropdown-item updateDataClass">編輯</li>
									<li  class="dropdown-item tata"
										onclick="if(window.confirm('確定要刪除？')) location.href =' <c:url value='/delete32?id=${fb.id}'/>'">刪除</li>
						<!-- 			<li><a class="dropdown-item" href="#">隱藏此用戶貼文</a></li> -->
						<!-- 			<li><a class="dropdown-item" href="#">檢舉</a></li> -->
								</ul>
								</div>
							<h1>${fb.title}</h1>
							<br> <br> <br>
							<p class="excert">${fb.content}</p>
						</div>
					</div>
					<div class="navigation-area">
						<div class="row">
							<div
								class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
								<div class="thumb">
									<a href="#"> <img class="img-fluid" src="img/blog/prev.jpg"
										alt="">
									</a>
								</div>
								<div class="arrow">
									<a href="#"> <span class="lnr text-white lnr-arrow-left"></span>
									</a>
								</div>
								<div class="detials">
									<p>上一篇</p>
									<a href="#">
										<h4>Space The Final Frontier</h4>
									</a>
								</div>
							</div>
							<div
								class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
								<div class="detials">
									<p>下一篇</p>
									<a href="#">
										<h4>Telescopes 101</h4>
									</a>
								</div>
								<div class="arrow">
									<a href="#"> <span class="lnr text-white lnr-arrow-right"></span>
									</a>
								</div>
								<div class="thumb">
									<a href="#"> <img class="img-fluid" src="img/blog/next.jpg"
										alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="comments-area">
						<h4>${size}則評論</h4>

						<c:forEach var='msg' items='${msg}'>
							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img width='150' src="<c:url value='/getPicturefromMember/${msg.picId}'/>" />
										</div>
										<div class="desc">
											<h5>
												<a href="#">${msg.userName}</a>
											</h5>
											<p class="date">${msg.date}</p>
											<p class="comment">${msg.messageContent}</p>
										</div>
									</div>
									<div class="reply-btn">
										<a href="#" class="btn-reply text-uppercase">回復</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="comment-form">
						<h4>發表評論</h4>
						<form:form method='POST' modelAttribute="messageBean"
							class='form-horizontal'>
							<form:input type="hidden" path="forumId" value="${forumId}" />
							<form:input type="hidden" path="picId" value="${memberUiDefault.id}" />
							<form:input type="hidden" path="userName" value="${memberUiDefault.userName}" />
							<form:input type="hidden" path="userEmail" value="c123@gmail.com" />
							<form:input type="hidden" path="date" id="messageDate" />

							<div class="form-group form-inline">
								<div class="form-group col-lg-6 col-md-6 name">
									<input type="text" class="form-control"
										value="${memberUiDefault.userName}" readonly="readonly">
								</div>
								<div class="form-group col-lg-6 col-md-6 email">
									<input type="email" class="form-control" readonly="readonly"
										placeholder="Enter email address"
										value="${memberUiDefault.userEmail}">
								</div>
							</div>
<!-- 							<div class="form-group"> -->
<!-- 								<textarea class="form-control mb-10" rows="5" name="message" -->
<!-- 									placeholder="Messege" onfocus="this.placeholder = ''" -->
<!-- 									onblur="this.placeholder = 'Messege'" required="true"></textarea> -->
<!-- 							</div> -->
							<div class="form-group">
								<form:textarea path="messageContent" rows="5" class="form-control mb-10"
									placeholder="留言"  required="true" />
							</div>

							<button class="button button-postComment button--active"
								type="submit">發表評論</button>
						</form:form>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="搜尋文章"> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="lnr lnr-magnifier"></i>
									</button>
								</span>
							</div>
							<!-- /input-group -->
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget author_widget">
							<img width='150' src="<c:url value='/getPicturefromMember/${fb.picId}'/>" />
							<h4 class="forumUsername2">${fb.userName}</h4>
							<p>一般會員</p>
							<div class="social_icon">
								<a href="#"> <i class="fab fa-facebook-f"></i>
								</a> <a href="#"> <i class="fab fa-twitter"></i>
								</a> <a href="#"> <i class="fab fa-github"></i>
								</a> <a href="#"> <i class="fab fa-behance"></i>
								</a>
							</div>
							<div class="br"></div>
						</aside>

						<aside class="single_sidebar_widget ads_widget">
							<a href="#"> <img class="img-fluid" src="img/blog/add.jpg"
								alt="">
							</a>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">標籤分類</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex justify-content-between">
										<p>官方最新公告區</p>
										<p>37</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>新手賣家發問區</p>
										<p>24</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>賣家閒聊討論區</p>
										<p>59</p>
								</a></li>
							</ul>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">最新帖子</h3>
							<div class="media post_item">
								<img style="width: 40px;"
									src="data:image/png;base64,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"
									alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>太空最後的邊疆</h3>
									</a>
									<p>2小時前</p>
								</div>
							</div>
							<div class="media post_item">
								<img style="width: 40px;"
									src="data:image/jpeg;base64,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"
									alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>可可</h3>
									</a>
									<p>5小時前</p>
								</div>
							</div>
							<div class="br"></div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->


	<!--================Instagram Area =================-->
	<section class="instagram_area">
		<div class="container box_1620">
			<div class="insta_btn">
				<a class="btn theme_btn" href="#">Follow us on instagram</a>
			</div>
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
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
	<!-- 	<script src="vendors/nice-select/jquery.nice-select.min.js"></script> -->
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_jqu_32.js'></script>
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_sum_32.js'></script>
</body>
</html>