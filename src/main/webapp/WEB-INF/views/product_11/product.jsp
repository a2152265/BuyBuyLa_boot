 	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>BuyBuyLa|</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="css/productstyle.css">
  <script src="https://www.line-website.com/social-plugins/js/thirdparty/loader.min.js" async="async" defer="defer"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="<c:url value='/' />"><img src="img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="<c:url value='/' />">首頁</a></li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">會員</a>
                <ul class="dropdown-menu">
                <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
	                   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/login' />">會員登入</a></li> 
                  	   <li class="nav-item"><a class="nav-link" href="<c:url value='/try/add' />">會員註冊</a></li>
               </c:if>
                <c:if test="${managerSession == null}">
               <c:if test="${loginSession.userEmail != null}">
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/member/evolution' />">賣家專區</a></li>
                  <li class="nav-item"><a class="nav-link" href="<c:url value='/try/logout' />">會員登出</a></li>
                </c:if>
                </c:if>
                 <c:if test="${managerSession != null}">
                   <li class="nav-item"><a class="nav-link" href="<c:url value='/manager_Ui' />">會員管理</a></li>
                    <li class="nav-item"><a class="nav-link" href="<c:url value='/try/logout' />">會員登出</a></li>
                    </c:if>
                </ul>
							</li>
              <li class="nav-item submenu dropdown">
                <a href="<c:url value='/forum' />" class="nav-link dropdown-toggle"  role="button" aria-haspopup="true"
                  aria-expanded="false">討論區</a>
							</li>
							<li class="nav-item submenu dropdown">
                <a href="<c:url value='/campaigns' />" class="nav-link dropdown-toggle" role="button" aria-haspopup="true"
                  aria-expanded="false">活動專區</a>

              </li>
              <c:if test="${loginSession.userEmail != null}">
              <li class="nav-item"><a class="nav-link" href="<c:url value='/try/member_Ui' />">Hi!!! &nbsp;
						${loginSession.userEmail}</a></li>
				</c:if>
            </ul>

            <ul class="nav-shop">
          
           <li class="nav-item" >
           
               <!---------------- 首頁查詢商品框 ---------------->
           			<form:form method='get' action="./queryproduct" class='form-horizontal'>
					<input name="productName" id="productName" type='text' class='form:input-large' />
					<button type='submit' ><i class="ti-search" ></i></button>
				</form:form>


              <!---------------- 購物車 ---------------->
				<c:if test="${loginSession.userEmail != null}">
              <li class="nav-item"><button onclick="location.href='<c:url value='/cart' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle" id='ccount'>${count}</span></button> </li>		
				</c:if>
				 <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
				 	<li class="nav-item"><button onclick="location.href='<c:url value='/try/login' />'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span></button> </li>
				 </c:if>
              
            </ul>
            
            <!---------------- 我的最愛 ---------------->
            <ul style="list-style-type: none; padding-left:10px" >
               <c:if test="${loginSession.userEmail != null}">
                <li><button style="border:0 ;background-color:transparent;" onclick="location.href='<c:url value='/member/favorite' />'"><i class="fas fa-heart"></i></button> </li>		
               </c:if>
                 <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
                <li ><button style="border:0 ;background-color:transparent;" onclick="location.href='<c:url value='/try/login' />'"><i class="fas fa-heart"></i></button> </li>		
               </c:if>
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
					<h1>${product.category}</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#"></a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Single</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


  <!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
 						<div class="single-prd-item"> 
 							<img class="img-fluid" src="<c:url value='/getPicture/${product.productId}'/>" alt=""> 
 						</div> 
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<c:if test="${product.point>0 }">
					<div class="s_product_text">
						<input id="productId" type="hidden" value="${product.productId}" />
						<h3>${product.productName}</h3>
					    <input  type='hidden' class='productName' name='address' value='${product.productName}'/>
						
						<h2 style="color:red">兌換點數:${product.point}</h2>
						<input  type='hidden' class='point' name='address' value='${product.point}'/>
						<ul class="list">
							<li><a class="active" href="<c:url value='/products/${product.category}' />"><span>產品分類</span> ${product.category}</a></li>
<%-- 							<li><a href="javascript:;"><span>庫存量</span>${product.stock}</a></li> --%>
						</ul>
						<br>
						<div class="product_count">


