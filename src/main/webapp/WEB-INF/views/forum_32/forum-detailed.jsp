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
<script type="text/javascript"
	src='${pageContext.request.contextPath}/js/forum_ajax_message_32.js'></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
		<div class="modal-dialog modal-lg" style="margin-top:90px">
			<form:form method='POST' modelAttribute="updateForumBean"
				class='form-horizontal' enctype="multipart/form-data">
				<div class="modal-content">
					<div class="modal-header">
						<select id="updSelectTag" class="form-select"
							aria-label="Default select example">
							<option>新手賣家發問</option>
							<option>賣家閒聊討論</option>
						</select>
						<h3 class="modal-title" id="exampleModalLabel">編輯貼文</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body updContentBody">
					
						<!-- 隱藏 -->
						<form:input path="id" id="updid" type="hidden" />
						<form:input path="tag" id="updTag" type="hidden" />
						<form:textarea path="content" class="updContent display-none" />
						<form:input path="date" id="nowUpdDate" type="hidden"  />
						<form:input path="messageQty" type="hidden" value="${messageSize}"  />
						
						<form:input path="picId" type="hidden" value="${memberUiDefault.id}" />
						<form:input path="userName" type="hidden" value="${memberUiDefault.userName}" class="forumUsername" />
						<form:input path="userEmail" type="hidden" value="${memberUiDefault.userEmail}" />
						<form:input path="userNickname" type="hidden" value="${memberUiDefault.userNickname}" />
<%-- 						<form:input path="Identification" type="hidden" value="${memberUiDefault.Identification}" /> --%>
						<!-- 結束 -->
						
						<div class="mb-3">
							<br>
							<form:input type="text" required="true" placeholder="標題"
								path="title"
								class="form-control updTitle title-fontsize" aria-label="Sizing example input"
								aria-describedby="inputGroup-sizing-lg" />
							<br>
							
							<div id="summernote"></div>
							<div class="mb-3">
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
						<h4>${messageSize}則評論</h4>

						<c:forEach var='msg' items='${msg}'>
							<div class="comment-list">
								<div class="single-comment justify-content-between d-flex">
									<div class="user justify-content-between d-flex">
										<div class="thumb">
											<img style="width:100px;height:100px" src="<c:url value='/getPicturefromMember/${msg.messagePicId}'/>" />
										</div>
										<div class="desc">
											<h5>
												<a href="#">${msg.messageUserName}</a>
											</h5>
											<p class="date">${msg.messageDate}</p>
											<p class="comment">${msg.messageContent}</p>
										</div>
									</div>
									<div class="reply-btn">
										<a href='#reply'>
										<button style="border:none;" class="btn-reply text-uppercase reply">回復</button>
										</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="comment-form" id="reply">
						<h4>發表評論</h4>
						<form id="addMsgForm" enctype="multipart/form-data">
							<input type="hidden" name="messageForumId" value="${forumId}" >
							<input type="hidden" name="messagePicId" value="${memberUiDefault.id}" >
							<input type="hidden" name="messageDate" id="messageDate" >
							<input type="hidden" name="messageIdentification" >
							<div class="form-group form-inline">
							<div class="form-group col-lg-6 col-md-6 name">
							<input type="text" name="messageUserName" class="form-control" value="${memberUiDefault.userName}" readonly="readonly">
								</div>
								<div class="form-group col-lg-6 col-md-6 email">
							<input type="email" name="messageUserEmail" class="form-control" readonly="readonly"
										placeholder="Enter email address" 
										value="${memberUiDefault.userEmail}" >
								</div>
							</div>
							<div class="form-group">
							<textarea rows="5" name="messageContent" class="form-control mb-10 messageContent"
									placeholder="留言"  required="required"></textarea>
							</div>
							<button class="button button-postComment button--active messageBtn" type="button">發表評論</button>
							</form>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
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
                              <li>
                                  <a href="<c:url value='/forum' />" class="d-flex justify-content-between">
                                      <p>所有討論</p>
                                      <p>${announcementSize+noviceSellerSize+sellerChatSize}</p>
                                  </a>
                              </li>
                              <li>
                                  <a href="<c:url value='/announcement' />" class="d-flex justify-content-between">
                                      <p>官方最新公告</p>
                                      <p>${announcementSize}</p>
                                  </a>
                              </li>
                              <li>
                                  <a href="<c:url value='/noviceSeller' />" class="d-flex justify-content-between">
                                      <p>新手賣家發問</p>
                                      <p>${noviceSellerSize}</p>
                                  </a>
                              </li>
                              <li>
                                  <a href="<c:url value='/sellerChat' />" class="d-flex justify-content-between">
                                      <p>賣家閒聊討論</p>
                                      <p>${sellerChatSize}</p>
                                  </a>
                              </li>
                          </ul>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">最新帖子</h3>
							
						<c:forEach var='content' items='${content}' begin="0" end ="4">
                          <div class="media post_item">
                          <img width='40' src="<c:url value='/getPicturefromMember/${content.picId}'/>" />
                              <div class="media-body">
                                  <a href="single-blog.html">
                                      <h3>${content.title}</h3>
                                  </a>
                                  <p>${content.date}</p>
<!--                                   <p>?小時前</p> -->
                              </div>
                          </div>
                          </c:forEach>
							
							<div class="br"></div>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section><br><br><br><br><br><br><br><br><br>
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
	<script src='${pageContext.request.contextPath}/js/forum_jquery_32.js'></script>
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src='${pageContext.request.contextPath}/js/forum_summernote_32.js'></script>
</body>
</html>