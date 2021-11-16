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
<link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="css/productstyle.css">


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href='css/style32.css' rel='stylesheet' >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src='js/forum_32/forum_ajax_32.js'></script>
<script src='js/forum_32/forum_keyInput_32.js'></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
		<div class="main_menu bg-white">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<a class="navbar-brand logo_h" href="<c:url value='/' />"><img
						src="img/logo.png"></a>
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
								href="<c:url value='/' />">首頁</a></li>
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
							</li>
							<c:if test="${loginSession.userEmail != null}">
								<li class="nav-item"><a class="nav-link loginsession"
									href="<c:url value='/try/member_Ui' />">Hi!!! &nbsp;
										${loginSession.userName}</a></li>
							</c:if>
						</ul>
						<ul class="nav-shop">
						<li class="nav-item">
						<input type='text' class='form:input-large serachText' list="browsers" placeholder="搜尋作者" />
 						<datalist id="browsers"></datalist>
 						<button class='searchBtn'><i class="ti-search"></i></button>
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
	<!--================Blog Categorie Area =================-->
	<section class="blog_categorie_area" style="padding: 60px">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
					<div class="categories_post">
						<img class="card-img rounded-0"
							style="width: 200px; height: 150px"
							src="img/forum/473-200x151.jpg" alt="post">
						<div class="categories_details">
							<div class="categories_text">
								<a href="<c:url value='/announcement' />">
									<h5>官方最新公告</h5>
								</a>
								<div class="border_line"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
					<div class="categories_post">
						<img class="card-img rounded-0"
							style="width: 200px; height: 150px"
							src="img/forum/1026-200x150.jpg">