<!--               <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;" -->
<!-- 							 class="increase items-count" type="button"><i class="ti-angle-left"></i></button> -->
<%-- 							<input type="number" name="qty" id="sst" min="1" max="${product.stock}"  size="2" maxlength="12" value="1" title="Quantity:" class="input-text qty"> --%>
<!-- 							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;" -->
<!--                class="reduced items-count" type="button"><i class="ti-angle-right"></i></button> -->
							<input  type='hidden' class='pid2' name='address' value='${product.productId}'/>
							<a class="button primary-btn redeem" href="#" style="background-color:#8d0e3b;font-size:20px;font-weight:bolder">立&nbsp即&nbsp兌&nbsp換</a>                             

						</div>
<!-- 						<div class="card_area d-flex align-items-center"> -->
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${producrFavorite == null}"> --%>
<!-- 									<a id="addfavorite" class="icon_btn" ><i class="lnr lnr lnr-heart"></i></a> -->
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<!-- 									<a  id="deletefavorite" class="icon_btn" ><i class="fas fa-heart"></i></a> -->
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>

<%-- 						<div class="line-it-button" data-lang="zh_Hant" data-type="share-a" data-ver="3" data-url="http://localhost:8080/BuyBuyla_boot/product?id=${product.productId}" data-color="grey" data-size="small" data-count="true" style="display: none;"> --%>
<!-- 						</div> -->
<!-- 						</div> -->
						
					</div>
					</c:if>
					<c:if test="${product.point==0 }">
					<div class="s_product_text">
						<input id="productId" type="hidden" value="${product.productId}" />
						<h3>${product.productName}</h3>
						<h2>$${product.price}</h2>
						<ul class="list">
							<li><a class="active" href="<c:url value='/products/${product.category}' />"><span>產品分類</span> ${product.category}</a></li>
							<li><a href="javascript:;"><span>庫存量</span>${product.stock}</a></li>
						</ul>
						<br>
						<div class="product_count">




<!--               <label for="qty">Quantity:</label> -->

<!--               <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;" -->
<!-- 							 class="increase items-count" type="button"><i class="ti-angle-left"></i></button> -->
							<input type="number" name="qty" id="sst" min="1" max="${product.stock}"  size="2" maxlength="12" value="1" title="Quantity:" class="input-text qty">
<!-- 							<button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;" -->
<!--                class="reduced items-count" type="button"><i class="ti-angle-right"></i></button> -->

							<input  type='hidden' class='pid' name='address' value='${product.productId}'/>


<%-- 							<a class="button primary-btn" href="<c:url value='/additem' />?id=${product.productId}">Add to Cart</a>  --%>
							<input type='hidden' id='pid' class='pid' name='address' value='${product.productId}'/>

							<input class="button primary-btn additem"  type='button'style="width: 125px;border-radius: 80px;" value='   Add to Cart'/>                          



						</div>  
						<div class="card_area d-flex align-items-center">
							<c:choose>
								<c:when test="${producrFavorite == null}">
									<a id="addfavorite" class="icon_btn" ><i class="lnr lnr lnr-heart"></i></a>
								</c:when>
								<c:otherwise>
									<a  id="deletefavorite" class="icon_btn" ><i class="fas fa-heart"></i></a>
								</c:otherwise>
							</c:choose>

						<div class="line-it-button" data-lang="zh_Hant" data-type="share-a" data-ver="3" data-url="http://localhost:8080/BuyBuyla_boot/product?id=${product.productId}" data-color="grey" data-size="small" data-count="true" style="display: none;">
						</div>
						</div>
						
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Description</a>
				</li>
