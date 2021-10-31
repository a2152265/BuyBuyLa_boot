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
<title>BuyBuyLa討論區</title>
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
	src='${pageContext.request.contextPath}/js/forum_ajax_32.js'></script>

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
					<h1>BuyBuyLa</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">討論區</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Blog Area =================-->
	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="blog_left_sidebar">

						<c:forEach var='content' items='${content}'>
							<article class="row blog_item">
								<div class="col-md-3">
									<div class="blog_info text-right">
										<div class="post_tag">
											<a href="#">${content.tag}</a>
										</div>
										<ul class="blog_meta list" style="padding:0;width:200px">
											<li><a href="#">${content.userName} <i
													class="lnr lnr-user"></i>
											</a></li>
											<li><a href="#">${content.date} <i
													class="lnr lnr-calendar-full"></i>
											</a></li>
											<li><a href="#">123 <i class="lnr lnr-eye"></i>
											</a></li>
											<li><a href="#">${content.messageQty}<i class="lnr lnr-bubble"></i>
											</a></li>
										</ul>
									</div>
								</div>
								<div class="col-md-9">
									<div class="blog_post">
										<div class="blog_details">
											<h2>${content.title}</h2>
											<div class="box">
												<div class="card-text ellipsis">${content.content}</div>
											</div>
											<a class="button button-blog"
												href="<c:url value='/detailed' />?id=${content.id}">View
												More</a>
										</div>
									</div>
								</div>
							</article>
						</c:forEach>

					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<input type="button" value="發起討論" class="widget_title newFoRuM"
								style="width: 354px; border: none;" data-bs-toggle="modal"
								data-bs-target="#Modal">
							<div class="modal fade" id="Modal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg" style="margin-top: 90px">
									<form:form method='POST' modelAttribute="addForumBean"
										class='form-horizontal' enctype="multipart/form-data">
										<div class="modal-content">
											<div class="modal-header">
												<h3 class="modal-title" id="exampleModalLabel">建立貼文</h3>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body insContentBody">

												<!-- 隱藏 -->
												<form:input path="tag" type="hidden" id="insTag" />
												<form:textarea path="content" class="content display-none" />
												<form:input path="date" type="hidden" id="nowDate" />
												<form:input path="messageQty" type="hidden"  />
												
												<form:input path="picId" class="form-control" type="hidden" value="${memberUiDefault.id}" />
												<form:input path="userName" type="hidden" value="${memberUiDefault.userName}" />
												<form:input path="userEmail" type="hidden" value="${memberUiDefault.userEmail}" />
												<form:input path="userNickname" type="hidden" value="${memberUiDefault.userNickname}" />
<%-- 												<form:input path="Identification" type="hidden" value="${memberUiDefault.Identification}" /> --%>
												<!-- 結束 -->

												<div class="mb-3">
												<select id="insSelectTag" class="form-select"
													aria-label="Default select example">
													<option>新手賣家發問</option>
													<option>賣家閒聊討論</option>
												</select>
													<br>
													<form:input type="text" path="title" required="true"
														placeholder="標題" class="form-control title-fontsize"
														aria-label="Sizing example input"
														aria-describedby="inputGroup-sizing-lg" />
													<br>
													<div id="summernote"></div>
													<div class="mb-3"></div>
												</div>
											</div>
											<div class="modal-footer">
												<button id="insSubmit" type="submit" class="btn btn-primary">送出</button>
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">取消</button>
											</div>
										</div>
									</form:form>
								</div>
							</div>


							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">標籤分類</h4>
							<ul class="list cat-list">
								<li><a href="<c:url value='/forum' />"
									class="d-flex justify-content-between">
										<p>所有討論</p>
										<p>${announcementSize+noviceSellerSize+sellerChatSize}</p>
								</a></li>
								<li><a href="<c:url value='/announcement' />"
									class="d-flex justify-content-between">
										<p>官方最新公告</p>
										<p>${announcementSize}</p>
								</a></li>
								<li><a href="<c:url value='/noviceSeller' />"
									class="d-flex justify-content-between">
										<p>新手賣家發問</p>
										<p>${noviceSellerSize}</p>
								</a></li>
								<li><a href="<c:url value='/sellerChat' />"
									class="d-flex justify-content-between">
										<p>賣家閒聊討論</p>
										<p>${sellerChatSize}</p>
								</a></li>
							</ul>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">最新帖子</h3>

							<c:forEach var='content' items='${content}' begin="0" end="4">
								<div class="media post_item">
									<img width='40'
										src="<c:url value='/getPicturefromMember/${content.picId}'/>" />
									<div class="media-body">
										<a href="single-blog.html">
											<h3>${content.title}</h3>
										</a>
										<p>${content.date}</p>
										<!--                                   <p>?小時前</p> -->
									</div>
								</div>
							</c:forEach>

						</aside>
						<aside class="single_sidebar_widget ads_widget">
							<a href="#"> <img class="img-fluid" src="img/blog/add.jpg"
								alt="">
							</a>
							<div class="br"></div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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
	<!--   <script src="vendors/nice-select/jquery.nice-select.min.js"></script> -->
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
	<!-- jquery -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_jquery_32.js'></script>
	<!-- summernote -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_summernote_32.js'></script>

</body>
</html>