<!-- 							src="https://picsum.photos/200/150"> -->
						<div class="categories_details">
							<div class="categories_text">
								<a href="<c:url value='/featured' />">
									<h5>社團精選話題</h5>
								</a>
								<div class="border_line"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-lg-4 mb-4 mb-lg-0">
					<div class="categories_post">
						<img class="card-img rounded-0"
							style="width: 200px; height: 150px"
							src="img/forum/692-200x152.jpg" alt="post">
						<div class="categories_details">
							<div class="categories_text">
								<a href="<c:url value='/sellerChat' />">
									<h5>賣家閒聊討論</h5>
								</a>
								<div class="border_line"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			
	</section>
	<!--================Blog Categorie Area =================-->

	<!--================Blog Area =================-->
	<section class="blog_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-4"></div>
				<div class="col-lg-8">
					<ol class="breadcrumb bg-white">
						<li class="breadcrumb-item"><a href="#">BuyBuyLa</a></li>
						<li class="breadcrumb-item" aria-current="page">${Breadcrumb}</li>
					</ol>
				</div>
				
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
<!-- 						<aside class="single_sidebar_widget search_widget"> -->
<!-- 							<div class="input-group"> -->
<!-- 								<input type="text" class="form-control serachText" list="browsers" placeholder="搜尋作者"> -->
<!-- 								<datalist id="browsers"></datalist> -->
<!-- 								<span class="input-group-btn"> -->
<!-- 									<button class="btn btn-default searchBtn" type="button"> -->
<!-- 										<i class="lnr lnr-magnifier"></i> -->
<!-- 									</button> -->
<!-- 								</span> -->
<!-- 							</div> -->
<!-- 							<div class="br"></div> -->
<!-- 						</aside> -->
						
						<!-- ================ 發表討論 ================= -->
						<aside class="single_sidebar_widget popular_post_widget addNewForumBlock">
							<h3 class="widget_title addNewForum" data-bs-toggle="modal" style='cursor:pointer;'
								data-bs-target="#Modal">發表討論</h3>
							<div class="br"></div>
						</aside>
						
				<!-- ================ 標籤分類 ================= -->
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">標籤</h4>
							<ul class="list cat-list">
								<li><a href="<c:url value='/forum' />"
									class="d-flex justify-content-between">
										<p>所有討論</p>
										<p>${allSize}</p>
								</a></li>
								<li><a href="<c:url value='/announcement' />" class="d-flex justify-content-between">
										<p>官方最新公告</p>
										<p>${announcementSize}</p>
								</a></li>
								<li><a href="<c:url value='/featured' />" class="d-flex justify-content-between">
										<p>社團精選話題</p>
										<p>${featuredSize}</p>
								</a></li>
								<li><a href="<c:url value='/noviceSeller' />" class="d-flex justify-content-between">
										<p>新手賣家發問</p>
										<p>${noviceSellerSize}</p>
								</a></li>
								<li><a href="<c:url value='/sellerChat' />" class="d-flex justify-content-between">
										<p>賣家閒聊討論</p>
										<p>${sellerChatSize}</p>
								</a></li>
							</ul>
							<div class="br"></div>
						</aside>
						<!-- ================================= -->
						<!-- ================ 熱門文章 ================= -->
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title hotArticles">熱門文章</h3>
							<div id="hotArticles"></div>
							<div class="br"></div>
						</aside>
						<!-- ================================= -->
						
						<!-- ================ 最新帖子 ================= -->
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">最新帖子</h3>
							<div id="newArticles"></div>
							<div class="br"></div>
						</aside>
						<!-- ================================= -->
						
					</div>
				</div>
				<!-- ================================= -->
				<div class="col-lg-8">
				<div>
					<select class="right" onChange="location = this.options[this.selectedIndex].value;">
					<option value="forum">最新</option>
					<option value="forumHot">最熱門</option>
					</select>
				</div>
					
				<!-- ================ 帖子 ================= -->
					<div class="blog_left_sidebar bg-light allArticles">
						<c:forEach var='Articles' items='${Articles}' varStatus='c'>
							<article class="row blog_item bg-light" style="margin: 0px">
								<div class="col-md-12">
									<div class="blog_post">
										<div class="blog_details" style="margin-left: 20px">
											<div>
												<img style="float: left; width: 40px; height: 40px; border-radius: 50%"
													src="<c:url value='/getPicturefromMember/${Articles.picId}'/>">
												<span style="margin-left: 15px">${Articles.userName}<br>
												<span style="margin-left: 15px; font-size: 13px; color: gray;">${Articles.date}</span>
												</span>
											</div>
											<div>
											<h2><a style='color:black' href="<c:url value='/detailed' />?id=${Articles.id}">${Articles.title}</a></h2>
											<div class="box"><div class="ellipsis">${Articles.content}</div></div>
											<a style="margin-left: 300px;" class="button button-blog addViewQty" id="${Articles.id}" href="<c:url value='/detailed' />?id=${Articles.id}">View More</a>
											</div>
												<br> 
											<span style="color: #00BFA5; font-size: 14px">${Articles.tag} </span>
											<span><a><img style="width: 15px; margin-left: 50px" src="img/forum/likeView.png">
											<span style="font-size: 14px; margin-left: 0px;">${Articles.likeQty} Likes</span></a></span>
											<span><a><img style="width: 15px; margin-left: 10px" src="img/forum/speech-bubble.png">
											<span style="font-size: 14px; margin-left: 5px;">${Articles.messageQty} Comments</span></a></span>
											<span><a><img style="width: 15px; margin-left: 10px" src="img/forum/eye.png">
											<span style="font-size: 14px; margin-left: 5px;">${Articles.viewQty} Views</span></a></span>
											<hr>
										</div>
									</div>
								</div>
									<div>
								</div>
							</article>
						</c:forEach>
						
						
						<!-- ================ 發起討論Model ================= -->
						<div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg" style="margin-top: 90px">
								<form:form method='POST' modelAttribute="addForumBean" action="addNewForum" class='form-horizontal' enctype="multipart/form-data">
									<div class="modal-content">
										<div class="modal-header">