<!-- 				<li class="nav-item"> -->
<!-- 					<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" -->
<!-- 					 aria-selected="false">Specification</a> -->
<!-- 				</li> -->
				<li class="nav-item">
					<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
					 aria-selected="false">Comments</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">Reviews</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
					<p>${product.productInfo}</p>
					<p></p>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">

				</div>
				<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>${memberUiDefault.userEmail}</h4>
											<h5>${memberUiDefault.userName}</h5>
											<a class="reply_btn" href="#">查看賣場</a>
										</div>
									</div>
									<p></p>
								</div>
								
								
							</div>
						</div>
			
					</div>
				</div>
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>4.0</h4>
										<h6>(03 Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on 3 Reviews</h3>
										<ul class="list">
											<li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<c:forEach var='productComment' items='${productComment}'>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>${productComment.userEmail}</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>${productComment.content}</p>
									<p>${productComment.commentTime}</p>
								</div>
								
							        </c:forEach>
							
							</div>
						</div>
<!-- 						留言評論 -->
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Add a Review</h4>
								<p>Your Rating:</p>
								<ul class="list">
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
								</ul>
								<p>Outstanding</p>
			<c:if test="${loginSession.userEmail != null}">
                <form class="form-contact form-review mt-3">
                  <div class="form-group">
                    <input class="form-control" id="userEmail" name="userEmail" type="text" value="${loginSession.userEmail}"   readonly>
                  </div>
	<!--                   <div class="form-group"> -->
	<!--                     <input class="form-control" name="email" type="email" placeholder="Enter email address" required> -->
	<!--                   </div> -->
	<!--                   <div class="form-group"> -->
	<!--                     <input class="form-control" name="subject" type="text" placeholder="Enter Subject"> -->
	<!--                   </div> -->
                  <div class="form-group">
                    <textarea id="content" class="form-control different-control w-100" name="content" id="textarea" cols="30" rows="5" placeholder="Enter Message"></textarea>
                  </div>
                  <div class="form-group text-center text-md-right mt-3">
                    <button id="comment" type="button" class="button button--active button-review">Submit Now</button>
                  </div>
                </form>
             </c:if>
             <c:if test="${loginSession.userEmail == '' || loginSession.userEmail == null}">
                <form class="form-contact form-review mt-3">
                  <div class="form-group">
                    <input class="form-control" id="userEmail" name="userEmail" type="text" value="訪客"   readonly>
                  </div>
                  <div class="form-group">
                    <textarea id="content" class="form-control different-control w-100" name="content" id="textarea" cols="30" rows="5" placeholder="請先登入後方能進行留言" readonly></textarea>
                  </div>
                  <div class="form-group text-center text-md-right mt-3">
                  </div>
                </form>
             </c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

	<!--================ Start related Product area =================-->  
	<section class="related-product-area section-margin--small mt-0">
		<div class="container">
			<div class="section-intro pb-60px">
        <p>Popular Item in the market</p>
        <h2>Top <span class="section-intro__style">Product</span></h2>
      </div>
			<div class="row mt-30">
        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
         <c:forEach items="${sellerProduct}" var="product" begin="0" end="2">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="<c:url value='/getPicture/${product.productId}'/>" alt=""></a>
              <div class="desc">
                  <a href="<c:url value='/product?id=${product.productId}' />" class="title"
                  style="overflow:hidden;
					white-space: nowrap;
					text-overflow: ellipsis;
					display: -webkit-box;
					-webkit-line-clamp: 2;
					-webkit-box-orient: vertical;
					white-space: normal;"
                  >${product.productName}</a>
                  <div class="price">${product.price*product.discount}</div>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
         <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
         <c:forEach items="${sellerProduct}" var="product" begin="3" end="5">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="<c:url value='/getPicture/${product.productId}'/>" alt=""></a>
              <div class="desc">
                  <a href="<c:url value='/product?id=${product.productId}' />" class="title"
                  style="overflow:hidden;
					white-space: nowrap;
					text-overflow: ellipsis;
					display: -webkit-box;
					-webkit-line-clamp: 2;
					-webkit-box-orient: vertical;
					white-space: normal;"
                  >${product.productName}</a>
                  <div class="price">${product.price*product.discount}</div>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
          <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
         <c:forEach items="${sellerProduct}" var="product" begin="6" end="8">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="<c:url value='/getPicture/${product.productId}'/>" alt=""></a>
              <div class="desc">
                  <a href="<c:url value='/product?id=${product.productId}' />" class="title"
                  style="overflow:hidden;
					white-space: nowrap;
					text-overflow: ellipsis;
					display: -webkit-box;
					-webkit-line-clamp: 2;
					-webkit-box-orient: vertical;
					white-space: normal;"
                  >${product.productName}</a>
                  <div class="price">${product.price*product.discount}</div>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
          <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
         <c:forEach items="${sellerProduct}" var="product" begin="9" end="11">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="<c:url value='/getPicture/${product.productId}'/>" alt=""></a>
              <div class="desc">
                  <a href="<c:url value='/product?id=${product.productId}' />" class="title"
                  style="overflow:hidden;
					white-space: nowrap;
					text-overflow: ellipsis;
					display: -webkit-box;
					-webkit-line-clamp: 2;
					-webkit-box-orient: vertical;
					white-space: normal;"
                  >${product.productName}</a>
                  <div class="price">${product.price*product.discount}</div>
              </div>
            </div>
          </div>
          </c:forEach>
        </div>
      </div>
		</div>
	</section>
	<!--================ end related Product area =================-->  	

  <!--================ Start footer Area  =================-->	
	<footer>
		<div class="footer-area footer-only">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets ">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
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
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
  
  
  <script>
  $(".additem").click(function(){		


		var data=$(".pid").val();
		var qty=$("#sst").val();
		console.log(data)
		console.log(qty)

			$.ajax({
			type:'get',
			url:'additemFromproduct',
			data:{
				"id":data,
				"qty":qty
			},
			
			success:function(){
				Swal.fire({
					  position:'center',
					  icon: 'success',
					  title: '已加入購物車',
					  showConfirmButton: false,
					  timer: 1500
					})
			},error:function(){
				Swal.fire({
					  position:'center',
					  icon: 'error',
					  title: '加入購物車失敗 ! ! !',
					  text: '請登入會員',
					  showConfirmButton: false,
					  timer: 1500
					})
			}
									
		});		
		
		
	});

$('#comment').click(function() {
    
    
    var postData = new FormData($("#form")[0]);
     let userEmail= $('#userEmail').val();
     let content= $('#content').val();
     let productId= $('#productId').val();
  
    postData.append('userEmail', userEmail);
    postData.append('content', content);
    postData.append('productId', productId);
    

    
    $.ajax({
      url: "comment",
      type: "POST",
      data: postData,
      cache:false,
      //編碼設定
      processData: false, 
      contentType: false,
      success: function (data, textStatus, xhr) {
        console.log(data);
        console.log(textStatus);
        console.log(xhr.status);
        if (xhr.status == 200) {
        	window.location.reload();
         
        }
      },
      error: function (xhr, status) {
        console.log(xhr.status);
        console.log(status);
        swal.fire({
            icon: 'success',
            title: '您已對此商品評論，謝謝您',
            showConfirmButton: false,
            timer: 2000
          })
      }
    });



});

$("#addfavorite").click(function(){		
	
	var productId= $('#productId').val();
	console.log(productId);
		$.ajax({
		type:'get',
		url:'favorite',
		data:{
			"productId":productId
		},
		
		success:function(){
				window.location.reload();
		}						
	});		
	
	
});

$("#deletefavorite").click(function(){		

	var productId= $('#productId').val();
	console.log(productId);
		$.ajax({
		type:'get',
		url:'deletefavorite',
		data:{
			"productId":productId
		},
		
		success:function(){
				window.location.reload();
		}
								
	});		
	
	
});

$(".redeem").click(function(){		

	var id=$('.pid2').val();
	var point=$('.point').val();
	var productName=$('.productName').val();
		$.ajax({
		type:'get',
		url:'redeempoint',
		data:{
			"id":id,
			"point":point,
			"productName":productName
		},
		
		success:function(data,textStatus,xhr){
			 if(data=='failure'){
				 Swal.fire({
					  position:'center',
					  icon: 'error',
					  title: '點數不足，兌換失敗',
					  showConfirmButton: false,
					  timer: 1500
					})
			
			
			 }
			 else if(data=='success'){
				 Swal.fire({
					  position:'center',
					  icon: 'success',
					  title: '兌換成功',
					  showConfirmButton: false,
					  timer: 1500
					})
					
					 }
			 else if(data=='N'){
					
					Swal.fire({
						  position:'center',
						  icon: 'error',
						  title: '點數不足，兌換失敗',
						  showConfirmButton: false,
						  timer: 1500
						})
					 }
		},error:function(){
			Swal.fire({
				  position:'center',
				  icon: 'error',
				  title: '請登入會員',
// 				  text: '請登入會員',
				  showConfirmButton: false,
				  timer: 1500
				})
		}
								
	});		
	
	
});




</script>
  
  
</body>
</html>