<!-- 											<h3 class="modal-title" id="exampleModalLabel">發起討論</h3> -->
												<select id="insSelectTag" aria-label="Default select example">
													<option>新手賣家發問</option>
													<option>賣家閒聊討論</option>
												</select>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body insContentBody">
											<form:input path="tag" type="hidden" id="insTag" />
											<form:textarea path="content" class="content display-none" />
											<form:input path="date" type="hidden" id="nowDate" />
											<form:input path="identification" type="hidden" value="member" />
											<form:input path="picId" class="form-control" type="hidden" value="${loginSession.id}" />
											<form:input path="userName" type="hidden" value="${loginSession.userName}" />
											<form:input path="userEmail" type="hidden" value="${loginSession.userEmail}" />
											<form:input path="userNickname" type="hidden" value="${loginSession.userNickname}" />
											<form:input path="Identification" type="hidden" value="member" />
											<form:input path="topArticle" type="hidden" value="general" />
											<div class="mb-3">
												<form:input type="text" path="title" required="true"
													placeholder="標題" class="form-control title-fontsize titleKeyInput"
													aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" />
												<br>
													<div id="summernote"></div>
												</div>
											</div>
											<div class="modal-footer">
												<button id="insSubmit" type="submit" class="btn btn-primary">送出</button>
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">取消</button>
												<button class="addNewForumKeyInput" type="button">一鍵輸入</button>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						
						<!-- ================ 分頁 ================= -->
						<nav class="blog-pagination justify-content-center d-flex" style="padding-bottom: 0px;">
							<ul class="pagination">
								<li class="page-item">
								<a href="<c:url value="/PageLeft" />?tag=${tag}&page=${leftPage}" class="page-link" aria-label="Previous"> 
								<span aria-hidden="true"> <span class="lnr lnr-chevron-left"></span></span>
								</a>
								</li>
								<c:forEach items="${pageSize}" varStatus="c" step="5">
									<li class="page-item">
									<a href="<c:url value="/Page" />?tag=${tag}&page=${c.count}"> 
									<input type="button" class="page-link forumPageBtn" style="border: none" value="${c.count}">
									</a>
									</li>
								</c:forEach>
								<li class="page-item">
								<a href="<c:url value="/PageRight" />?tag=${tag}&page=${rightPage}" class="page-link" aria-label="Next"> 
								<span aria-hidden="true"><span class="lnr lnr-chevron-right"></span></span>
								</a>
								</li>
							</ul>
						</nav>
						<div style="text-align: center;">第<label class="pages">${page}</label>頁</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<!--================Blog Area =================-->
	
	
	<!--================Instagram Area =================-->
	<section class="instagram_area">
		<div class="container box_1620">
			<div class="insta_btn">
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
							<p>BuyBuyLa購物是台灣首屈一指的電商平台，在東南亞六國皆有佈局（新加坡、馬來西亞、泰國、印尼、越南、菲律賓），簡易方便的操作介面讓你隨時隨地都能輕鬆購物！BuyBuyLa購物擁有完整的金流、物流服務，提供多種安全可靠的付款方式，包含銀行轉帳、信用卡線上交易、貨到付款、蝦皮錢包，和街口支付等多元行動支付管道，更有蝦皮承諾保障你的交易安全，啟動第三方支付託管交易款項，無須擔心收不到訂購的商品、或是拿不到退還的金額。商品評價和評論透明呈現在你眼前，你可以快速挑選出商品受歡迎、並提供良好服務、得到買家一致推薦的賣家；還能夠透過購買清單中的訂單詳情獲得最即時的貨態追蹤，查詢訂單最新配送進度。現在就來加入蝦皮購物，享受最獨一無二的網路購物體驗！</p>
							<p></p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">快速連結</h4>
							<ul class="list">
								<li><a href="#">首頁</a></li>
								<li><a href="#">商品</a></li>
								<li><a href="#">討論版</a></li>
								<li><a href="#">購物車</a></li>
								<li><a href="#">活動</a></li>
							</ul>
						</div>
					</div>
					
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
							<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">聯絡我們</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									總部
								</p>
								<p>台北市中正區重慶南路一段122號</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									電話
								</p>
								<p>
									+0921212121 <br>
									+0226462646
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									電子信箱
								</p>
								<p>
									a212121@BuyBuyLa.org <br>
									
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
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src='js/forum_32/forum_jquery_32.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src='js/forum_32/forum_summernote_32.js'></script>

</body>
</html>